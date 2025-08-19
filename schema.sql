-- Create Database
CREATE DATABASE bike_sales;
\c bike_sales;

-- Brands
CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

-- Categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Stores
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(255),
    phone VARCHAR(25),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(25),
    zip_code VARCHAR(10)
);

-- Staffs
CREATE TABLE staffs (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255),
    phone VARCHAR(25),
    active BOOLEAN,
    store_id INT REFERENCES stores(store_id),
    manager_id INT
);

-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(25),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(25),
    zip_code VARCHAR(10)
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    brand_id INT REFERENCES brands(brand_id),
    category_id INT REFERENCES categories(category_id),
    model_year INT,
    list_price NUMERIC(10,2)
);

-- Stocks
CREATE TABLE stocks (
    store_id INT REFERENCES stores(store_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    PRIMARY KEY (store_id, product_id)
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_status SMALLINT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT REFERENCES stores(store_id),
    staff_id INT REFERENCES staffs(staff_id)
);

-- Order Items
CREATE TABLE order_items (
    order_id INT REFERENCES orders(order_id),
    item_id INT,
    product_id INT REFERENCES products(product_id),
    quantity INT,
    list_price NUMERIC(10,2),
    discount NUMERIC(4,2),
    PRIMARY KEY (order_id, item_id)
);
