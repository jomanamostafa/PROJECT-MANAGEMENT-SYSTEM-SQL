from flask import Blueprint, request, jsonify, abort
from flask_login import current_user, login_required
from sqlalchemy import func

from models import Client, Project, User
from repositories.user_repository import get_user_by_username
from repositories.client_repository import find_clients, create_client
from repositories.project_repository import find_projects, create_project
from services.analytics_service import active_projects_by_client, project_duration_stats, projects_by_status
from services.auth_service import ensure_admin

api_bp = Blueprint("api", __name__)


def _bad_request(message, code=400):
    response = jsonify({"error": message})
    response.status_code = code
    return response


@api_bp.route("/clients", methods=["GET"])
@login_required
def list_clients():
    query = request.args.get("q", "")
    page = int(request.args.get("page", 1))
    per_page = int(request.args.get("per_page", 20))
    results = find_clients(query, page=page, per_page=per_page)
    return jsonify(results)


@api_bp.route("/clients", methods=["POST"])
@login_required
def create_client_endpoint():
    payload = request.get_json(silent=True) or {}
    name = payload.get("name")
    industry = payload.get("industry", "General")
    if not name:
        return _bad_request("Client name is required.")
    client = create_client(name=name, industry=industry, owner=current_user)
    return jsonify(client.to_dict()), 201


@api_bp.route("/projects", methods=["GET"])
@login_required
def list_projects():
    query = request.args.get("q", "")
    page = int(request.args.get("page", 1))
    per_page = int(request.args.get("per_page", 20))
    return jsonify(find_projects(query, page=page, per_page=per_page))


@api_bp.route("/projects", methods=["POST"])
@login_required
def create_project_endpoint():
    payload = request.get_json(silent=True) or {}
    required = ["name", "client_id"]
    missing = [field for field in required if not payload.get(field)]
    if missing:
        return _bad_request(f"Missing fields: {', '.join(missing)}")
    project = create_project(
        name=payload["name"],
        description=payload.get("description"),
        status=payload.get("status", "planning"),
        start_date=payload.get("start_date"),
        end_date=payload.get("end_date"),
        budget=payload.get("budget"),
        client_id=payload["client_id"],
        owner=current_user,
    )
    return jsonify(project.to_dict()), 201


@api_bp.route("/analytics/clients", methods=["GET"])
@login_required
def clients_analytics():
    return jsonify(active_projects_by_client())


@api_bp.route("/analytics/projects", methods=["GET"])
@login_required
def project_analytics():
    summary = project_duration_stats()
    status = projects_by_status()
    return jsonify({"duration_stats": summary, "status_summary": status})


@api_bp.route("/admin/users", methods=["GET"])
@login_required
def admin_users():
    ensure_admin(current_user)
    users = [u.to_dict() for u in User.query.order_by(User.created_at.desc()).all()]
    return jsonify(users)
