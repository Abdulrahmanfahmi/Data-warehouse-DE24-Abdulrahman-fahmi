SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS talent_pipeline_db;

SHOW DATABASES;

CREATE SCHEMA IF NOT EXISTS talent_pipeline_db.STAGING;

SHOW SCHEMAS IN DATABASE talent_pipeline_db;

USE DATABASE talent_pipeline_db;

CREATE SCHEMA IF NOT EXISTS WAREHOUSE;

CREATE SCHEMA IF NOT EXISTS STAGING;

CREATE SCHEMA STAGING;

SHOW SCHEMAS;

CREATE TABLE IF NOT EXISTS customer(
    customer_id integer primary key,
    age integer,
    email varchar(50)

);

SHOW TABLES;

INSERT INTO customer (customer_id, age, email)
values
(1, 32, 'bla@gmail.com'),
(2, 23, 'kla@gmail.com');

SELECT * FROM customer;

CREATE TABLE IF NOT EXISTS STAGING.stg_customer (
    customer_id integer primary key,
    age integer,
    email varchar(50)
);

SHOW TABLES IN DATABASE talent_pipeline_db;

