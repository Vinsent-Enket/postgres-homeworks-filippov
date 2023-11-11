"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2

conn = psycopg2.connect(
    host="localhost",
    database="north",
    user="vinsentenkidu",
    password="12345678"
)

cur = conn.cursor()

cur.execute("DROP TABLE IF EXISTS employees CASCADE;")
cur.execute(
    "CREATE TABLE employees (id INT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), position VARCHAR(100), years VARCHAR(100), description VARCHAR(400))")
conn.commit()

# execute query
with open("./north_data/employees_data.csv", 'r') as file:
    for line in file:
        split_list = line.split(",")
        if split_list[0] == '"employee_id"':
            continue
        cur.execute(
            "INSERT INTO employees (id, first_name, last_name, position, years, description) VALUES (%s, %s, %s, %s, %s, %s)",
            (split_list[0], split_list[1], split_list[2], split_list[3], split_list[4], split_list[5]))
    conn.commit()

cur.execute("DROP TABLE IF EXISTS customers CASCADE;")
cur.execute(
    "CREATE TABLE customers (id VARCHAR(50) PRIMARY KEY, company_name VARCHAR(100), contact_name VARCHAR(100))")
conn.commit()

# execute query
with open("./north_data/customers_data.csv", 'r') as file:
    for line in file:
        split_list = line.split(",")
        if split_list[0] == '"customer_id"':
            continue
        cur.execute(
            "INSERT INTO customers (id, company_name, contact_name) VALUES (%s, %s, %s)",
            (split_list[0], split_list[1], split_list[2]))
    conn.commit()

cur.execute("DROP TABLE IF EXISTS orders CASCADE;")
cur.execute(
    "CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id VARCHAR(50), employee_id INT, order_date VARCHAR(50), ship_city VARCHAR(50))"
)
conn.commit()

# execute query
with open("./north_data/orders_data.csv", 'r') as file:
    for line in file:
        split_list = line.split(",")
        if split_list[0] == '"order_id"':
            continue
        cur.execute(
            "INSERT INTO orders (order_id, customer_id, employee_id, order_date, ship_city) VALUES (%s, %s, %s, %s, %s)",
            (int(split_list[0]), split_list[1], int(split_list[2]), split_list[3], split_list[4]))
    conn.commit()


cur.execute("SELECT * FROM employees")

rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()
conn.close()



