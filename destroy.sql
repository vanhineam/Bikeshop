/* File: destroy.sql
* Author: Adam Van Hine
* Description: This file force deletes all tables. Use at your own risk!
*/

-- Define space for tables
SET @tables = NULL;

-- Set database name here
SET @database = 'bikeshop'

-- Get list of all tables in database
SELECT GROUP_CONCAT(table_schema, '.', table_name) INTO @tables
FROM information_schema.tables
WHERE table_schema = @database;

-- Format all the "Drop" commands
SET @tables = CONCAT('DROP TABLES', @tables);

-- Prepare and execute commands
PREPARE stmt FROM @tables;
EXECUTE stmt;

-- Free up some space
DEALLOCATE PREPARE stmt;