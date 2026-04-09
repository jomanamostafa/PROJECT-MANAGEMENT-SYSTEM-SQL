"""Client repository - simple in-memory storage for demo"""
from models import Client, db


def find_clients(query: str = "", page: int = 1, per_page: int = 20):
    """Find clients with optional search query."""
    q = Client.query
    if query:
        q = q.filter(Client.name.ilike(f"%{query}%"))
    q = q.order_by(Client.created_at.desc())
    pagination = q.paginate(page=page, per_page=per_page, error_out=False)
    return {
        "items": [c.to_dict() for c in pagination.items],
        "total": pagination.total,
        "pages": pagination.pages,
        "current_page": pagination.page,
    }


def create_client(name: str, industry: str, owner):
    """Create a new client."""
    client = Client(name=name, industry=industry, owner_id=owner.id)
    db.session.add(client)
    db.session.commit()
    return client
