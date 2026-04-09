"""Auth service - authentication helpers"""
from flask import abort


def ensure_admin(user):
    """Ensure user is admin, raise 403 if not."""
    if not user or not hasattr(user, 'is_admin') or not user.is_admin:
        abort(403)
