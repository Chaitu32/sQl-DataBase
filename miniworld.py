import subprocess as sp
import pymysql
import pymysql.cursors
import datetime

from datetime import date
from pymysql.cursors import DictCursor


def get_input_integer(s):
    
    while (1):
        try:
            ID = int(input(s))
        except ValueError:
            print("Input an Integer")
        else:
            break
    return ID

def showdoctors():
    try:
        query = "SELECT * FROM DOCTORS;"
        print(query)
        cur = con.cursor()
        cur.execute(query)
        myresult = cur.fetchall()
        for x in myresult:
            print(x["DOCTOR_ID"])
        con.commit()
        print("Displaying all data tuples from Doctors")
    except Exception as e:
        print("failed to display")
        print(">>>>>>>>>>>>>>>", e)

def shownurses():
    try:
        query = "SELECT * FROM NURSES;"
        print(query)
        cur = con.cursor()
        cur.execute(query)
        myresult = cur.fetchall()
        for x in myresult :
            print(x["NURSE_ID"])
        con.commit()
        print("Displaying all data tuple from Nurse : ")
    except Exception as e:
        print("Failed to display")
        print(">>>>>>>>>>>>>>>", e)

def display_doctors():

    print("1. DOCTORS\n2. NURSES\n3. PHARMACISTS\n4. TECHNICIANS\n5. CLERK\n") 
    print("Please select required employee type number from menu above")
    while(1):
        c = get_input_integer("")
        if(c < 6 and c > 0):
            break
        else:
            print("Invalid entry type again\n")
    L = ["DOCTOR_ID", "NURSE_ID", "PHARMACIST_ID", "TECHINICAN_ID", "CLERK_ID"]
    Name = ["DOCTORS", "NURSES", "PHARMACISTS", "TECHINICANS", "CLERK" ]
    try:
        query = "SELECT * FROM EMPLOYEE INNER JOIN "+Name[c-1]+" ON ID = "+L[c-1]+";"
        cur = con.cursor()
        cur.execute(query)
        myresult = cur.fetchall()
        for x in myresult:
            print(x["ID"],x["SSN"],x["FNAME"],x["MNAME"],x["LNAME"],x["DOB"],x["SALARY"],x["GENDER"])
        con.commit()
        print("Displaying all required data tuples")
    except Exception as e:
        print("failed to display")
        print(">>>>>>>>>>>>>>>", e)

def insertpatient():

    try:
        row = {}
        print("Enter the details of Patients")

        row["ID"] = get_input_integer("Please enter Patient's ID > ")
        row["SSN"] = get_input_integer("Please enter Patient's SSN > ")

        while (1):
            print("Enter name as format <Fname> <Mname> <Lname> : ")
            name = (input("Name(Fname Minit Lname): ")).split(' ')
            if len(name) == 3 or len(name) == 2 :
                break
        if len(name) == 3:
            row["FNAME"] = name[0]
            row["MINIT"] = name[1]
            row["LNAME"] = name[2]
        else:
            row["FNAME"] = name[0]
            row["MINIT"] = ""
            row["LNAME"] = name[1]

        row["AGE"] = get_input_integer("PLease enter your age > ")
        row["DIAGNOSIS"] = input("Enter diagnosis: ")

        print("Choose Nurse id from below table....")
        shownurses()

        row["NURSE_ID"] = int(input("Enter Nurse ID: "))
        row["ROOM_NO"] = get_input_integer("Enter allocated Room number > ")
        row["FLOOR_NUM"] = get_input_integer("Enter allocated Floor number > ")
        row["DATE_ADMIT"] = date.today()

        query = "INSERT INTO PATIENTS (ID, SSN, FNAME, MNAME, LNAME, DATE_ADMIT, AGE, DIAGNOSIS, NURSE_ID, ROOM_NUM, FLOOR_NUM) VALUES(%d, %d, '%s', '%s', '%s', '%s', %d, '%s', %d, %d, %d);" % (row["ID"], row["SSN"], row["FNAME"], row["MINIT"], row["LNAME"], row["DATE_ADMIT"], row["AGE"], row["DIAGNOSIS"],row["NURSE_ID"],row["ROOM_NO"],row["FLOOR_NUM"])
        
        print(query)
        cur = con.cursor()
        cur.execute(query)
        con.commit()
        print("Inserted successfully")
        phone_cou = int(input("Enter no of phones will be entered for PATIENTS > "))
        while phone_cou > 0:
            phone_cou-=1
            try:
                row["PHONENO"] = int(input("Enter Phoneno > "))
                query = "INSERT INTO EMPLOYEE_PHONENO (PATIENT_ID ,PHONE_NO) VALUES (%d,%d);" % (row["ID"],row["PHONENO"])
                print(query)
                cur = con.cursor()
                cur.execute(query)
                con.commit()
            except Exception as e :
                con.rollback()
                print("Failed to insert Phoneno")
                print(">>>>>>>>>>>>>", e)
                continue
        email_cou = int(input("Enter no of emails will be entered for PATIENTS > "))
        while email_cou > 0:
            email_cou-=1
            try:
                row["EMAIL"] = (input("Enter Email > "))
                query = "INSERT INTO PATIENT_EMAIL (PATIENT_ID ,EMAIL) VALUES (%d,'%s');" % (row["ID"],row["EMAIL"])
                print(query)
                cur = con.cursor()
                cur.execute(query)
                con.commit()
            except Exception as e :
                con.rollback()
                print("Failed to insert email")
                print(">>>>>>>>>>>>>", e)
                continue
        Address_cou = int(input("Enter no of Address will be entered for PATIENT > "))
        while Address_cou > 0:
            Address_cou-=1
            try:
                row["ADDRESS"] = (input("Enter Address > "))
                query = "INSERT INTO PATIENT_ADDRESS (PATIENT_ID ,ADDRESS) VALUES (%d,'%s');" % (row["ID"],row["ADDRESS"])
                print(query)
                cur = con.cursor()
                cur.execute(query)
                con.commit()
            except Exception as e :
                con.rollback()
                print("Failed to insert address")
                print(">>>>>>>>>>>>>", e)
                continue
        print("Enter Guardian details")
        row["Name"]=input("Enter name of guardian: ")
        row["Gage"]=int(input("Enter Age > "))
        q2 = "INSERT INTO GUARDIANS (NAME,AGE,PATIENT_ID) VALUES('%s',%d,%d);"%(row["NAME"],row["Gage"],row["ID"])
        print(query)
        cur = con.cursor()
        cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to insert to database")
        print(">>>>>>>>>>>>>", e)
    return

def insertemployee():
    try :
        row = {}
        print("Enter the details of Employee")

        row["ID"] = get_input_integer("Please enter employee's ID > ")
        row["SSN"] = get_input_integer("Please enter employee's SSN > ")

        while (1):
            print("Enter name as format <Fname> <Mname> <Lname> : ")
            name = (input("Name(Fname Minit Lname): ")).split(' ')
            if len(name) == 3 or len(name) == 2 :
                break
        if len(name) == 3:
            row["FNAME"] = name[0]
            row["MINIT"] = name[1]
            row["LNAME"] = name[2]
        else:
            row["FNAME"] = name[0]
            row["MINIT"] = ""
            row["LNAME"] = name[1]
        print("Enter date of birth as")
        year = int(input("Enter year: "))
        month = int(input("Enter month: "))
        day = int(input("Enter day: "))
        row["DOB"] = datetime.date(year,month,day)
        row["SALARY"] = int(input("Enter the Salary:"))
        row["GENDER"] = input("Enter gender:")

        query = "INSERT INTO EMPLOYEE (ID, SSN, FNAME, MNAME, LNAME, DOB, SALARY, GENDER) VALUES(%d, %d, '%s', '%s', '%s', '%s', %d,'%s');" % (row["ID"], row["SSN"], row["FNAME"], row["MINIT"], row["LNAME"], row["DOB"],  row["SALARY"],row["GENDER"])
        print(query)
        cur = con.cursor()
        cur.execute(query)
        con.commit() 
        phone_cou = int(input("Enter no of phones will be entered for employee > "))
        while phone_cou > 0:
            phone_cou = phone_cou-1
            try:
                row["PHONENO"] = int(input("Enter Phoneno > "))
                query = "INSERT INTO EMPLOYEE_PHONENO (EMPLOYEE_ID ,PHONENO) VALUES (%d,%d);" % (row["ID"],row["PHONENO"])
                print(query)
                cur = con.cursor()
                cur.execute
                con.commit()
            except Exception as e :
                con.rollback()
                print("Failed to insert Phoneno")
                print(">>>>>>>>>>>>>", e)
                continue
        email_cou = int(input("Enter no of emails will be entered for employee > "))
        while email_cou > 0:
            email_cou = email_cou-1
            try:
                row["EMAIL"] = (input("Enter Email > "))
                query = "INSERT INTO EMPLOYEE_EMAIL (EMPLOYEE_ID ,EMAIL) VALUES (%d,'%s');" % (row["ID"],row["EMAIL"])
                print(query)
                cur = con.cursor()
                cur.execute
                con.commit()
            except Exception as e :
                con.rollback()
                print("Failed to insert email")
                print(">>>>>>>>>>>>>", e)
                continue
        Address_cou = int(input("Enter no of Address will be entered for employee > "))
        while Address_cou > 0:
            Address_cou = Address_cou-1
            try:
                row["ADDRESS"] = (input("Enter Address > "))
                query = "INSERT INTO EMPLOYEE_ADDRESS (EMPLOYEE_ID ,ADDRESS) VALUES (%d,'%s');" % (row["ID"],row["ADDRESS"])
                print(query)
                cur = con.cursor()
                cur.execute(query)
                con.commit()
            except Exception as e :
                con.rollback()
                print("Failed to insert address")
                print(">>>>>>>>>>>>>", e)
                continue
        te1 = True
        while te1 == True :
            print("Field of Employee")
            print("1.Doctor")
            print("2.Nurse")
            print("3.Clerk")
            print("4.Pharmacist")
            print("5.Techinicans")
            field = int(input("Enter option number(1-5)> "))
            if field == 1:
                print("Enter Doctor details")
                row["Sp"] = input("Enter Specialization> ")
                row["Sup_id"] = int(input("Enter Supervisior ID "))
                q3 = "INSERT INTO DOCTORS (DOCTOR_ID,SPECIALIZATION,SUPER_ID) VALUES (%d,'%s',%d);"% (row["ID"],row["Sp"],row["Sup_id"])
                print(q3)
                cur = con.cursor()
                cur.execute(q3)
                con.commit()
                temp = True
                print("Enter Qualifications one by one")
                while temp:
                    row["Qualif"]=input("Enter Qualif> ")
                    q4 = "INSERT INTO DOCTOR_QUAILF (DOCTOR_ID,QUAILFICATION) VALUES(%d,'%s');" %(row["ID"],row["Qualif"])
                    cur = con.cursor()
                    cur.execute(q4)
                    con.commit()
                    te = input("Enter 'a' to add another or any key if completed: ")
                    if te=="a" :
                        continue
                    else:
                        break

            elif field == 2:
                q3 = "INSERT INTO NURSES (NURSE_ID) VALUES(%d);" %(row["ID"])
                cur = con.cursor()
                cur.execute(q3)
                con.commit()
            elif field == 3:
                q3 = "INSERT INTO CLERK (CLERK_ID) VALUES(%d);" %(row["ID"])
                cur = con.cursor()
                cur.execute(q3)
                con.commit()
            elif field == 4:
                q3 = "INSERT INTO PHARMACISTS (PHARMACIST_ID) VALUES(%d);" %(row["ID"])
                cur = con.cursor()
                cur.execute(q3)
                con.commit()
            elif field == 5:
                print("Enter Techinican details")
                row["Sp"] = input("Enter Specialization > ")
                q4 = "SELECT * FROM LABS;"
                cur = con.cursor()
                cur.execute(q4)
                z4 = cur.fetchall()
                for x4 in z4:
                    print(x4["NAME"],"->",x4["NUMBER"])
                con.commit()
                row["LAB_NUM"]= int(input("Enter Lab number from above > "))
                q3 = "INSERT INTO TECHINICANS (TECHINICAN_ID,SPECIALIZTION,LAB_NUMBER) VALUES(%d,'%s',%d);" %(row["ID"],row["Sp"],row["LAB_NUM"])
                cur = con.cursor()
                cur.execute(q3)
                con.commit()
            else:
                print("Invaild option Enter again")
                continue
            te1 = False

    except Exception as e:
        con.rollback()
        print("Failed to insert to database")
        print(">>>>>>>>>>>>>", e)
    return

def insertdrug():
    try :
        row = {}
        print("Enter drug details:")
        row["Drug_id"] = int(input("Enter drug id > "))
        row["Drug_name"] = input("Enter drug name > ")
        row["Availablity"] = int(input("Enter Availablity of drug > "))
        row["Cost"] = int(input("Enter cost of drug> "))

        query = "INSERT INTO PHARMACY (DRUG_ID,DRUG_NAME,AVAILABLITY,COST) VALUES (%d,'%s',%d,%d);" % (row["Drug_id"],row["Drug_name"],row["Availablity"],row["Cost"])
        print(query)
        cur = con.cursor()
        cur.execute(query)
        con.commit()

    except Exception as e :
        con.rollback()
        print("Failed to insert drug")
        print(">>>>>>>>>>>>>", e)
    
    return

def option1():

    try:
        cur = con.cursor()
        print("Displaying all data tuples of PATINENTS and EMPLOYEES")
        query = "SELECT * FROM PATIENTS;"
        print(query)
        cur.execute(query)
        z= cur.fetchall()
        print("Patients data")
        for x in z:
            if x['MNAME'] == None:
                x['MNAME'] = " "
            print(x['ID'], x['SSN'], x['FNAME'],x['MNAME'],x['LNAME'] , x['DATE_ADMIT'] ,x['AGE'] ,x['DIAGNOSIS'],x['NURSE_ID'],x['ROOM_NUM'],x['FLOOR_NUM'], sep=" ")
        print("Employee data")
        display_doctors()

    except Exception as e:
        print("Failed to display")
        print(">>>>>>>>>>>>>", e)
    return

def option2():

    try:
        cur = con.cursor()
        query = "SELECT FNAME,MNAME,LNAME,ID FROM PATIENTS;"
        print(query)
        cur.execute(query)
        z0= cur.fetchall()
        con.commit()
        for x in z0:
            if x['MNAME'] == None:
                x['MNAME'] = " "
            print(x["ID"],"->",x["FNAME"],x["MNAME"],x["LNAME"])
        pat_id = int(input("Enter patientid from above > "))
        query = "SELECT * FROM REPORT AS r WHERE r.PATIENT_ID=%d ;" % (pat_id)
        print(query)
        cur.execute(query)
        z = cur.fetchall()
        con.commit()
        checklist = []
        print("Displaying diagnosis report of  a patients")
        for x in z:
            if x["DOCTOR_ID"] not in checklist:
                checklist.append(x["DOCTOR_ID"])
                q2  = "SELECT FNAME FROM EMPLOYEE AS e WHERE e.ID=%d;"%(x["DOCTOR_ID"])
                cur.execute(q2)
                z2 = cur.fetchone()
                con.commit()
                print("Name of doctor:",z2["FNAME"],"\nDrug written are:")
                for y in z :
                    if y["DOCTOR_ID"]==x["DOCTOR_ID"]:
                        temp = y["DRUG_ID"]
                        q3  = "SELECT DRUG_NAME FROM PHARMACY  WHERE DRUG_ID=%d;" % (temp)
                        cur.execute(q3)
                        z3 = cur.fetchone()
                        con.commit()
                        print(z3["DRUG_NAME"])
                           
    except Exception as e:
        print("Failed to display")
        print(">>>>>>>>>>>>>", e)
    return

def option3():
    
    age1 = input("Input minimum age: ")
    age2 = input("Input maximum age: ")
    
    try:
        cur = con.cursor()
        query = "SELECT * FROM PATIENTS WHERE AGE BETWEEN {} AND {};"
        print(query.format(age1, age2))
        cur.execute(query.format(age1, age2))
        z = cur.fetchall()
        con.commit()
        for x in z:
            if x['MNAME'] == None:
                x['MNAME'] = " "
            print(x['ID'], x['FNAME'],x['MNAME'],x['LNAME'] ,x['AGE'] , sep=" ")
        print("Displaying patients with age group between", age1, "and", age2)
    except Exception as e:
        print("Error displaying required patients")
        print(">>>>>>>>>>>>>", e)
    return

def option4():
    try:
        cur = con.cursor()
        query = "SELECT AVG(SALARY) AS avg_emp FROM EMPLOYEE;"
        print(query)
        cur.execute(query)
        z = cur.fetchone()
        con.commit()
        print(z["avg_emp"])

    except Exception as e:
        print("Error displying Average")
        print(">>>>>>>>>>>>>", e)
    return
    

def option5():
    try:
        cur = con.cursor()
        print("Enter the details")
        query = "SELECT FNAME,MNAME,LNAME,ID FROM PATIENTS;"
        print(query)
        cur.execute(query)
        con.commit()
        z0= cur.fetchall()
        for x in z0:
            if x['MNAME'] == None:
                x['MNAME'] = " "
            print(x["ID"],"->",x["FNAME"],x["MNAME"],x["LNAME"])
        pat_id = int(input("Enter patientid from above > "))
        query = "SELECT FNAME,MNAME,LNAME,ID FROM EMPLOYEE,DOCTORS  WHERE ID=DOCTOR_ID;"
        print(query)
        cur.execute(query)
        con.commit()
        z1= cur.fetchall()
        for x in z1:
            if x['MNAME'] == None:
                x['MNAME'] = " "
            print(x["ID"],"->",x["FNAME"],x["MNAME"],x["LNAME"])
        doc_id = int(input("Enter doctorid from above > "))
        query = "SELECT DRUG_ID,DRUG_NAME FROM PHARMACY;"
        print(query)
        cur.execute(query)
        con.commit()
        z2= cur.fetchall()
        for x in z2:
            print(x["DRUG_ID"],"->",x["DRUG_NAME"])
        while True:
            temp = int(input("Enter drugId > "))
            q = "INSERT INTO REPORT (DOCTOR_ID,PATIENT_ID,DRUG_ID) VALUES(%d,%d,%d)" % (doc_id,pat_id,temp)
            cur.execute(q)
            con.commit()
            temp2  = input("Enter q to quit or press Enter to continue > ")
            if temp2 == "q":
                break

    except Exception as e:
        print("Error Inserting report")
        print(">>>>>>>>>>>>>", e)
    return

def option6():
    print("1.Insert Employee")
    print("2.Insert Patient")
    print("3.Insert Drug")
    opt = int(input("Enter option(1-3) from above > "))
    if opt == 1 :
        insertemployee()
    elif opt == 2:
        insertpatient()
    elif opt == 3:
        insertdrug()
    else:
        print("Invaild option")
    return

def option7():
    
    try:
        cur = con.cursor()
        name_start = input("Enter starting letters > ")
        query = "SELECT FNAME , MNAME, LNAME FROM PATIENTS WHERE FNAME LIKE '"+name_start+"%';" 
        print(query)
        cur.execute(query)
        z = cur.fetchall()
        con.commit()
        for x in z:
            if x['MNAME'] == None:
                x['MNAME'] = " "
            print(x['FNAME'],x['MNAME'],x['LNAME'] , sep=" ")
        print("Displaying Names staring with" ,name_start)
    except Exception as e:
        print("Error displying Fname")
        print(">>>>>>>>>>>>>", e)
    return

def option8():
    try:
        cur = con.cursor()
        query = "SELECT AVG(count) AS Avg_patients FROM (SELECT COUNT(*) as count FROM PATIENTS AS p GROUP BY DATE_ADMIT) AS c ;"
        print(query)
        cur.execute(query)
        con.commit()
        z = cur.fetchone()
        print("Displying Avg patients")
        print("Average is:",z['Avg_patients'])
    except Exception as e:
        print("Unable find Avg patients")
        print(">>>>>>>>>>>>>", e)
    return    

def option9():

    try:
        cur = con.cursor()
        query = "SELECT e.ID ,e.FNAME, e.MNAME, e.LNAME FROM EMPLOYEE AS e,DOCTORS AS d WHERE e.ID=d.DOCTOR_ID;"
        print(query)
        cur.execute(query)
        z = cur.fetchall()
        con.commit()
        print("Displying doctors and their ID's")
        for x in z :
            if x["MNAME"] == None:
                x["MNAME"] = " "
            print(x["FNAME"] , x["MNAME"] ,x["LNAME"],"-> (ID) ",x["ID"] )
        d_id = int(input("Enter Id of the doctor > "))
        query = "SELECT p.FNAME, p.MNAME, p.LNAME FROM (SELECT DISTINCT r.PATIENT_ID AS pid FROM REPORT AS r WHERE r.DOCTOR_ID=%d) AS re, PATIENTS AS p WHERE re.pid=p.ID ;" % (d_id)
        print(query)
        cur.execute(query)
        con.commit()
        z = cur.fetchall()
        print("Displying patients list")
        i = 1
        for x in z :
            if x['MNAME'] == None:
                x['MNAME'] = " "
            print(i,". ",x['FNAME'] , x['MNAME'] ,x['LNAME'])
            i = i+1
        
    except Exception as e:
        print("Unable to fetch patients who consulted a doctor")
        print(">>>>>>>>>>>>>", e)
    return

def most_solddrug():
    try :
        query = "SELECT p.F,p.T FROM (SELECT P.DRUG_ID AS F,COUNT(P.DRUG_ID)*COST AS T FROM REPORT R,PHARMACY P WHERE P.DRUG_ID = R.DRUG_ID GROUP BY R.DRUG_ID) AS p ,(SELECT MAX(A.T) AS minat FROM (SELECT P.DRUG_ID AS F,COUNT(P.DRUG_ID)*COST AS T FROM REPORT R,PHARMACY P WHERE P.DRUG_ID = R.DRUG_ID GROUP BY R.DRUG_ID) AS A) AS m WHERE m.minat=p.T;"
        print(query)
        cur = con.cursor()
        cur.execute(query)
        myresult = cur.fetchall()
        for x in myresult:
            q = "SELECT DRUG_NAME FROM PHARMACY WHERE DRUG_ID=%s;"%(x["F"])
            cur = con.cursor()
            cur.execute(q)
            r = cur.fetchone()
            con.commit()
            print(r["DRUG_NAME"],"->",x["T"])
        con.commit()
    except Exception as e:
        print("Unable to fetch max sold drug_id")
        print(">>>>>>>>>>>>>", e)
    return

def least_solddrug():
    try:
        query = "SELECT p.F,p.T FROM (SELECT P.DRUG_ID AS F,COUNT(P.DRUG_ID)*COST AS T FROM REPORT R,PHARMACY P WHERE P.DRUG_ID = R.DRUG_ID GROUP BY R.DRUG_ID) AS p ,(SELECT MIN(A.T) AS minat FROM (SELECT P.DRUG_ID AS F,COUNT(P.DRUG_ID)*COST AS T FROM REPORT R,PHARMACY P WHERE P.DRUG_ID = R.DRUG_ID GROUP BY R.DRUG_ID) AS A) AS m WHERE m.minat=p.T;"
        print(query)
        cur = con.cursor()
        cur.execute(query)
        myresult = cur.fetchall()
        for x in myresult:
            q = "SELECT DRUG_NAME FROM PHARMACY WHERE DRUG_ID=%s;"%(x["F"])
            cur = con.cursor()
            cur.execute(q)
            r = cur.fetchone()
            con.commit()
            print(r["DRUG_NAME"],"->",x["T"])
        con.commit()

    except Exception as e:
        print("Unable to fetch min sold drug_id")
        print(">>>>>>>>>>>>>", e)

def total_solddrug():
    try:
        query = "SELECT SUM(A.T) AS sumat FROM (SELECT P.DRUG_ID ,COUNT(P.DRUG_ID)*COST AS T FROM REPORT R,PHARMACY P WHERE P.DRUG_ID = R.DRUG_ID GROUP BY R.DRUG_ID) AS A;"
        print(query)
        cur = con.cursor()
        cur.execute(query)
        myresult = cur.fetchall()
        for x in myresult:
            print(x["sumat"])
        con.commit()
    except Exception as e:
        print("Unable to calulate amount obtain")
        print(">>>>>>>>>>>>>", e)
    
def updating_drug_cost_availabilty():
    try:
        C = get_input_integer("ENTER DRUG_ID: > ")
        A = get_input_integer("ENTER NEW COST : > ")
        B = get_input_integer("ENTER DRUG_AVAILBILTY : >")
        query = "UPDATE PHARMACY SET COST =%d, AVAILABLITY =%d WHERE DRUG_ID =%d;"  % (A,B,C)
        print(query)
        cur = con.cursor()
        cur.execute(query)
        con.commit()
    except Exception as e:
        print("Unable to update")
        print(">>>>>>>>>>>>>", e)
    return

def delete_drug():
    try:
        A = get_input_integer("ENTER DRUG ID : > ")
        q2 = "DELETE FROM REPORT WHERE DRUG_ID=%d" %(A)
        cur = con.cursor()
        cur.execute(q2)
        con.commit()
        query = "DELETE FROM PHARMACY WHERE DRUG_ID =%d ;" %(A)
        print(query)
        cur = con.cursor()
        cur.execute(query)
        con.commit()
    except Exception as e:
        print("Unable to delete drug")
        print(">>>>>>>>>>>>>", e)
    return

def option10():
    most_solddrug()
    return

def option11():
    least_solddrug()
    return

def option12():
    total_solddrug()
    return

def option13():
    updating_drug_cost_availabilty()
    return

def option14():
    delete_drug()
    return

def dispatch(choice):
   
    if(choice == 1):
        option1()
    elif(choice == 2):
        option2()
    elif(choice == 3):
        option3()
    elif(choice == 4):
        option4()
    elif(choice == 5):
        option5()
    elif(choice == 6):
        option6()
    elif(choice == 7):
        option7()
    elif(choice == 8):
        option8()
    elif(choice == 9):
        option9()
    elif(choice == 10):
        option10()
    elif(choice == 11):
        option11()
    elif(choice == 12):
        option12()
    elif(choice == 13):
        option13()
    elif(choice == 14):
        option14()
    else:
        print("Error: Invalid Option")
    return
        
while(1):

    tmp = sp.call('clear', shell = True)
    username = input("Username: ")
    password = input("Password: ")
    databasename = input("Databasename: ")

    try:
        con = pymysql.connect(host='127.0.0.1',port=5005, user=username, password=password,db=databasename,cursorclass=pymysql.cursors.DictCursor)
        if(con.open):
            print("connected")
        else:
            print("Failed to connect")
        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                print("1. SHOW PATIENTS AND EMPLOYEES ADMITTED")  
                print("2. GET REPORTS OF EACH PATIENT")  
                print("3. PATIENTS OF AGE BETWEEN TWO NUMBERS")  
                print("4. AVERAGE SALARY TAKEN BY ALL EMPLOYEES")  
                print("5. INSERT REPORT OF A PATIENT")
                print("6. INSERTING VALUES INTO Employees OR Patients  OR Drug")
                print("7. GET NAME OF PATIENTS STARTING WITH \'MA\'")
                print("8. AVERAGE number of patients per day")
                print("9. LIST of PATIENTS name who consulted a DOCTOR")
                print("10.Most sold DRUG")
                print("11.Least sold DRUG")
                print("12.AMOUNT due selling DRUGS")
                print("13.Updating Availblity of a drug")
                print("14.Delete a Drug")
                print("15.Logout")
                ch = int(input("Enter choice > "))
                tmp = sp.call('clear', shell=True)
                if ch == 15:
                    break
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")
        tmp = input("Enter any key to CONTINUE or q to quit>")
        if tmp == 'q' :
            break

    except:
        tmp = sp.call('clear', shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
