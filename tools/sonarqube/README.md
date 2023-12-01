# Config Database

After create the database, verify if the COLLATE is equal to SQL_Latin1_General_CP1_CS_AS, if not, change with the command: <br /><br />

USE DATABASE; <br />
ALTER DATABASE CURRENT COLLATE SQL_Latin1_General_CP1_CS_AS;