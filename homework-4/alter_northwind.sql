-- Подключиться к БД Northwind и сделать следующие изменения:
-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)

ALTER TABLE products ADD CONSTRAINT chk_products_unit_price CHECK (unit_price > 0)


-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1

ALTER TABLE products ADD CONSTRAINT chk_products_discontinued CHECK (discontinued IN (0, 1));


-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)

SELECT * INTO discontinued_products FROM products WHERE discontinued = 1


-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
-- Для 4-го пункта может потребоваться удаление ограничения, связанного с foreign_key. Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.

-- логика какая получилась, сначала удаляем ограничение, удаляем неправильные записи,  удаляем колонку, создаем
-- (если я правильно понял сериализатор, который перезаполнит id в этой колонке и при дальнейшем удалении строк айди поменяется сам))
-- заново создаем колонку и вставляем сериализатор, снова делаем привязку

-- вообще не уверен что это то, но по другому придумать не смог...

ALTER TABLE only order_details DROP CONSTRAINT fk_order_details_products;
DELETE FROM products WHERE discontinued = 1;
ALTER TABLE products DROP column product_id;
CREATE SEQUENCE tablename_colname_seq;
ALTER TABLE products  ADD column product_id integer NOT NULL DEFAULT nextval('tablename_colname_seq');
ALTER SEQUENCE tablename_colname_seq OWNED BY products.product_id;
ALTER TABLE ONLY products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);
select * from products