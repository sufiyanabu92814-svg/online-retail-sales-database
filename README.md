# Online Retail Sales Database

A normalized MySQL database project designed for an online retail/e-commerce platform. The project manages customers, products, orders, order items, and payment information while supporting sales analysis and reporting.

## Project Overview

This project demonstrates the design and implementation of a relational database for an online retail system.

The database is designed using normalization principles and includes primary keys, foreign keys, constraints, sample data, data validation, and analytical SQL queries.

## Objectives

- Design a normalized relational database for an online retail platform
- Implement relationships between customers, products, orders, and payments
- Apply primary key and foreign key constraints
- Maintain data integrity and reduce data redundancy
- Insert and manage sample retail transaction data
- Perform sales and business analysis using SQL queries
- Validate order totals against order item calculations

## Database Schema

The database contains the following tables:

### 1. Customers
Stores customer information such as name, email, phone number, and address.

### 2. Products
Stores product details including product name, category, price, and available stock.

### 3. Orders
Stores customer orders, order dates, order status, and total order amounts.

### 4. Order_Items
Stores individual products included in each order, including quantity and unit price.

### 5. Payments
Stores payment details such as payment method, payment status, payment date, and payment amount.

## Relationships

- One customer can place multiple orders.
- One order can contain multiple order items.
- One product can appear in multiple order items.
- Each order is associated with a payment record.

## Key Concepts Used

- Relational Database Design
- Primary Keys
- Foreign Keys
- Constraints
- Normalization
- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)
- SQL JOINs
- Aggregate Functions
- GROUP BY
- ORDER BY
- Data Validation

## SQL Analysis

The project includes queries for:

- Customer order history
- Total revenue
- Average order value
- Daily sales
- Product-wise sales
- Category-wise sales
- Top-selling products
- Customer-wise spending
- Payment analysis
- Order total validation

## Tools & Technologies

- MySQL
- MySQL Workbench
- dbdiagram.io
- GitHub

## Project Files

- `online_retail_database.sql` — Complete SQL database script
- `ER_Diagram.png` — Entity Relationship Diagram

## Sample Database Metrics

The sample dataset contains:

- 5 customers
- 8 products
- 8 orders
- 13 order items
- 8 payment records

## Database Validation

Order totals were validated by calculating:

`quantity × unit_price`

for each order and comparing the calculated amount with the stored order total.

## ER Diagram

The ER diagram represents the relationships between Customers, Orders, Order_Items, Products, and Payments.

## Conclusion

This project demonstrates how a normalized relational database can be designed and implemented for an online retail system. It combines database design, SQL implementation, data validation, and analytical queries to support retail sales management and reporting.
