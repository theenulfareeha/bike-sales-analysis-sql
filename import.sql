
COPY brands(brand_id, brand_name)
FROM '/path/to/dataset/brands.csv'
DELIMITER ',' CSV HEADER;

COPY categories(category_id, category_name)
FROM '/path/to/dataset/categories.csv'
DELIMITER ',' CSV HEADER;

COPY stores(store_id, store_name, phone, email, street, city, state, zip_code)
FROM '/path/to/dataset/stores.csv'
DELIMITER ',' CSV HEADER;

COPY staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id)
FROM '/path/to/dataset/staffs.csv'
DELIMITER ',' CSV HEADER;

COPY customers(customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
FROM '/path/to/dataset/customers.csv'
DELIMITER ',' CSV HEADER;

COPY products(product_id, product_name, brand_id, category_id, model_year, list_price)
FROM '/path/to/dataset/products.csv'
DELIMITER ',' CSV HEADER;

COPY stocks(store_id, product_id, quantity)
FROM '/path/to/dataset/stocks.csv'
DELIMITER ',' CSV HEADER;

COPY orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
FROM '/path/to/dataset/orders.csv'
DELIMITER ',' CSV HEADER;

COPY order_items(order_id, item_id, product_id, quantity, list_price, discount)
FROM '/path/to/dataset/order_items.csv'
DELIMITER ',' CSV HEADER;
