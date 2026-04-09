"""Analytics service - dashboard and analytics helpers"""
from models import Client, Project, Upload


def get_dashboard_summary(user):
    """Get dashboard summary for a user."""
    return {
        "total_uploads": user.uploads.count() if hasattr(user, 'uploads') else 0,
        "total_clients": user.clients.count() if hasattr(user, 'clients') else 0,
        "total_projects": Project.query.filter_by(owner_id=user.id).count(),
    }


def active_projects_by_client():
    """Get active projects grouped by client."""
    clients = Client.query.all()
    result = []
    for client in clients:
        active_count = Project.query.filter_by(client_id=client.id, status="active").count()
        result.append({
            "client_id": client.id,
            "client_name": client.name,
            "active_projects": active_count,
        })
    return result


def project_duration_stats():
    """Get project duration statistics."""
    projects = Project.query.all()
    durations = [p.duration_days for p in projects if p.duration_days is not None]
    if not durations:
        return {"avg": 0, "min": 0, "max": 0, "total": 0}
    return {
        "avg": sum(durations) / len(durations),
        "min": min(durations),
        "max": max(durations),
        "total": len(durations),
    }


def projects_by_status():
    """Get projects grouped by status."""
    statuses = ["planning", "active", "completed", "on_hold", "cancelled"]
    result = {}
    for status in statuses:
        count = Project.query.filter_by(status=status).count()
        result[status] = count
    return result
