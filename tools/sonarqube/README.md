# Config Database

After create a new database, verify if the Collation is equal SQL_Latin1_General_CP1_CS_AS, if not, change with the command:

USE DATABASE;
ALTER DATABASE CURRENT COLLATE SQL_Latin1_General_CP1_CS_AS;