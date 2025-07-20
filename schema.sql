CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(100),
    price NUMERIC(10,2),
    stock INTEGER
);

CREATE TABLE cart (
    cart_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER CHECK (quantity > 0),
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT cart_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES products (product_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE discounts (
    discount_code VARCHAR(20) PRIMARY KEY,
    description TEXT,
    discount_percent INTEGER CHECK (discount_percent >= 1 AND discount_percent <= 100),
    valid_until DATE
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10,2),
    CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER CHECK (quantity > 0),
    unit_price NUMERIC(10,2),
    CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES products (product_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    product_id INTEGER,
    customer_id INTEGER,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reviews_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES products (product_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE used_discounts (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    order_id INTEGER,
    discount_code VARCHAR(20),
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT used_discounts_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT used_discounts_order_id_fkey FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT used_discounts_discount_code_fkey FOREIGN KEY (discount_code)
        REFERENCES discounts (discount_code)
        ON UPDATE NO ACTION ON DELETE NO ACTION
);
