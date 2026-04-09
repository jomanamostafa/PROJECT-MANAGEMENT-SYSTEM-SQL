from datetime import datetime
from flask_login import UserMixin
from sqlalchemy.ext.hybrid import hybrid_property

from extensions import bcrypt, db, login_manager


class AuditLog(db.Model):
    __tablename__ = "audit_logs"

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)
    action = db.Column(db.String(64), nullable=False)
    entity_type = db.Column(db.String(64), nullable=False)
    entity_id = db.Column(db.String(64), nullable=True)
    audit_metadata = db.Column(db.Text, nullable=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)

    user = db.relationship("User", back_populates="audit_logs")


class User(UserMixin, db.Model):
    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False, index=True)
    password_hash = db.Column(db.String(255), nullable=False)
    role = db.Column(db.String(32), nullable=False, default="user")
    created_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)

    uploads = db.relationship("Upload", back_populates="user", lazy="dynamic")
    clients = db.relationship("Client", back_populates="owner", lazy="dynamic")
    audit_logs = db.relationship("AuditLog", back_populates="user", lazy="dynamic")

    def set_password(self, raw_password: str):
        self.password_hash = bcrypt.generate_password_hash(raw_password).decode("utf-8")

    def check_password(self, raw_password: str) -> bool:
        return bcrypt.check_password_hash(self.password_hash, raw_password)

    @property
    def is_admin(self) -> bool:
        return self.role.lower() == "admin"

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "username": self.username,
            "role": self.role,
            "created_at": self.created_at.isoformat() if self.created_at else None,
        }


class Client(db.Model):
    __tablename__ = "clients"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False, index=True)
    industry = db.Column(db.String(80), nullable=False, default="General")
    region = db.Column(db.String(80), nullable=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)
    owner_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)

    owner = db.relationship("User", back_populates="clients")
    projects = db.relationship("Project", back_populates="client", lazy="dynamic")

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "name": self.name,
            "industry": self.industry,
            "region": self.region,
            "owner_id": self.owner_id,
            "created_at": self.created_at.isoformat() if self.created_at else None,
            "projects": [project.id for project in self.projects.limit(5)],
        }


class Project(db.Model):
    __tablename__ = "projects"

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), nullable=False, index=True)
    description = db.Column(db.Text, nullable=True)
    status = db.Column(db.String(32), nullable=False, default="planning")
    start_date = db.Column(db.Date, nullable=True)
    end_date = db.Column(db.Date, nullable=True)
    budget = db.Column(db.Float, nullable=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow, nullable=False)
    client_id = db.Column(db.Integer, db.ForeignKey("clients.id"), nullable=False)
    owner_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)

    client = db.relationship("Client", back_populates="projects")
    owner = db.relationship("User")

    @hybrid_property
    def duration_days(self) -> int | None:
        if self.start_date and self.end_date:
            return (self.end_date - self.start_date).days
        return None

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "name": self.name,
            "description": self.description,
            "status": self.status,
            "client_id": self.client_id,
            "owner_id": self.owner_id,
            "start_date": self.start_date.isoformat() if self.start_date else None,
            "end_date": self.end_date.isoformat() if self.end_date else None,
            "budget": self.budget,
            "duration_days": self.duration_days,
            "updated_at": self.updated_at.isoformat() if self.updated_at else None,
        }


class Upload(db.Model):
    __tablename__ = "uploads"

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"), nullable=False)
    original_name = db.Column(db.String(255), nullable=False)
    stored_name = db.Column(db.String(255), nullable=False)
    record_count = db.Column(db.Integer, nullable=True)
    upload_status = db.Column(db.String(32), nullable=False, default="pending")
    created_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)

    user = db.relationship("User", back_populates="uploads")

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "original_name": self.original_name,
            "stored_name": self.stored_name,
            "record_count": self.record_count,
            "upload_status": self.upload_status,
            "created_at": self.created_at.isoformat() if self.created_at else None,
        }


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))
