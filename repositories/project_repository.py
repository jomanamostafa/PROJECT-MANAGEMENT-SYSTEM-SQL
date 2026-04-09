"""Project repository - simple in-memory storage for demo"""
from models import Project, db


def find_projects(query: str = "", page: int = 1, per_page: int = 20):
    """Find projects with optional search query."""
    q = Project.query
    if query:
        q = q.filter(Project.name.ilike(f"%{query}%"))
    q = q.order_by(Project.created_at.desc())
    pagination = q.paginate(page=page, per_page=per_page, error_out=False)
    return {
        "items": [p.to_dict() for p in pagination.items],
        "total": pagination.total,
        "pages": pagination.pages,
        "current_page": pagination.page,
    }


def create_project(name: str, client_id: int, owner, description: str = None, 
                   status: str = "planning", start_date=None, end_date=None, budget=None):
    """Create a new project."""
    project = Project(
        name=name,
        description=description,
        status=status,
        start_date=start_date,
        end_date=end_date,
        budget=budget,
        client_id=client_id,
        owner_id=owner.id,
    )
    db.session.add(project)
    db.session.commit()
    return project
