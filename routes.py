import os
import uuid
import pandas as pd
from flask import Blueprint, render_template, redirect, url_for, flash, request, abort, current_app, send_file
from flask_login import login_user, logout_user, login_required, current_user
from werkzeug.utils import secure_filename
from io import BytesIO

from forms import RegisterForm, LoginForm, UploadForm
from models import Client, Project, Upload
from repositories.user_repository import get_user_by_username, create_user, list_users
from services.auth_service import ensure_admin
from services.analytics_service import get_dashboard_summary
from services.etl_service import process_upload_file
from utils import allowed_file, get_data_preview, export_dataframe_csv, export_dataframe_excel

main_bp = Blueprint("main", __name__)


@main_bp.route("/")
def index():
    return redirect(url_for("main.dashboard") if current_user.is_authenticated else url_for("main.login"))


@main_bp.route("/register", methods=["GET", "POST"])
def register():
    if current_user.is_authenticated:
        return redirect(url_for("main.dashboard"))
    form = RegisterForm()
    if form.validate_on_submit():
        existing = get_user_by_username(form.username.data)
        if existing:
            flash("Username already exists.", "danger")
        else:
            user = create_user(form.username.data, form.password.data)
            flash("Account created successfully. Please log in.", "success")
            return redirect(url_for("main.login"))
    return render_template("register.html", form=form)


@main_bp.route("/login", methods=["GET", "POST"])
def login():
    if current_user.is_authenticated:
        return redirect(url_for("main.dashboard"))
    form = LoginForm()
    if form.validate_on_submit():
        user = get_user_by_username(form.username.data)
        if user and user.check_password(form.password.data):
            login_user(user)
            flash(f"Welcome back, {user.username}!", "success")
            return redirect(request.args.get("next") or url_for("main.dashboard"))
        flash("Invalid username or password.", "danger")
    return render_template("login.html", form=form)


@main_bp.route("/logout")
@login_required
def logout():
    logout_user()
    flash("You have been logged out.", "info")
    return redirect(url_for("main.login"))


@main_bp.route("/dashboard", methods=["GET", "POST"])
@login_required
def dashboard():
    form = UploadForm()
    context = {"summary": None, "preview_html": None, "statistics": None, "chart_html": None, "uploads": current_user.uploads.all(), "error": None}

    if request.method == "POST" and form.validate_on_submit():
        upload = form.csv_file.data
        filename = secure_filename(upload.filename)
        if not allowed_file(filename):
            flash("Only CSV uploads are accepted.", "danger")
            return redirect(url_for("main.dashboard"))

        file_id = f"{uuid.uuid4().hex}_{filename}"
        filepath = os.path.join(current_app.config["UPLOAD_FOLDER"], file_id)
        os.makedirs(current_app.config["UPLOAD_FOLDER"], exist_ok=True)
        upload.save(filepath)

        try:
            df = process_upload_file(filepath)
            context["summary"] = df.summary
            context["statistics"] = df.statistics
            context["preview_html"] = get_data_preview(df.dataframe)
            flash(f"Upload processed: {filename}", "success")
        except Exception as exc:
            current_app.logger.error("Upload failed: %s", exc)
            context["error"] = str(exc)
            flash("Error processing upload.", "danger")

    return render_template(
        "dashboard.html",
        form=form,
        analytics=get_dashboard_summary(current_user),
        **context,
    )


@main_bp.route("/admin")
@login_required
def admin():
    ensure_admin(current_user)
    return render_template(
        "admin.html",
        users=list_users(),
        clients=Client.query.order_by(Client.created_at.desc()).all(),
        projects=Project.query.order_by(Project.updated_at.desc()).all(),
    )


@main_bp.route("/export/<string:format>")
@login_required
def export_data(format):
    format = format.lower()
    uploads = Upload.query.filter_by(user_id=current_user.id).all()
    if format not in {"csv", "xlsx"}:
        abort(404)

    df = pd.DataFrame([upload.to_dict() for upload in uploads])
    file_buffer = BytesIO()
    if format == "csv":
        export_dataframe_csv(df, file_buffer)
        mimetype = "text/csv"
        filename = "uploads.csv"
    else:
        export_dataframe_excel(df, file_buffer)
        mimetype = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        filename = "uploads.xlsx"

    file_buffer.seek(0)
    return send_file(file_buffer, attachment_filename=filename, as_attachment=True, mimetype=mimetype)


@main_bp.app_errorhandler(403)
def forbidden(error):
    return render_template("403.html"), 403


@main_bp.app_errorhandler(404)
def not_found(error):
    return render_template("404.html"), 404


@main_bp.app_errorhandler(413)
def too_large(error):
    flash("The uploaded file is too large.", "danger")
    return redirect(url_for("main.dashboard"))
