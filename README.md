# DataApp — Enterprise Project Management & Analytics Platform

A secure, production-ready Flask platform for managing clients and projects, ingesting datasets, and delivering analytics in a data-driven organization.

## Key Capabilities

- Clean backend architecture with layered structure: configuration, models, repositories, services, and controllers.
- Secure authentication and role-based access control with hashed passwords and admin controls.
- Persistent relational storage via SQLAlchemy with MySQL support and SQLite fallback.
- Data engineering pipeline for CSV ingestion, cleansing, validation, transformation, analytics, and export.
- REST API endpoints for clients, projects, and analytics.
- Deployment-ready Docker support with a production-grade Gunicorn runtime.

## Architecture Overview

```
data_app/
├── app.py
├── config.py
├── extensions.py
├── models.py
├── routes.py
├── api.py
├── forms.py
├── utils.py
├── repositories/
│   ├── __init__.py
│   ├── audit_repository.py
│   ├── client_repository.py
│   ├── project_repository.py
│   └── user_repository.py
├── services/
│   ├── __init__.py
│   ├── analytics_service.py
│   ├── auth_service.py
│   └── etl_service.py
├── templates/
├── static/
├── migrations/
├── requirements.txt
├── Dockerfile
├── .env.example
└── tests/
    └── test_app.py
```

## Setup

1. Create a `.env` file from `.env.example`.
2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Create the database and run migrations:

```bash
flask db init
flask db migrate -m "Initial schema"
flask db upgrade
```

4. Start the service:

```bash
python app.py
```

Visit: **http://localhost:5000**

## Environment Variables

Use `.env` for secrets and database credentials:

```env
SECRET_KEY=your-secret-key
DATABASE_URL=mysql+pymysql://db_user:db_password@localhost:3306/data_app
UPLOAD_FOLDER=uploads
MAX_CONTENT_LENGTH=16777216
LOG_FILE=app.log
LOG_LEVEL=INFO
```

## API Endpoints

- `GET /api/clients` — search and paginate clients
- `POST /api/clients` — create a new client
- `GET /api/projects` — search and paginate projects
- `POST /api/projects` — create a new project
- `GET /api/analytics/clients` — active projects by client
- `GET /api/analytics/projects` — project duration and status analytics
- `GET /api/admin/users` — admin-only user list

## Production & Deployment

- Dockerized with `Dockerfile` for consistent builds.
- Use Gunicorn as the WSGI server in production.
- Support cloud migration onto AWS ECS, Azure App Service, or Kubernetes.
- Keep secrets out of source control and use environment variables in deployment pipelines.

## Testing

```bash
pytest tests/ -v
```

## Notes for Enterprise Use

- The current backend is ready for migration to a modern web dashboard.
- Add dedicated client/project UI layers and dashboards using React, Vue, or a templated admin interface.
- Use a managed MySQL instance for production and add backups, monitoring, and security groups.
- Expand analytics features with ETL orchestration, scheduled jobs, and audit logging.
