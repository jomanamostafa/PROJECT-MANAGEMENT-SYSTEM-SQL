import customtkinter as ctk
from tkinter import messagebox, ttk
import mysql.connector

def get_connection():
    try:
        return mysql.connector.connect(
            host="localhost",
            user="root",
            password="123456",
            database="project_management_system"
        )
    except mysql.connector.Error as err:
        messagebox.showerror("DB Error", f"Cannot connect:\n{err}")
        return None

def save_client():
    conn = get_connection()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO clients (first_name, last_name, email, phone, dob, address) VALUES (%s, %s, %s, %s, %s, %s)",
            (entry_first_name.get(), entry_last_name.get(), entry_email.get(),
            entry_phone.get(), entry_dob.get(), entry_address.get())
        )
        conn.commit()
        messagebox.showinfo("Saved", "Client saved!")
    except mysql.connector.Error as err:
        messagebox.showerror("MySQL Error", f"{err}")
    finally:
        conn.close()

def save_project():
    conn = get_connection()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO projects (client_id, project_name, start_date, end_date, status) VALUES (%s, %s, %s, %s, %s)",
            (entry_client_id.get(), entry_project_name.get(),
            entry_start.get(), entry_end.get(), entry_status.get())
        )
        conn.commit()
        messagebox.showinfo("Saved", "Project saved!")
    except mysql.connector.Error as err:
        messagebox.showerror("MySQL Error", f"{err}")
    finally:
        conn.close()

def load_last_client():
    conn = get_connection()
    if not conn: return
    cur = conn.cursor()
    cur.execute("SELECT first_name, last_name, email, phone, dob, address FROM clients ORDER BY client_id DESC LIMIT 1")
    row = cur.fetchone()
    conn.close()
    if row:
        entry_first_name.delete(0, "end"); entry_first_name.insert(0, row[0])
        entry_last_name.delete(0, "end"); entry_last_name.insert(0, row[1])
        entry_email.delete(0, "end"); entry_email.insert(0, row[2])
        entry_phone.delete(0, "end"); entry_phone.insert(0, row[3])
        entry_dob.delete(0, "end"); entry_dob.insert(0, row[4] if row[4] else "")
        entry_address.delete(0, "end"); entry_address.insert(0, row[5] if row[5] else "")
        messagebox.showinfo("Loaded", "successfull save !")
    else:
        messagebox.showinfo("Info", "No clients found.")

def load_last_project():
    conn = get_connection()
    if not conn:
        return
    cur = conn.cursor()
    try:
        cur.execute("SELECT client_id, project_name, start_date, end_date, status FROM projects ORDER BY project_id DESC LIMIT 1")
        row = cur.fetchone()
    except mysql.connector.Error as err:
        messagebox.showerror("MySQL Error", f"{err}")
        conn.close()
        return
    conn.close()

    if row:
        entry_client_id.delete(0, "end"); entry_client_id.insert(0, str(row[0]))
        entry_project_name.delete(0, "end"); entry_project_name.insert(0, row[1])
        entry_start.delete(0, "end"); entry_start.insert(0, str(row[2]) if row[2] else "")
        entry_end.delete(0, "end"); entry_end.insert(0, str(row[3]) if row[3] else "")
        entry_status.delete(0, "end"); entry_status.insert(0, row[4])
        messagebox.showinfo("Loaded", "Last project loaded!")
    else:
        messagebox.showinfo("Info", "No projects found.")

def get_tables():
    conn = get_connection()
    if not conn: return []
    cur = conn.cursor()
    cur.execute("SELECT table_name FROM information_schema.tables WHERE table_schema='project_management_system'")
    tables = [row[0] for row in cur.fetchall()]
    conn.close()
    return tables

def show_table_data():
    table_name = combo_tables.get().strip()
    if not table_name:
        messagebox.showwarning("Choose", "Choose a table first")
        return

    conn = get_connection()
    if not conn: return
    try:
        cur = conn.cursor()
        cur.execute(f"SELECT * FROM `{table_name}`")
        rows = cur.fetchall()
        cols = [desc[0] for desc in cur.description]
    except mysql.connector.Error as err:
        messagebox.showerror("MySQL Error", f"{err}")
        return
    finally:
        conn.close()

    for widget in frame_output.winfo_children():
        widget.destroy()

    style = ttk.Style()
    style.theme_use("default")
    style.configure("Custom.Treeview.Heading",
                    font=("Verdana", 13, "bold"),
                    foreground="white",
                    background="purple")
    style.configure("Custom.Treeview",
                    font=("Verdana", 12, "bold"),
                    foreground="white",
                    background="#5DADE2",
                    fieldbackground="#5DADE2",
                    rowheight=30)
    style.map("Custom.Treeview", background=[("selected", "#3498DB")])

    tree = ttk.Treeview(frame_output, columns=cols, show="headings", style="Custom.Treeview")
    tree.pack(fill="both", expand=True)

    vsb = ttk.Scrollbar(frame_output, orient="vertical", command=tree.yview)
    hsb = ttk.Scrollbar(frame_output, orient="horizontal", command=tree.xview)
    tree.configure(yscrollcommand=vsb.set, xscrollcommand=hsb.set)
    vsb.pack(side="right", fill="y")
    hsb.pack(side="bottom", fill="x")

    for col in cols:
        tree.heading(col, text=col, anchor="center")
        tree.column(col, width=160, anchor="center")

    tree.tag_configure("lightblue", background="#5DADE2", foreground="white")
    tree.tag_configure("altblue", background="#85C1E9", foreground="white")

    for i, row in enumerate(rows):
        tag = "lightblue" if i % 2 == 0 else "altblue"
        tree.insert("", "end", values=row, tags=(tag,))

# GUI
ctk.set_appearance_mode("light")
window = ctk.CTk()
window.title("Project Management System GUI")
window.geometry("1100x750")

label_top = ctk.CTkLabel(window, text="Project Management System", font=("Verdana", 28, "bold"))
label_top.pack(pady=10)

# Clients frame
frame_clients = ctk.CTkFrame(window)
frame_clients.pack(pady=10)

entry_first_name = ctk.CTkEntry(frame_clients, width=150, placeholder_text="First Name"); entry_first_name.pack(side="left", padx=5)
entry_last_name = ctk.CTkEntry(frame_clients, width=150, placeholder_text="Last Name"); entry_last_name.pack(side="left", padx=5)
entry_email = ctk.CTkEntry(frame_clients, width=150, placeholder_text="Email"); entry_email.pack(side="left", padx=5)
entry_phone = ctk.CTkEntry(frame_clients, width=150, placeholder_text="Phone"); entry_phone.pack(side="left", padx=5)
entry_dob = ctk.CTkEntry(frame_clients, width=150, placeholder_text="DOB YYYY-MM-DD"); entry_dob.pack(side="left", padx=5)
entry_address = ctk.CTkEntry(frame_clients, width=150, placeholder_text="Address"); entry_address.pack(side="left", padx=5)

ctk.CTkButton(frame_clients, text="Save Client", command=save_client).pack(side="left", padx=5)
ctk.CTkButton(frame_clients, text="Load Last Client", command=load_last_client).pack(side="left", padx=5)

# Projects frame
# Projects frame
frame_projects = ctk.CTkFrame(window)
frame_projects.pack(pady=10)

entry_client_id = ctk.CTkEntry(frame_projects, width=100, placeholder_text="Client ID")
entry_client_id.pack(side="left", padx=5)

entry_project_name = ctk.CTkEntry(frame_projects, width=150, placeholder_text="Project Name")
entry_project_name.pack(side="left", padx=5)

entry_start = ctk.CTkEntry(frame_projects, width=120, placeholder_text="Start Date YYYY-MM-DD")
entry_start.pack(side="left", padx=5)

entry_end = ctk.CTkEntry(frame_projects, width=120, placeholder_text="End Date YYYY-MM-DD")
entry_end.pack(side="left", padx=5)

entry_status = ctk.CTkEntry(frame_projects, width=100, placeholder_text="Status")
entry_status.pack(side="left", padx=5)

ctk.CTkButton(frame_projects, text="Save Project", command=save_project).pack(side="left", padx=5)
ctk.CTkButton(frame_projects, text="Load Last Project", command=load_last_project).pack(side="left", padx=5)

# Menu for tables
frame_menu = ctk.CTkFrame(window)
frame_menu.pack(pady=10)

tables = get_tables()
combo_tables = ttk.Combobox(frame_menu, values=tables, width=40, font=("Verdana", 12, "bold"))
combo_tables.pack(side="left", padx=5)

ctk.CTkButton(frame_menu, text="Show Table", command=show_table_data).pack(side="left", padx=5)

# Output frame
frame_output = ctk.CTkFrame(window)
frame_output.pack(fill="both", expand=True, pady=10)

# Main loop
window.mainloop()
