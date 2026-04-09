from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from wtforms import StringField, PasswordField, SubmitField, SelectField, TextAreaField, DateField, DecimalField
from wtforms.validators import DataRequired, Length, EqualTo, Optional, NumberRange


class RegisterForm(FlaskForm):
    username = StringField("Username", validators=[DataRequired(), Length(min=3, max=80)])
    password = PasswordField("Password", validators=[DataRequired(), Length(min=6)])
    confirm_password = PasswordField(
        "Confirm Password",
        validators=[DataRequired(), EqualTo("password", message="Passwords must match.")],
    )
    submit = SubmitField("Register")


class LoginForm(FlaskForm):
    username = StringField("Username", validators=[DataRequired()])
    password = PasswordField("Password", validators=[DataRequired()])
    submit = SubmitField("Login")


CHART_CHOICES = [
    ("bar", "📊 Bar Chart"),
    ("line", "📈 Line Chart"),
    ("scatter", "🔵 Scatter Plot"),
    ("pie", "🥧 Pie Chart"),
    ("box", "📦 Box Plot"),
    ("histogram", "📉 Histogram"),
    ("area", "🏔️ Area Chart"),
    ("heatmap", "🌡️ Heatmap (Correlation)"),
    ("violin", "🎻 Violin Plot"),
]


class UploadForm(FlaskForm):
    csv_file = FileField(
        "Upload CSV File",
        validators=[
            DataRequired(message="Please select a CSV file."),
            FileAllowed(["csv"], "Only .csv files are allowed."),
        ],
    )
    chart_type = SelectField("Chart Type", choices=CHART_CHOICES)
    x_col = StringField("X-Axis Column (optional)", validators=[Optional()])
    y_col = StringField("Y-Axis Column (optional)", validators=[Optional()])
    submit = SubmitField("Upload & Analyze")


class ClientForm(FlaskForm):
    name = StringField("Client Name", validators=[DataRequired(), Length(max=120)])
    industry = StringField("Industry", validators=[Optional(), Length(max=80)])
    region = StringField("Region", validators=[Optional(), Length(max=80)])
    submit = SubmitField("Save Client")


class ProjectForm(FlaskForm):
    name = StringField("Project Name", validators=[DataRequired(), Length(max=120)])
    description = TextAreaField("Description", validators=[Optional(), Length(max=1200)])
    status = SelectField("Status", choices=[("planning","Planning"), ("active","Active"), ("completed","Completed"), ("on_hold","On Hold")])
    start_date = DateField("Start Date", validators=[Optional()])
    end_date = DateField("End Date", validators=[Optional()])
    budget = DecimalField("Budget", validators=[Optional(), NumberRange(min=0)], places=2)
    submit = SubmitField("Save Project")
