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

INSERT INTO person3 VALUES ('test1', 'test2', 10, 34.5, 12.3, 45.6);
