# PROJECT-MANAGEMENT-SYSTEM-SQL
## Screenshot

![GUI Screenshot](screenshot.png)

```markdown
# Project Management System GUI

A desktop application built with Python, MySQL, and CustomTkinter to manage clients and projects.

## Features
- Add new clients with details (name, email, phone, date of birth, address).
- Add new projects linked to clients (project name, start date, end date, status).
- Load the most recently saved client or project.
- Display database tables in a styled GUI.

## Requirements
Install dependencies using the requirements file:

```bash
pip install -r requirements.txt
```

Dependencies:
- customtkinter
- mysql-connector-python
- ttkthemes (optional)

## Database Setup
1. Create a MySQL database named `project_management_system`.
2. Run the `schema.sql` file to create the required tables.

Example schema:

```sql
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    dob DATE,
    address VARCHAR(255)
);

CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);
```

## Running the Application
1. Ensure MySQL is running and the database is set up.
2. Update the connection details in `main.py` if necessary:
   ```python
   host="localhost"
   user="root"
   password="123456"
   database="project_management_system"
   ```
3. Run the application:
   ```bash
   python app.py
   ```

## Author
Developed by Jomana Mostafa
```
