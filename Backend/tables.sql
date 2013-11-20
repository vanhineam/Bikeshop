/* File: tables.sql
* Author: Adam Van Hine
* Description: Creates all the tables needed for the bikeshop Database
* Paired with constraints.sql
*/
CREATE TABLE EMPLOYEE(
	fname			 varchar(25) NOT NULL,
	minit			 varchar(1)		NOT NULL,
	lname			 varchar(25) NOT NULL,
	address		 varchar(120) NOT NULL,
	birthdate	 date NOT NULL,
	ssn				 varchar(9)   NOT NULL
);

CREATE TABLE BIKE(
	serial_num    varchar(12) NOT NULL,
	size					varchar(50) NOT NULL,
	manufacturer  varchar(25) NOT NULL,
	sex	          varchar(1)  NOT NULL,
	model_num	    varchar(25) NOT NULL
);

CREATE TABLE CLIENT(
	client_name	  varchar(25) NOT NULL,
	client_phone  varchar(10) NOT NULL,
	client_address varchar(120) NOT NULL,
	client_num		varchar(9) NOT NULL
);

CREATE TABLE REPAIR(
	repair_num		varchar(9) NOT NULL,
	repair_ssn		varchar(9) NOT NULL,
	bike_serial_num varchar(12) NOT NULL,
	cost					DECIMAL(65, 30) NOT NULL
);

CREATE TABLE BUYS(
	sale_num			varchar(255) NOT NULL,
	client_num	  varchar(9) NOT NULL,
	bike_serial_num varchar(12) NOT NULL,
	sale_date			DATE,
	price   			DECIMAL(65,30) NOT NULL,
	sales_ssn     varchar(9) NOT NULL
);

CREATE TABLE PARTS(
	part_num		varchar(255) NOT NULL,
	repair_num	varchar(9) NOT NULL
);
