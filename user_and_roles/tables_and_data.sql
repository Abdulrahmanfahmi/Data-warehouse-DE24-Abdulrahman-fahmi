USE ROLE CHOCOLATE_DB_WRITER;

USE WAREHOUSE dev_wh;

USE SCHEMA chocklate_db.public;


-- DROP TABLE chocolate_flavors;
-- DROP TABLE customers;

-- DROP TABLE transactions; 

CREATE OR REPLACE TABLE chocolate_flavors (
    flavor_id INT AUTOINCREMENT,
    flavor_name STRING NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    description STRING,
    PRIMARY KEY (flavor_id)
);


CREATE OR REPLACE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING NOT NULL,
    email STRING UNIQUE,
    phone STRING,
    PRIMARY KEY (customer_id)
);


CREATE OR REPLACE TABLE transactions (
    transaction_id INT AUTOINCREMENT,
    customer_id INT NOT NULL,
    flavor_id INT NOT NULL,
    quantity INT DEFAULT 1,
    transaction_date TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    
    total_amount DECIMAL(10, 2),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (flavor_id) REFERENCES chocolate_flavors (flavor_id)
);


INSERT INTO chocolate_flavors (flavor_name, price, description)
VALUES
    ('Mörk choklad med havssalt', 49.90, 'En intensiv mörk choklad med krispiga flingor av havssalt.'),
    ('Mjölkchoklad med kola', 59.90, 'Krämig mjölkchoklad fylld med söt, seg kola.'),
    ('Vit choklad med pistage', 65.50, 'En söt, vit choklad med hackade, rostade pistagenötter.');



INSERT INTO customers (customer_name, email, phone)
VALUES
    ('Abdulrahman', 'abdulrahman@example.com', '0701234567'),
    ('Elias', 'elias@example.com', '0709876543'),
    ('Emma', 'emma@example.com', '0722334455');


INSERT INTO transactions (customer_id, flavor_id, quantity, total_amount)
VALUES
    (1, 1, 2, 99.80),  -- Abdulrahman köpte 2 st av "Mörk choklad med havssalt"
    (2, 3, 1, 65.50),  -- Elias köpte 1 st av "Vit choklad med pistage"
    (1, 2, 3, 179.70), -- Abdulrahman köpte 3 st av "Mjölkchoklad med kola"
    (3, 1, 1, 49.90);  -- Emma köpte 1 st av "Mörk choklad med havssalt"


SELECT * FROM transactions;
SELECT * FROM customers;
SELECT * FROM chocolate_flavors;



