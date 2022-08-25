CREATE DATABASE OOP;
USE OOP;

CREATE TABLE person (
	vorname varchar(20),
	nachname varchar(20),
	lebensalter integer 
);


CREATE TABLE person2
AS
SELECT * FROM
person;

ALTER TABLE person2 ADD COLUMN name4 double;

#test
ALTER TABLE person2 DROP COLUMN name1;

ALTER TABLE person
MODIFY vorname
varchar(15);

ALTER TABLE person3 RENAME COLUMN name5 TO name7;

RENAME TABLE person2 TO person3;

Truncate TABLE person3;

INSERT INTO person8 VALUES ('test1', 'test2', 10, 34.5, 12.3, 45.6);


CREATE TABLE person2 (
	id integer PRIMARY KEY,
	vorname varchar(20) NOT NULL,
	nachname varchar(20) UNIQUE	
);

INSERT INTO person2 VALUES (4, 'Hans', 'Dampf');

ALTER TABLE person2 ADD COLUMN gehalt double;

CREATE TABLE person4 (
	id integer PRIMARY KEY,
	vorname varchar(20) NOT NULL,
	nachname varchar(20) UNIQUE,
	gehalt double DEFAULT 1,
	CONSTRAINT check_gehalt_person4 CHECK (gehalt > 0)
);

INSERT INTO person4 VALUES (1, 'Hans', 'Dampf', 1208);

CREATE TABLE person6 (
	id integer,
	vorname varchar(20),
	nachname varchar(20),
	gehalt double DEFAULT 1,
	PRIMARY KEY (id),
	CONSTRAINT check_gehalt_person6 CHECK (gehalt > 0),
	CONSTRAINT nachname_unique UNIQUE (nachname)
);

CREATE TABLE person7 (
	id integer AUTO_INCREMENT,
	vorname varchar(20),
	nachname varchar(20),
	gehalt double DEFAULT 1,
	PRIMARY KEY (id),
	CONSTRAINT check_gehalt_person7 CHECK (gehalt > 0),
	CONSTRAINT nachname_unique UNIQUE (nachname)
);

INSERT INTO person7 VALUES ('Hans', 'Dampf5', 1208);

CREATE TABLE adresse ( 
	adressId integer PRIMARY KEY AUTO_INCREMENT,
	ort varchar(20));

CREATE TABLE person8 (
	id integer AUTO_INCREMENT,
	vorname varchar(20),
	nachname varchar(20),
	gehalt double DEFAULT 1,
	adresse integer,
	PRIMARY KEY (id),
	CONSTRAINT adresse_person8_fk FOREIGN KEY (adresse) REFERENCES adresse(adressId) ON DELETE SET NULL   
);

DROP TABLE person8;

INSERT INTO adresse VALUES (adressId, 'München');

INSERT INTO person8 VALUES (id, 'Hans', 'Dampf5', 1208, 2);

DELETE FROM adresse WHERE adressId = 2;

ALTER TABLE person8 DROP CONSTRAINT adresse_person8_fk;

ALTER TABLE person8 ADD CONSTRAINT adresse_person8_fk FOREIGN KEY (adresse) REFERENCES adresse(adressId);

/* Kapitel 12 */

CREATE TABLE MY_EMPLOYEE
(ID	Integer(4) NOT NULL,
LAST_NAME	VARCHAR(25),
FIRST_NAME	VARCHAR(25),
USERID	VARCHAR(8),
SALARY	Decimal(9,2));

INSERT INTO MY_EMPLOYEE
VALUES (1, 'Patel', 'Ralph', 'rpatel', 795);

INSERT INTO MY_EMPLOYEE (id, last_name, first_name, userid, salary)
VALUES (2, 'Dancs', 'Betty', 'bdancs', 860);

INSERT INTO MY_EMPLOYEE (id, last_name, first_name, userid, salary)
VALUES (3, 'Biri', 'Ben', 'bbiri', 1100);

INSERT INTO MY_EMPLOYEE (id, last_name, first_name, userid, salary)
VALUES (4, 'Newman', 'Chad', 'cnewman', 750);

INSERT INTO MY_EMPLOYEE (id, last_name, first_name, userid, salary)
VALUES (5, 'Ropeburn', 'Audry', 'aropebur', 860);

UPDATE MY_EMPLOYEE
SET last_name = 'Drexler'
WHERE id = 3;

UPDATE MY_EMPLOYEE
SET salary = 1000
WHERE salary < 900;

DELETE FROM MY_EMPLOYEE
WHERE  id = 2;

Commit;

SAVEPOINT a;

DELETE FROM MY_EMPLOYEE;

SELECT * FROM MY_EMPLOYEE;

ROLLBACK to a;

COMMIT;


