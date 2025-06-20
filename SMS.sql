CREATE DATABASE STUDENT_MANAGEMENT_SYSTEM;

USE STUDENT_MANAGEMENT_SYSTEM;

CREATE TABLE DEPARTMENTS(
			Department_ID INT PRIMARY KEY NOT NULL,
			Department_Name VARCHAR (100)
);

CREATE TABLE STUDENTS(
			Student_ID INT PRIMARY KEY NOT NULL,
			First_Name VARCHAR(50),
			Last_Name VARCHAR(50),
			Gender VARCHAR(50),
			Date_of_Birth DATE,
			Department_ID INT FOREIGN KEY REFERENCES DEPARTMENTS(Department_ID)
);

CREATE TABLE INSTRUCTORS(
			Instructor_ID INT PRIMARY KEY NOT NULL,
			Instructor_Name VARCHAR(50) NOT NULL,
			Department_ID INT NOT NULL FOREIGN KEY REFERENCES DEPARTMENTS(Department_ID)
);

CREATE TABLE COURSES(
			Course_ID VARCHAR(10) PRIMARY KEY NOT NULL,
			Course_Name VARCHAR(100),
			Department_ID INT FOREIGN KEY REFERENCES DEPARTMENTS(Department_ID),
			Instructor_ID INT NOT NULL FOREIGN KEY REFERENCES INSTRUCTORS(Instructor_ID)
);

CREATE TABLE ENROLLMENTS(
			Enrollment_ID INT PRIMARY KEY NOT NULL,
			Student_ID INT FOREIGN KEY REFERENCES STUDENTS(Student_ID),
			Course_ID VARCHAR(10) FOREIGN KEY REFERENCES COURSES(Course_ID),
			Enrollment_Date DATE NOT NULL
);

INSERT INTO DEPARTMENTS VALUES 
						(001,	'Computer Science'),
						(002, 'Accounting'),
						(003, 'Mathematics'),
						(004, 'Education'),
						(005, 'Business Administration')
;

INSERT INTO STUDENTS VALUES
						(001, 'Alice',  'Johnson',	'Female',	'2000-5-14', 001),
						(002, 'Onuha', 'Uchechi',	'Male',	'1999-8-23', 002),
						(003, 'Aishat', 'Baba', 'Female', '2001-1-5', 001),
						(004, 'David', 'Obi', 'Male', '1998-12-3', 003),
						(005, 'Adams', 'Oshimole', 'Male', '2000-7-21', 002),
						(006, 'Monsurat', 'Alejo', 'Female', '2001-3-10', 004),
						(007, 'Sarah', 'Martins', 'Female', '1998-11-3', 003),
						(008, 'Oluwafemi', 'Adigun', 'Male', '2000-2-7', 005),
						(009, 'Damilare', 'Dada', 'Male', '1997-12-15', 004),
						(010, 'Taiwo', 'Sulaimon', 'Male', '2000-10-28', 001),
						(011, 'Opeyemi', 'Lawal', 'Female', '2001-6-18', 003),
						(012, 'Tanwa', 'Coker', 'Female', '2005-8-17', 002),
						(013, 'Samuel', 'Adigun', 'Male', '2004-10-13', 005),
						(014, 'Adijat', 'Gbadebo',	'Female', '1998-4-15', 003),
						(015, 'Elizabeth', 'Arowolo', 'Female', '2001-4-21', 005),
						(016, 'Oluwaseyi', 'Dada', 'Male', '2001-6-11', 002),
						(017, 'Atinuke', 'Olowu', 'Female', '1998-9-18', 001),
						(018, 'Chibuike', 'Samson', 'Male', '2000-5-12', 003),
						(019, 'Uchenna', 'Obi',	'Female', '2001-9-17', 002),
						(020, 'Muhammed', 'Tambwa', 'Male', '1998-1-16', 004),
						(021, 'Sofiyah', 'Dantata', 'Female', '2003-2-10', 003),
						(022, 'Hafiz', 'Baba', 'Male', '1999-5-11', 005),
						(023, 'Obinna', 'Ugo', 'Male', '2001-7-2', 002),
						(024, 'Faith', 'Obi', 'Female', '2003-9-8', 003),
						(025, 'Emmanuel', 'Samuel', 'Male', '2001-3-15', 004),
						(026, 'Samuel', 'Adigun', 'Male', '2000-12-29', 005),
						(027, 'Wuraola', 'Aguda', 'Female', '1998-11-1', 003),
						(028, 'Samson', 'Ajenifuja', 'Male', '2001-5-7', 001),
						(029, 'Fathiat', 'Williams', 'Female', '2001-4-12', 002),
						(030, 'Adeola', 'Alejo', 'Female', '2001-3-12', 001)
;

INSERT INTO INSTRUCTORS VALUES
						(001, 'Prof. Anifowose', 001),
						(002, 'Dr. Lara', 002),
						(003, 'Prof. Lawal', 002),
						(004, 'Mrs Ada', 003),
						(005, 'Mr. Obinna', 001),
						(006, 'Dr. Abosede', 004),
						(007, 'Prof. Dosunmu', 005),
						(008, 'Mr. Akinyemi', 005),
						(009, 'Mrs Grace', 003),
						(010, 'Mr. Ajayi', 004)
;

INSERT INTO COURSES VALUES
						('CS101', 'Introduction to Programming', 001, 001),
						('ACC103', 'Auditing and Assurance',	002, 002),
						('CS103',	'Computer Networks', 001, 005),
						('MTH101', 'Calculus 1', 003, 004),
						('MTH103', 'Probability and Statistics', 003, 009),
						('CS104', 'Database Management Systems', 001, 001),
						('BUS102', 'Business Communication', 005, 008),
						('BUS103', 'Organizational Behaviour', 005, 008),
						('CS105', 'Operating Systems', 001, 005),
						('EDU103', 'Curriculum Development', 004, 006),
						('ACC101', 'Financial Accounting 1', 002, 003),
						('EDU101', 'Foundations of Education', 004, 006),
						('CS102', 'Data Structures and Algorithm', 001, 005),
						('MTH105', 'Abstract Algebra', 003, 009),
						('BUS105', 'Human Resource Management', 005, 007),
						('ACC102', 'Cost Accounting', 002, 002),
						('EDU104', 'Educational Technology', 004, 010),
						('MTH102', 'Linear Algebra', 003, 009),
						('ACC104',	'Taxation', 002, 003),
						('EDU102', 'Educational Psychology', 004, 010),
						('BUS101', 'Principles of Management', 005, 007),
						('ACC105', 'Management Accounting', 002, 002),
						('MTH104', 'Differential Equations', 003, 004),
						('EDU105', 'Classroom Management', 004, 006),
						('BUS104', 'Marketing Management', 005, 008)
;

INSERT INTO ENROLLMENTS VALUES
						(001, 017, 'CS102', '2023-8-3'),
						(002, 001, 'CS105', '2023-8-5'),
						(003, 001, 'CS101', '2023-8-13'),
						(004, 024, 'MTH101', '2023-9-2'),
						(005, 022, 'BUS104', '2023-9-11'),
						(006, 015, 'BUS105', '2023-9-12'),
						(007, 015, 'BUS103', '2023-9-12'),
						(008, 024, 'MTH103', '2023-9-16'),
						(009, 013, 'BUS103', '2023-10-1'),
						(010, 023, 'ACC101', '2023-10-27'),
						(011, 023, 'ACC103', '2023-10-27'),
						(012, 023, 'ACC105', '2023-10-28'),
						(013, 004, 'MTH102', '2023-10-31'),
						(014, 012, 'ACC102', '2023-11-4'),
						(015, 016, 'ACC101', '2023-11-4'),
						(016, 013, 'BUS101', '2023-11-9'),
						(017, 022, 'BUS101', '2023-11-13'),
						(018, 018, 'MTH102', '2023-11-27'),
						(019, 030, 'CS102', '2023-12-1'),
						(020, 030, 'CS103',	'2023-12-1'),
						(021, 025, 'EDU101', '2023-12-13'),
						(022, 020, 'EDU101', '2023-12-13'),
						(023, 006, 'EDU103', '2023-12-15'),
						(024, 003, 'CS101', '2023-12-21'),
						(025, 005, 'ACC102', '2023-12-28'),
						(026, 018, 'MTH103', '2024-1-3'),
						(027, 017, 'CS103', '2024-1-10'),
						(028, 015, 'BUS102', '2024-1-15'),
						(029, 005, 'ACC104', '2024-1-21'),
						(030, 001, 'CS102', '2024-12-30')
;