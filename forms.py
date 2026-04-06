from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, EmailField
from wtforms.validators import DataRequired, Email, Length, EqualTo


class LoginForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=4, max=25)])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=6, max=35)])
    submit = SubmitField('Login')


class RegisterForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=4, max=25)])
    email = EmailField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=6, max=35)])
    confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Register')


class ClientForm(FlaskForm):
    name = StringField('Client Name', validators=[DataRequired(), Length(max=100)])
    email = EmailField('Client Email', validators=[DataRequired(), Email()])
    submit = SubmitField('Add Client')


class ProjectForm(FlaskForm):
    title = StringField('Project Title', validators=[DataRequired(), Length(max=200)])
    description = StringField('Project Description', validators=[DataRequired()])
    submit = SubmitField('Create Project')
