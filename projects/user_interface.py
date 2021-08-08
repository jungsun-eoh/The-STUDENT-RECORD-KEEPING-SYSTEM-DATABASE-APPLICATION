"""
This is the user interface where the program interacts with the user.
USAGE: 1. Go to sqlconfig.conf file and change the username and password
          values to the ones from you are using in your mysql instance
       2. Open a terminal windows and run the following command:
       python3 user_interface.py
"""

import datetime

userLoggedin = ""  # user cookie


def show_menu():
    """
    Prints in console the main menu before login
    :return: VOID
    """
    print("User Menu \n" "1. Create Account \n" "2. Login \n" "3. EXIT \n")


def user_menu(affiliation):
    """
    prints in console the main menu to user after login.
    :param affiliation: 1= student , 2= faculty, 3= employee
    :return: void
    """
    print(
        "Select menu\n"
        "1. Search\n"
        "2. Insert\n"
        "3. Update\n"
        "4. Delete\n"
        "5. Log Out\n"
    )

    user_option = int(input("Select menu: "))

    while user_option != 999:
        if user_option == 1:
            option3(db, tables, affiliation=affiliation)
        elif user_option == 2:
            option4(db, tables, affiliation=affiliation)
        elif user_option == 3:
            option5(db, tables, affiliation=affiliation)
        elif user_option == 4:
            option6(db, tables, affiliation=affiliation)
        elif user_option == 5:
            logout()
            break
        print(
            "Select menu\n"
            "1. Search\n"
            "2. Insert\n"
            "3. Update\n"
            "4. Delete\n"
            "5. Log Out\n"
        )
        user_option = int(input("Select menu: "))
        print("\n\n\n")


def show_table_names(tables, affiliation, option):
    """
    Show all the tables names logged in user have permit to access.
    The result should vary depands,
            1. what type of user's account
            2. what action user want to do with.
    :param tables: a list with the tables names allowed to read.
                   You can get it by calling the method get_table_names() from DB object
    :param affiliation: 1= student , 2= faculty, 3= employee
    :param option:      3= search, 4= insert, 5=update, 6=delete
    :return: tables_dict
    """
    if option == 3:
        if affiliation == 1:
            allowed_table = [0, 10, 15, 16, 17, 22, 24]
        elif affiliation == 2:
            allowed_table = [1, 2, 12]
        elif affiliation == 3:
            allowed_table = [0, 7, 8, 12, 16, 17, 22, 24, 30]
    elif option == 4:
        if affiliation == 1:
            allowed_table = [24]
        elif affiliation == 2:
            allowed_table = [1]
        elif affiliation == 3:
            allowed_table = [1, 3, 25, 26, 27]
    elif option == 5:
        if affiliation == 1:
            allowed_table = [10, 19, 22, 24]
        elif affiliation == 2:
            allowed_table = [1, 2, 12]
        elif affiliation == 3:
            allowed_table = [2, 15, 16, 17, 25]
    elif option == 6:
        if affiliation == 1:
            allowed_table = [24]
        elif affiliation == 2:
            allowed_table = [1]
        elif affiliation == 3:
            allowed_table = [1, 3, 25]

    index = 1
    tables_dict = dict()
    print("\nTables:")

    for i in allowed_table:
        print(index, tables[i][0])  # print tables names
        tables_dict[index] = tables[i][0]
        index += 1

    return tables_dict


def account_type():
    """
    return user's account type.
    """
    print(
        "\nWhat is your affiliation to school?\n"
        "1. Student\n"
        "2. Faculty\n"
        "3. Employee\n"
    )
    user_option = int(input("Select menu: "))
    print("\n\n\n")
    return user_option


def create_student_account(db_object):
    """
    create new student account
    1. insert new data on student
    2. insert new data on Enrolled student with connected forighn key.
    3. insert new data on student account connected with enrolled student with forign key.
    """
    first_name = input("First Name : ")
    last_name = input("Last Name : ")
    admission_number = input("Admission Number : ")
    ethnicity = input("Ethnicity : ")
    gender = input("Gender : ")
    prefer_name = input("Prefer name if you have: ")
    Date_of_birth = input("Date of birth (YYYY/MM/DD) : ")
    username = input("UserName : ")
    password = input("Password : ")
    permission_level = "2"
    activate = "1"
    try:
        table = "student"
        stu_attribute = [
            "first_name",
            "last_name",
            "ethnicity",
            "gender",
            "admission_number",
        ]
        user_data_student = [first_name, last_name, ethnicity, gender, admission_number]

        if db_object.insert(
            table=table, attributes=stu_attribute, values=user_data_student
        ):
            print("Data successfully inserted into {} \n".format(table))
            temp_table = ", ".join(stu_attribute)
            temp_val = ""
            for i in user_data_student:
                temp_val += "'" + i + "'"
                temp_val += ","
            db_object.recovery_data(
                record="""INSERT INTO {} ({}) VALUES ({})""".format(
                    table, temp_table, temp_val[:-1]
                )
            )
    except Exception as err:
        print(
            "Error: Create student account - student table >>> failed to be inserted in\n"
        )

    try:
        table = "EnrolledStudent"
        pk_student = (
            """SELECT student_id FROM student WHERE admission_number = '{}'""".format(
                admission_number
            )
        )
        fk_pk_Stu_EnrdStudent = db_object.get_user_id(query=pk_student)
        enr_attribute = ["prefer_name", "Date_of_birth", "student"]
        user_data_enr = [prefer_name, Date_of_birth, str(fk_pk_Stu_EnrdStudent[0][0])]

        if db_object.insert(
            table=table, attributes=enr_attribute, values=user_data_enr
        ):
            print("Data successfully inserted into {} \n".format(table))
            temp_table = ", ".join(enr_attribute)
            temp_val = ""
            for i in user_data_enr:
                temp_val += "'" + i + "'"
                temp_val += ","
            db_object.recovery_data(
                record="""INSERT INTO {} ({}) VALUES ({})""".format(
                    table, temp_table, temp_val[:-1]
                )
            )
    except Exception as err:
        print(
            "Error: Create student account - enrolledStudent table >>> failed to be inserted in\n"
        )

    try:
        table = "student_account"
        pk_ern_student = """SELECT enrd_student_id FROM EnrolledStudent WHERE student = '{}'""".format(
            fk_pk_Stu_EnrdStudent[0][0]
        )

        fk_stu_stuAcc = db_object.get_user_id(query=pk_ern_student)
        created = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        enr_attribute = [
            "activate",
            "created",
            "erd_student",
            "permission_level",
            "username",
            "password",
        ]
        user_data_enr = [
            activate,
            created,
            str(fk_stu_stuAcc[0][0]),
            permission_level,
            username,
            password,
        ]

        if db_object.insert(
            table=table, attributes=enr_attribute, values=user_data_enr
        ):
            print("Data successfully inserted into {} \n".format(table))
            temp_table = ", ".join(enr_attribute)
            temp_val = ""
            for i in user_data_enr:
                temp_val += "'" + i + "'"
                temp_val += ","
            db_object.recovery_data(
                record="""INSERT INTO {} ({}) VALUES ({})""".format(
                    table, temp_table, temp_val[:-1]
                )
            )
    except Exception as err:
        print(
            "Error: Create student account - student_account >>> failed to be inserted in\n"
        )


def create_faculty_account(db_object):
    first_name = input("First Name : ")
    last_name = input("Last Name : ")
    gender = input("Gender : ")
    date_of_birth = input("Date of birth (YYYY/MM/DD) : ")
    email = input("email : ")
    created = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    activated = "1"
    faculty_account_type = "1"
    permission_level = "3"
    college = input("College : ")
    username = input("UserName : ")
    password = input("Password : ")

    try:
        table = "faculty"
        ft_attribute = ["first_name", "last_name", "gender", "date_of_birth", "email"]
        user_data_faculty = [first_name, last_name, gender, date_of_birth, email]

        if db_object.insert(
            table=table, attributes=ft_attribute, values=user_data_faculty
        ):
            print("Data successfully inserted into {} \n".format(table))
            s_table = ", ".join(ft_attribute)
            s_val = ""
            for i in user_data_faculty:
                s_val += "'" + i + "'"
                s_val += ","
            db_object.recovery_data(
                record="""INSERT INTO {} ({}) VALUES ({})""".format(
                    table, s_table, s_val[:-1]
                )
            )

    except Exception as err:

        print(
            "Error: Create student account - student table >>> failed to be inserted in\n"
        )

    try:
        table = "faculty_account"
        pk_faculty = """SELECT faculty_id FROM faculty WHERE email = '{}'""".format(
            email
        )
        fk_faculty_facultyAcc = db_object.get_user_id(query=pk_faculty)
        ft_attribute = [
            "faculty",
            "created",
            "activated",
            "faculty_account_type",
            "permission_level",
            "username",
            "password",
        ]
        user_data_ft = [
            str(fk_faculty_facultyAcc[0][0]),
            created,
            activated,
            faculty_account_type,
            permission_level,
            username,
            password,
        ]

        if db_object.insert(table=table, attributes=ft_attribute, values=user_data_ft):
            print("Data successfully inserted into {} \n".format(table))
            s_table = ", ".join(ft_attribute)
            s_val = ""
            for i in user_data_ft:
                s_val += "'" + i + "'"
                s_val += ","
            db_object.recovery_data(
                record="""INSERT INTO {} ({}) VALUES ({})""".format(
                    table, s_table, s_val[:-1]
                )
            )
    except Exception as err:
        print(
            "Error: Create student account - enrolledStudent table >>> failed to be inserted in\n"
        )


def create_employee_account(db_object):
    first_name = input("First Name : ")
    last_name = input("Last Name : ")
    gender = input("Gender : ")
    date_of_birth = input("Date of birth (YYYY/MM/DD) : ")
    email = input("email : ")

    employee_account_type = "2"
    permission_level = "4"
    created = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    activated = "1"
    department = input("Department : ")
    username = input("UserName : ")
    password = input("Password : ")

    try:
        table = "employee"
        emp_attribute = ["first_name", "last_name", "gender", "date_of_birth", "email"]
        user_data_employee = [first_name, last_name, gender, date_of_birth, email]

        if db_object.insert(
            table=table, attributes=emp_attribute, values=user_data_employee
        ):
            print("Data successfully inserted into {} \n".format(table))
            s_table = ", ".join(emp_attribute)
            s_val = ""
            for i in user_data_employee:
                s_val += "'" + i + "'"
                s_val += ","
            db_object.recovery_data(
                record="""INSERT INTO {} ({}) VALUES ({})""".format(
                    table, s_table, s_val[:-1]
                )
            )
    except Exception as err:
        print(
            "Error: Create student account - student table >>> failed to be inserted in\n"
        )

    try:
        table = "employee_account"
        pk_employee = """SELECT employee_id FROM employee WHERE email = '{}'""".format(
            email
        )
        fk_emp_empAcc = db_object.get_user_id(query=pk_employee)
        fta_attribute = [
            "account_type",
            "permission_level",
            "employee",
            "created",
            "activated",
            "department",
            "username",
            "password",
        ]
        user_data_fta = [
            employee_account_type,
            permission_level,
            str(fk_emp_empAcc[0][0]),
            created,
            activated,
            department,
            username,
            password,
        ]

        if db_object.insert(
            table=table, attributes=fta_attribute, values=user_data_fta
        ):
            print("Data successfully inserted into {} \n".format(table))
            s_table = ", ".join(fta_attribute)
            s_val = ""
            for i in user_data_fta:
                s_val += "'" + i + "'"
                s_val += ","
            db_object.recovery_data(
                record="""INSERT INTO {} ({}) VALUES ({})""".format(
                    table, s_table, s_val[:-1]
                )
            )
    except Exception as err:
        print(
            "Error: Create student account - enrolledStudent table >>> failed to be inserted in\n"
        )


def option1(db_object, tables):
    try:
        affiliation = account_type()
        if affiliation == 1:
            create_student_account(db_object)
        elif affiliation == 2:
            create_faculty_account(db_object)
        elif affiliation == 3:
            create_employee_account(db_object)
        else:
            account_type()
    except:
        pass


def student_account_login(db_object):
    global userLoggedin
    try:
        username = input("Enter username :")
        query = "SELECT username, password, activate, student_account_id FROM student_account WHERE username = '{}'".format(
            username
        )
        user = db_object.select(query=query)

        if user[0][2] == 1:
            password = input("Enter password : ")
            if user == [] or user[0][1] != password:
                print("Invalid username or password.\n")
            else:
                print("\nLogin success.\n")
                userLoggedin = str(user[0][3])
                user_menu(1)
        else:
            print("Your account is not activated.\n")
    except Exception as err:  # data was not inserted, then handle error
        print("Error: failed to login. \n")


def faculty_account_login(db_object):
    global userLoggedin
    try:
        username = input("Enter username :")
        query = "SELECT username, password, activated, faculty_account_id FROM faculty_account WHERE username = '{}'".format(
            username
        )
        user = db_object.select(query=query)

        if user[0][2] == 1:
            password = input("Enter password : ")
            if user == [] or user[0][1] != password:
                print("Invalid username or password.\n")
            else:
                print("\nLogin success.\n")
                userLoggedin = user[0][3]
                user_menu(2)
        else:
            print("Your account is not activated.\n")
    except Exception as err:  # data was not inserted, then handle error
        print("Error: failed to login. \n")


def employee_account_login(db_object):
    global userLoggedin
    try:
        username = input("Enter username :")
        query = "SELECT username, password, activated, employee_acc_id FROM employee_account WHERE username = '{}'".format(
            username
        )
        user = db_object.select(query=query)

        if user[0][2] == 1:
            password = input("Enter password : ")
            if user == [] or user[0][1] != password:
                print("Invalid username or password.\n")
            else:
                print("\nLogin success.\n")
                userLoggedin = user[0][3]
                user_menu(3)
        else:
            print("Your account is not activated.\n")
    except Exception as err:  # data was not inserted, then handle error
        print("Error: failed to login. \n")


def option2(db_object, tables):
    affiliation = account_type()

    if affiliation == 1:
        student_account_login(db_object)
    elif affiliation == 2:
        faculty_account_login(db_object)
    elif affiliation == 3:
        employee_account_login(db_object)
    else:
        account_type()


def option3(db_object, tables, affiliation):
    """
    Search option
    :param db_object: database object
    :param tables: the name of the tables in the database
    :return: VOID
    """
    try:
        # shows that tables names in menu
        table_dict = show_table_names(tables, affiliation, 3)

        # get user input
        user_input = int(input("\nSelect a table to search: "))
        table_selected = table_dict[user_input]
        print("TABLE SELECTED IS ", table_selected)
        # get columns names for the table selected
        columns = db_object.get_column_names(table_selected)

        if affiliation == 1:
            attribute_selected = "student_account_id"
            value_selected = userLoggedin
        elif (affiliation == 2) and (user_input == 3):
            attribute_selected = "faculty_account_id"
            value_selected = userLoggedin
        else:
            print("attributes:", columns)
            attribute_selected = input("Search by (i.e name)? ")
            value_selected = input("Enter the value: ")

        # build queries with the user input
        query = """SELECT * FROM {} WHERE {} = %s""".format(
            table_selected, attribute_selected
        )

        if table_selected == "academics":
            query = """
            SELECT student_academic_id, major_program.name, student.fullname, gpa, graduation_status, units_taken, student_records FROM academics
            JOIN major_program ON major_program.major_program_id = academics.major_program_id
            JOIN student_account ON student_account.student_account_id = academics.student_account
            JOIN EnrolledStudent ON EnrolledStudent.enrd_student_id = student_account.erd_student
            JOIN student ON student.student_id = EnrolledStudent.student            
            WHERE {} = %s""".format(
                attribute_selected
            )
        if table_selected == "EnrolledStudent":
            query = """
            SELECT EnrolledStudent.enrd_student_id, EnrolledStudent.prefer_name, EnrolledStudent.Date_of_birth, EnrolledStudent.student
            FROM EnrolledStudent, student_account WHERE erd_student = enrd_student_id
            AND {} = %s""".format(
                attribute_selected
            )
        if table_selected == "finance":
            query = """
            SELECT finance.student_finance_id, finance.balance, finance.charge, finance.payment, financial_aid.balance, finance.student_records 
            FROM finance, student_account, student_records, financial_aid
            WHERE student_account = student_account_id
            AND finance.student_records = student_records_id
            AND financial_aid.student_records = student_records_id
            AND {} = %s""".format(
                attribute_selected
            )
        if table_selected == "financial_aid":
            query = """
            SELECT financial_aid.student_financial_aid_id, financial_aid.balance, financial_aid.years, financial_aid.student_records 
            FROM student_account, student_records, financial_aid
            WHERE student_account = student_account_id
            AND financial_aid.student_records = student_records_id
            AND {} = %s""".format(
                attribute_selected
            )
        if table_selected == "health_service":
            query = """
            SELECT health_service.student_health_id, health_service.immunization, health_service.note, health_service.student_records 
            FROM student_account, student_records, health_service
            WHERE student_account = student_account_id
            AND health_service.student_records = student_records_id
            AND {} = %s""".format(
                attribute_selected
            )
        if table_selected == "student":
            query = """
            SELECT student.student_id, student.first_name, student.last_name, student.ethnicity, student.fullname, student.gender, student.admission_number 
            FROM student_account, student, EnrolledStudent
            WHERE student = student_id
            AND erd_student = enrd_student_id
            AND {} = %s""".format(
                attribute_selected
            )
        if table_selected == "student_address":
            query = """
            SELECT student_address_id,street,city,state,zipcode,phone,email
            FROM student_account, StudentAddAddress, EnrolledStudent, student_address
            WHERE Enrd_Student = enrd_student_id
            AND student_address = student_address_id
            AND erd_student = enrd_student_id
            AND {} = %s""".format(
                attribute_selected
            )

        if table_selected == "class_roster":
            query = """
            SELECT class_roster_id, class_section.subject, semester, student.fullname, grade FROM class_roster
            JOIN class_section ON class_section.section_ID = class_roster.section
            JOIN student_account ON student_account.student_account_id = class_roster.student_account
            JOIN EnrolledStudent ON EnrolledStudent.enrd_student_id = student_account.erd_student
            JOIN student ON student.student_id = EnrolledStudent.student
            WHERE class_roster.{} = %s""".format(
                attribute_selected
            )

        if table_selected == "class_section":
            query = """
            SELECT section_ID, class_number, faculty_account.username, units, courses.subject, opened, prerequisites, description, class_section.subject
            FROM class_section
            JOIN courses ON courses.course_ID = class_section.course_id
            JOIN faculty_account ON faculty_account.faculty_account_id = class_section.instructor
            WHERE class_section.{} = %s""".format(
                attribute_selected
            )

        if table_selected == "faculty":
            query = """SELECT faculty_id, first_name, last_name, fullname, gender, date_of_birth, email
            FROM faculty 
            JOIN faculty_account ON faculty_account.faculty = faculty.faculty_id
            WHERE faculty.{} = %s""".format(
                attribute_selected
            )

        if table_selected == "employee":
            query = """
            SELECT employee_id, first_name, last_name, fullname, gender, date_of_birth, email 
            FROM employee WHERE employee.{} = %s""".format(
                attribute_selected
            )
        if table_selected == "student_employee":
            query = """
            SELECT student_emp_id, department.name, student.fullname, salary
            FROM student_employee, department, student_account, EnrolledStudent, student
            WHERE department.department_id = student_employee.department
            AND student_employee.student_account = student_account.student_account_id
            AND student_account.erd_student = EnrolledStudent.enrd_student_id
            AND EnrolledStudent.student = student.student_id;
            WHERE student_employee.{} = %s""".format(
                attribute_selected
            )

        value = value_selected

        # get the results from the above query
        results = db_object.select(query=query, values=value)
        column_index = 0

        # print results
        print("\n")
        print("Results from: " + table_selected)
        for column in columns:
            values = []
            for result in results:
                values.append(result[column_index])
            print("{}: {}".format(column[0], values))  # print attribute: value
            column_index += 1
        print("\n")

    except Exception as err:  # handle error
        print("The data requested couldn't be found\n")


# option 4 when user selects insert
def option4(db_object, tables, affiliation):
    try:
        # show tables names
        table_dict = show_table_names(tables, affiliation, 4)

        # get user input for insert
        table = int(input("\nEnter a table to insert data: "))
        table = table_dict[table]
        print(table)

        columns = db_object.get_column_names(table)
        print("attributes:", columns)

        attributes_str = input("Enter the name attribute/s separated by comma? ")
        values_str = input("Enter the values separated by comma: ")

        # from string to list of attributes and values
        if "," in attributes_str:  # multiple attributes
            attributes = attributes_str.split(",")
            values = values_str.split(",")
        else:  # one attribute
            attributes = [attributes_str]
            values = [values_str]

        if db_object.insert(table=table, attributes=attributes, values=values):
            print("Data successfully inserted into {} \n".format(table))
            s_table = ", ".join(attributes)
            s_val = ""
            for i in values:
                s_val += "'" + i + "'"
                s_val += ","

            db_object.recovery_data(
                record="""INSERT INTO {} ({}) VALUES ({})""".format(
                    table, s_table, s_val[:-1]
                )
            )

    except:  # data was not inserted, then handle error
        print("Error:", values_str, "failed to be inserted in ", table, "\n")


def option5(db_object, tables, affiliation):
    try:
        table_dict = show_table_names(tables, affiliation, 5)

        # get user input for update
        table = int(input("\nEnter a table to update data: "))
        Table = table_dict[table]

        columns = db_object.get_column_names(Table)
        print("attributes:", columns)
        attributes_str_search = input("Enter the attribute desire to update: ")
        values_str_search = input("Enter its current value: ")
        values_str_change = input("Enter update value: ")

        query = """UPDATE {} SET {} = '{}' WHERE {} = '{}'""".format(
            Table,
            attributes_str_search,
            values_str_change,
            attributes_str_search,
            values_str_search,
        )
        db_object.update(query=query)
        db_object.recovery_data(record=query)

    except:
        print("Error: option5:: update.\n")


def option6(db_object, tables, affiliation):
    try:
        table_dict = show_table_names(tables, affiliation, 6)
        Table = int(input("\nEnter a table to delete data: "))
        table = table_dict[Table]

        columns = db_object.get_column_names(table)
        print("attributes:", columns)

        attributes_str = input("Enter the attribute desire to delete: ")
        values_str = input("Enter its current value: ")
        query = """DELETE FROM {} WHERE {} = '{}' """.format(
            table, attributes_str, values_str
        )
        db_object.delete(query=query)

        db_object.recovery_data(record=query)
    except:
        print("Error: option6:: delete.\n")


def logout():
    global userLoggedin
    print(userLoggedin, "logged out. \n")
    # userLoggedin = ""


##### Driver execution.....
from database import DB

print("Setting up the database......\n")

# DB API object
db = DB(config_file="sqlconfig.conf")

# create a database (must be the same as the one is in your config file)
database = "studentRecordsDb"
if db.create_database(database=database, drop_database_first=True):
    print("Created database {}".format(database))
else:
    print("An error occurred while creating database {} ".format(database))

# create all the tables from databasemodel.sql
db.run_sql_file("databasemodel.sql")

# insert sample data from insert.sql
db.run_sql_file("insert.sql")
db.run_sql_file("transaction.sql")

print("\nSet up process finished\n")

tables = db.get_table_names()
show_menu()
option = int(input("Select one option from the menu: "))
while option != 3:
    if option == 1:
        option1(db, tables)  # pass  # create your account
    elif option == 2:
        option2(db, tables)
    show_menu()
    option = int(input("Select one option from the menu: "))
# Example output for insert and search
