
-- =========================================
-- ONLINE RETAIL SALES DATABASE
-- Internship Project - Elevate Labs
-- =========================================
CREATE DATABASE online_retail_db;
use online_retail_db;
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    order_status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL UNIQUE,
    payment_date DATETIME NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO customers
(customer_id, first_name, last_name, email, phone, address)
VALUES
(1, 'Sufiyan', 'Khan', 'sufiyan@gmail.com', '9876543210', 'Hyderabad'),
(2, 'Rahul', 'Sharma', 'rahul@gmail.com', '9876543211', 'Mumbai'),
(3, 'Aman', 'Verma', 'aman@gmail.com', '9876543212', 'Delhi'),
(4, 'Priya', 'Singh', 'priya@gmail.com', '9876543213', 'Bangalore'),
(5, 'Arjun', 'Patel', 'arjun@gmail.com', '9876543214', 'Pune');
INSERT INTO products
(product_id, product_name, category, price, stock_quantity)
VALUES
(1, 'Laptop', 'Electronics', 55000.00, 20),
(2, 'Wireless Mouse', 'Accessories', 1200.00, 50),
(3, 'Keyboard', 'Accessories', 1800.00, 35),
(4, 'Smartphone', 'Electronics', 30000.00, 25),
(5, 'Headphones', 'Audio', 2500.00, 40),
(6, 'USB Cable', 'Accessories', 500.00, 100),
(7, 'Smart Watch', 'Wearables', 7000.00, 15),
(8, 'Power Bank', 'Accessories', 2000.00, 30);
INSERT INTO orders
(order_id, customer_id, order_date, order_status, total_amount)
VALUES
(1, 1, '2026-09-01 10:30:00', 'Completed', 56200.00),
(2, 2, '2026-09-02 14:15:00', 'Completed', 30000.00),
(3, 3, '2026-09-03 09:45:00', 'Shipped', 9500.00),
(4, 1, '2026-09-04 16:20:00', 'Completed', 2500.00),
(5, 4, '2026-09-05 11:10:00', 'Processing', 7000.00),
(6, 5, '2026-09-06 13:50:00', 'Completed', 2300.00),
(7, 2, '2026-09-07 18:05:00', 'Shipped', 57000.00),
(8, 3, '2026-09-08 12:25:00', 'Completed', 5000.00);
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 1, 55000.00),
(2, 1, 2, 1, 1200.00),
(3, 2, 4, 1, 30000.00),
(4, 3, 7, 1, 7000.00),
(5, 3, 2, 2, 1200.00),
(6, 4, 5, 1, 2500.00),
(7, 5, 7, 1, 7000.00),
(8, 6, 3, 1, 1800.00),
(9, 6, 6, 1, 500.00),
(10, 7, 1, 1, 55000.00),
(11, 7, 6, 1, 500.00),
(12, 7, 2, 1, 1200.00),
(13, 8, 5, 2, 2500.00);
INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(1, 1, '2026-09-01 10:35:00', 'UPI', 'Paid', 56200.00),
(2, 2, '2026-09-02 14:20:00', 'Credit Card', 'Paid', 30000.00),
(3, 3, '2026-09-03 09:50:00', 'UPI', 'Paid', 9500.00),
(4, 4, '2026-09-04 16:25:00', 'Debit Card', 'Paid', 2500.00),
(5, 5, '2026-09-05 11:15:00', 'UPI', 'Pending', 7000.00),
(6, 6, '2026-09-06 13:55:00', 'Cash on Delivery', 'Paid', 2300.00),
(7, 7, '2026-09-07 18:10:00', 'Credit Card', 'Paid', 57000.00),
(8, 8, '2026-09-08 12:30:00', 'UPI', 'Paid', 5000.00);
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;
USE online_retail_db;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;
    USE online_retail_db;

SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_sales DESC;
USE online_retail_db;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC;
USE online_retail_db;

SELECT
    o.order_id,
    o.total_amount AS order_total,
    SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.total_amount;
    USE online_retail_db;

UPDATE orders
SET total_amount = 9400.00
WHERE order_id = 3;

UPDATE orders
SET total_amount = 56700.00
WHERE order_id = 7;

UPDATE payments
SET amount = 9400.00
WHERE order_id = 3;

UPDATE payments
SET amount = 56700.00
WHERE order_id = 7;
USE online_retail_db;

SELECT
    o.order_id,
    o.total_amount AS order_total,
    SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.total_amount;
    USE online_retail_db;

SELECT
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value
FROM orders;
USE online_retail_db;

SELECT
    DATE(order_date) AS order_date,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS daily_sales
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_date;
USE online_retail_db;

SELECT
    p.category,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_sales DESC;
USE online_retail_db;

SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_quantity_sold DESC;
USE online_retail_db;

SELECT
    payment_method,
    payment_status,
    COUNT(payment_id) AS total_payments,
    SUM(amount) AS total_amount
FROM payments
GROUP BY
    payment_method,
    payment_status
ORDER BY total_amount DESC;
