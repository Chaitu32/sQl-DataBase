# sQl-DataBase

## How to run project:


1. Start  the docker using 

 > docker start <ID>

2. Dump the database file Dump.sql into created datatbase 

> mysql -h <host> -u <usrname> -p <Database name> --port=<port> -p < Dump.sql

3. To run python script

> python3 miniworld.py

## We implemented a hospital database:

### We provide these functionalities:

1. SHOW PATIENTS AND EMPLOYEES ADMITTED
2. GET REPORTS OF EACH PATIENT
3. PATIENTS OF AGE BETWEEN TWO NUMBERS
4. AVERAGE SALARY TAKEN BY ALL EMPLOYEES
5. INSERT REPORT OF A PATIENT
6. INSERTING VALUES INTO Employees OR Patients  OR Drug
7. GET NAME OF PATIENTS STARTING WITH STARTING WORD
8. AVERAGE number of patients per day
9. LIST of PATIENTS name who consulted a DOCTOR
10. Most sold DRUG
11. Least sold DRUG
12. AMOUNT due selling DRUGS
13. Updating Availblity of a drug
14. Delete a Drug
