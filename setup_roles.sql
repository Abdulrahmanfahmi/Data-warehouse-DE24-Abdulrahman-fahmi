USE ROLE USERADMIN;

CREATE ROLE chocolate_db_reader COMMENT = 'Able to read chocolate_db';

CREATE ROLE chocolate_db_write COMMENT = 'Able to do CRUD operations on chocolate_db';

CREATE ROLE chocolate_db_analyst COMMENT = 'Able to do create views on chocolate_db';

SHOW ROLES;

