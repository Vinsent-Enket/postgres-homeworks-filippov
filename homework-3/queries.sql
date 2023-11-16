-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT (first_name, last_name) as fio, customers.company_name FROM employees
INNER JOIN orders ON orders.employee_id=employees.employee_id
INNER JOIN customers ON customers.customer_id=orders.customer_id
WHERE orders.employee_id=employees.employee_id and employees.city='London' AND orders.ship_via=2 and customers.customer_id=orders.customer_id and customers.city='London'
-- не понял как объединить без запятой

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.

select products.product_name, products.units_in_stock, suppliers.contact_name, suppliers.phone from products
inner join suppliers using(supplier_id)
where products.discontinued <> 1 and products.units_in_stock < 25 and (products.category_id = 2 or products.category_id = 4)
order by products.units_in_stock

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа

select company_name from customers
where not exists (select * from orders where customers.customer_id = orders.customer_id)

-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.

select product_name from products
where exists (select product_id from order_details where quantity = 10 and products.product_id = order_details.product_id)

