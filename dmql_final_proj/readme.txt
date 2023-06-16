This file serves as information of data and the instructions of running the database in PostgreSQL.

In this directory, there is a create.sql used to create the tables of the database. And a folder, 'project csv files', which contains all the csv files generated from mockaroo. 

For ease of restoring the database, we have included an sql file, 'new.sql', which is a back up of our most recent server, the files may not be completely updated as a lot of queries have been run and some changes have been made to the database since. 

Steps to restore:

If binary path is already set, you can skip step 1.

1. the binary path should be set in file -> preferences -> binary paths -> PostgreSQL Binary Path -> postgreSQL15 should have the value C:\Program Files\PostgreSQL\15\bin or whatever the bin location is (This is done on windows 11 OS)

2. Create a new database, right click on the name of the database, from there choose RESTORE,
Enter the location of the 'new.sql' on the local system.

This should restore the whole updated database to postgreSQL.




Steps to run our website:

Open Anaconda

Launch Visual Studio Code and Open this folder

In anaconda select environments, left click on the play button, open terminal, paste this--> pip install flask flask_bootstrap sqlalchemy Flask-WTF wtforms psycopg2

In VS code. website.py, change the database name(line 64) to what you have given in PGadmin, password also enter what you have given in PGadmin

To run website open terminal in VSCode and run this --> $env:FLASK_APP = "website"

Next--> flask run

Then open this link

http://127.0.0.1:5000/hospital

