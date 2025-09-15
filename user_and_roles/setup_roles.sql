USE ROLE USERADMIN;

CREATE ROLE chocolate_db_reader COMMENT = 'Able to read chocolate_db';

CREATE ROLE chocolate_db_write COMMENT = 'Able to do CRUD operations on chocolate_db';

CREATE ROLE chocolate_db_analyst COMMENT = 'Able to do create views on chocolate_db';

SHOW ROLES;

USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS chocolate_db_reader;
CREATE ROLE IF NOT EXISTS chocolate_db_writer;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE chocolate_db_reader;

GRANT USAGE ON DATABASE chocolate_db TO ROLE chocolate_db_reader;

GRANT USAGE ON ALL SCHEMAS IN DATABASE chocolate_db TO ROLE chocolate_db_reader;

GRANT SELECT ON ALL TABLES IN SCHEMA chocolate_db.public TO chocolate_db_reader;

GRANT SELECT ON ALL TABLES IN SCHEMA chocolate_db.public TO chocolate_db_reader;

SHOW GRANTS TO ROLE chocolate_db_reader;

SHOW FUTURE GRANTS IN SCHEMA chocolate_db.public;

GRANT ROLE chocolate_db_reader TO ROLE chocolate_db_writer;

SHOW GRANTS TO ROLE chocolate_db_writer;

GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA chocolate_db.public TO ROLE chocolate_db_writer;


GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA chocolate_db.public TO ROLE chocolate_db_writer;

GRANT CREATE TABLE ON SCHEMA chocolate_db.public TO ROLE chocolate_db_writer;

SHOW GRANTS TO ROLE chocolate_db_writer;

SHOW FUTURE GRANTS IN SCHEMA chocolate_db.public;

USE ROLE USERADMIN;

GRANT ROLE chocolate_db_writer TO USER Abdulrahman;