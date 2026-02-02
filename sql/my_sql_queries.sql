Изучаю анализ данных на примере продаж:

-- Посмотреть первые 5 строк таблицы
SELECT * FROM superstore 
LIMIT 5;

-- Найти все покупки дороже 500 долларов
SELECT customer_name, product_name, sales
FROM superstore
WHERE sales > 500;

-- Показать товары от самых дорогих к самым дешёвым
SELECT product_name, sales FROM superstore
ORDER BY sales DESC;

-- Посчитать, сколько всего продаж в каждой категории
SELECT category,
    COUNT(*) as number_of_products,  -- количество товаров
    SUM(sales) as total_sales        -- общая сумма продаж
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Найти всех клиентов из Лос-Анджелеса
SELECT customer_name, city, product_name FROM superstore
WHERE city LIKE '%Los Angeles%';

-- Кто наши топ-3 клиента по сумме покупок?
SELECT 
    customer_name,
    SUM(sales) as total_spent,
    COUNT(*) as orders_count
FROM superstore
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- Показывает ВСЕ товары, даже если у них нет поставщика
SELECT 
    superstore.product_name,
    superstore.category,
    superstore.sales,
    suppliers.supplier_name,
    suppliers.rating
FROM superstore
LEFT JOIN suppliers ON superstore.category = suppliers.category
ORDER BY suppliers.supplier_name;

--Объединение таблицы superstore и suppliers по полю category;
SELECT 
    superstore.product_name,
    superstore.category,
    suppliers.supplier_name
FROM superstore
JOIN suppliers ON superstore.category = suppliers.category;
