-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar

create table student(
	student_id serial,
	first_name varchar(50),
	last_name varchar,
	birthday date,
	phone varchar
);

-- 2. Добавить в таблицу student колонку middle_name varchar

ALTER TABLE student add column middle_name varchar(50);


-- 3. Удалить колонку middle_name

alter table student drop column middle_name;


-- 4. Переименовать колонку birthday в birth_date

ALTER TABLE student RENAME COLUMN birthday TO birth_date;


-- 5. Изменить тип данных колонки phone на varchar(32)

ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);


-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_date, phone) VALUES ('anny', 'smith', '12.12.12', '1488');
INSERT INTO student (first_name, last_name, birth_date, phone) VALUES ('roma', 'mafia', '11.11.11', '0000');
INSERT INTO student (first_name, last_name, birth_date, phone) VALUES ('jenaya', 'zabivnoy', '10.10.10', '2000');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние

TRUNCATE TABLE student RESTART IDENTITY;

