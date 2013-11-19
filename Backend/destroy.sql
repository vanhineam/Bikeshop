/* File: destroy.sql
* Author: Adam Van Hine
* Description: This file force deletes all tables. Use at your own risk!
*/

-- Define space for tables
SET @tables = NULL;

-- Get list of all tables in database
SELECT GROUP_CONCAT(table_schema, '.', table_name) INTO @tables
FROM information_schema.tables
WHERE table_schema = 'bikeshop'; # database name here

-- Format all the "Drop" commands
SET @tables = CONCAT('DROP TABLE ', @tables);

-- Prepare and execute commands
PREPARE stmt FROM @tables;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;