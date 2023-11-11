-- SQL-команды для создания таблиц
"DROP TABLE IF EXISTS employees CASCADE;"
"CREATE TABLE employees (id INT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100), position VARCHAR(100), years VARCHAR(100), description VARCHAR(400))"

"DROP TABLE IF EXISTS customers CASCADE;"
"CREATE TABLE customers (id VARCHAR(50) PRIMARY KEY, company_name VARCHAR(100), contact_name VARCHAR(100))")

"DROP TABLE IF EXISTS orders CASCADE;"
"CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id VARCHAR(50), employee_id INT, order_date VARCHAR(50), ship_city VARCHAR(50))"
