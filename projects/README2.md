Python 2.7.18
Python 3.7.9
PyMySQL==0.9.3

## SAMPLE LOGIN
<all>
username = 1
password = 1

<student>
username = kay123
password = 1234

<faculty>
username = asd2
password = 123

<employee>
username = qwe2
password = 123

# STUDENT RECORD KEEPING SYSTEM DATABASE

The STUDENT RECORD KEEPING SYSTEM DATABASE application is a record management design to track students’ education records. Education records contain information about a student, such as administration information, course, major, finance(tuition and cost), health and immunization records, etc.
Because student records should be read/write/update by only authorized users, its user menu only is shown to permitted users. This means that if the user only has a read permit but no written access on the table, the user will not see the table when he/she try to write on the table, even though he/she was able to read the table.
More, because all records are private, student users can only read their data.  

# starting the program

          python3 user_interface.py

application should create and insert its data autometically, and show up user menu.

          Created database studentRecordsDb
          67 Executed queries from databasemodel.sql
          302 Executed queries from insert.sql

          Set up process finished

          User Menu 
          1. Create Account 
          2. Login 
          3. EXIT 

          Select one option from the menu: 2 


 ## create user account

          User Menu 
          1. Create Account 
          2. Login 
          3. EXIT 

          Select one option from the menu: 1
          What is your affiliation to school?
          1. Student
          2. Faculty
          3. Employee

          Select menu: 1




          First Name : sdf
          Last Name : sdf
          Admission Number : 123
          Ethnicity : dsa
          Gender : asd
          Prefer name if you have: asd
          Date of birth (YYYY/MM/DD) : 1111/1/1
          UserName : qqq
          Password : qqq



          User Menu 
          1. Create Account 
          2. Login 
          3. EXIT 


## login
application will ask you account type. [affiliation: 1= student, 2= faculty, 3= employee]
all account have different permission on table and action.

          What is your affiliation to school?
          1. Student
          2. Faculty
          3. Employee

          Select menu: 1




          Enter username :1
          Enter password : 1

          Login success.

## search

          Select menu
          1. Search
          2. Insert
          3. Update
          4. Delete
          5. Log Out
          Select menu: 1

          Tables:
          1 academics
          2 EnrolledStudent
          3 finance
          4 financial_aid
          5 health_service
          6 student
          7 student_address

          Select a table to search: 1
          TABLE SELECTED IS  academics

Because the user log in as student, applicaion only shows user's data.

          Results from: academics
          student_academic_id: [1]
          major_program_id: ['Artificial Intelligence']
          student_account: ['JUNGSUN EOH']
          gpa: [Decimal('3.9')]
          graduation_status: [0]
          units_taken: [200]
          student_records: [4]

## insert 

          Select menu
          1. Search
          2. Insert
          3. Update
          4. Delete
          5. Sign Out
          Select menu: 2

          Tables:
          1 class_roster

          Enter a table to insert data: 1
          class_roster
          attributes: (('class_roster_id',), ('section',), ('semester',), ('student_account',), ('grade',))

when enter the attributes primary key should not be included.

          Enter the name attribute/s separated by comma? section, semester, student_account, grade
          Enter the values separated by comma: 2, "1010", 3, 2.9
          Data successfully inserted into class_roster 


          Select menu
          1. Search
          2. Insert
          3. Update
          4. Delete
          5. Sign Out
          Select menu: 1





          Tables:
          1 class_roster
          2 class_section
          3 faculty

          Select a table to search: 1
          TABLE SELECTED IS  class_roster
          attributes: (('class_roster_id',), ('section',), ('semester',), ('student_account',), ('grade',))
          Search by (i.e name)? student_account
          Enter the value: 3


          Results from: class_roster
          class_roster_id: [3, 5]
          section: ['CSC805', 'CSC875']
          semester: ['2021SP', '"1010"']
          student_account: ['SIDNY ORTIZ', 'SIDNY ORTIZ']
          grade: [Decimal('4.0'), Decimal('2.9')]

## update

          Select menu
          1. Search
          2. Insert
          3. Update
          4. Delete
          5. Sign Out
          Select menu: 3





          Tables:
          1 class_roster
          2 class_section
          3 faculty

          Enter a table to update data: 1
          attributes: (('class_roster_id',), ('section',), ('semester',), ('student_account',), ('grade',))
          Enter the attribute desire to update: student_account
          Enter its current value: 3
          Enter update value: 2

          Select menu
          1. Search
          2. Insert
          3. Update
          4. Delete
          5. Sign Out
          Select menu: 1





          Tables:
          1 class_roster
          2 class_section
          3 faculty

          Select a table to search: 1
          TABLE SELECTED IS  class_roster
          attributes: (('class_roster_id',), ('section',), ('semester',), ('student_account',), ('grade',))
          Search by (i.e name)? student_account
          Enter the value: 2


          Results from: class_roster
          class_roster_id: [2, 3, 5]
          section: ['CSC875', 'CSC805', 'CSC875']
          semester: ['2021SP', '2021SP', '"1010"']
          student_account: ['KAIN KIM', 'KAIN KIM', 'KAIN KIM']
          grade: [Decimal('3.2'), Decimal('4.0'), Decimal('2.9')]

## delete

          Select menu
          1. Search
          2. Insert
          3. Update
          4. Delete
          5. Sign Out
          Select menu: 4





          Tables:
          1 class_roster

          Enter a table to delete data: 1
          attributes: (('class_roster_id',), ('section',), ('semester',), ('student_account',), ('grade',))
          Enter the attribute desire to delete: student_account
          Enter its current value: 2
          Select menu
          1. Search
          2. Insert
          3. Update
          4. Delete
          5. Sign Out
          Select menu: 1





          Tables:
          1 class_roster
          2 class_section
          3 faculty

          Select a table to search: 1
          TABLE SELECTED IS  class_roster
          attributes: (('class_roster_id',), ('section',), ('semester',), ('student_account',), ('grade',))
          Search by (i.e name)? student_account
          Enter the value: 2


          Results from: class_roster
          class_roster_id: []
          section: []
          semester: []
          student_account: []
          grade: []


## log off and Exit

          Select menu
          1. Search
          2. Insert
          3. Update
          4. Delete
          5. Sign Out
          Select menu: 5




          1 logged out. 

          User Menu 
          1. Create Account 
          2. Login 
          3. EXIT 

          Select one option from the menu: 3



