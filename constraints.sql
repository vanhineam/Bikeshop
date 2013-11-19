/* File: constraints.sql
* Author: Adam Van Hine
* Description: Adds the constraints for all the bikeshop tables
* Paired with constraints.sql
*/

-- Add all the primary keys
ALTER TABLE EMPLOYEE ADD(
	CONSTRAINT employee_ssn_pk PRIMARY KEY(ssn)
);

ALTER TABLE BUYS ADD(
	CONSTRAINT buys_num_pk PRIMARY KEY(sale_num)
);

ALTER TABLE CLIENT ADD(
	CONSTRAINT client_num_pk PRIMARY KEY(client_num)
);

ALTER TABLE REPAIR ADD(
	CONSTRAINT repair_num_pk PRIMARY KEY(repair_num)
);

ALTER TABLE BIKE ADD(
	CONSTRAINT bike_num_pk PRIMARY KEY(serial_num)
);

ALTER TABLE PARTS ADD(
	CONSTRAINT part_num_pk PRIMARY KEY(part_num) 
);

-- Now for the foreign keys
ALTER TABLE REPAIR ADD(
	-- Bike SSN to be repaired: From BIKE
	CONSTRAINT repair_bikesn_fk FOREIGN KEY(bike_serial_num) 
		REFERENCES BIKE(serial_num),
	-- The employees SSN that is repairing the bike: From EMPLOYEE
	CONSTRAINT repair_ssn_fk FOREIGN KEY(repair_ssn) 
		REFERENCES EMPLOYEE(ssn)
);

ALTER TABLE BUYS ADD(
	-- The serial number of the bike being sold: From BIKE
	CONSTRAINT buys_bikesn_fk FOREIGN KEY(bike_serial_num)
		REFERENCES BIKE(serial_num),
	-- The unique client number that the bike is being sold to: From CLIENT
	CONSTRAINT buys_client_fk FOREIGN KEY(client_num)
		REFERENCES CLIENT(client_num),
	-- The ssn of the employee who made the sale: From EMPLOYEE
	CONSTRAINT buys_ssn_fk FOREIGN KEY(sales_ssn)
		REFERENCES EMPLOYEE(ssn)
);

ALTER TABLE PARTS ADD(
	-- The repair number used: From REPAIR
	CONSTRAINT parts_repair_fk FOREIGN KEY(repair_num)
		REFERENCES REPAIR(repair_num)
);