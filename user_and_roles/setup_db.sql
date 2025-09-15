USE ROLE SYSADMIN;

SELECT CURRENT_ROLE();

SELECT CURRENT_USER();

CREATE DATABASE IF NOT EXISTS chocolate_db;

CREATE WAREHOUSE dev_wh
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = "warehouse for development and analysis";


SHOW WAREHOUSES;



CREATE TABLE chocolate_flavors (
    flavor_id INT AUTOINCREMENT,
    flavor_name STRING NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    description STRING,
    PRIMARY KEY (flavor_id)
);


CREATE TABLE customers (
    customer_id INT AUTOINCREMENT,
    customer_name STRING NOT NULL,
    email STRING UNIQUE,
    phone STRING,
    PRIMARY KEY (customer_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTOINCREMENT,
    customer_id INT NOT NULL,
    flavor_id INT NOT NULL,
    quantity INT DEFAULT 1,
    transaction_date TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    total_amount DECIMAL(10, 2) AS (quantity * (SELECT price FROM chocolate_flavors WHERE flavor_id = transactions.flavor_id)),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (flavor_id) REFERENCES chocolate_flavors (flavor_id)
);

SHOW TABLES;