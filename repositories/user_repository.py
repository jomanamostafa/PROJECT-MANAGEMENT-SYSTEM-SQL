"""User repository - using user_store.py for data persistence"""
from user_store import find_by_username, create_user as _create_user, get_all_users


def get_user_by_username(username: str):
    """Get user by username."""
    return find_by_username(username)


def create_user(username: str, password: str, role: str = "user"):
    """Create a new user."""
    return _create_user(username, password, role)


def list_users():
    """List all users."""
    return get_all_users()
