USE STUDENT_MANAGEMENT_SYSTEM
SELECT * FROM DEPARTMENTS
SELECT * FROM COURSES
SELECT * FROM ENROLLMENTS
SELECT * FROM STUDENTS
SELECT * FROM INSTRUCTORS

-- How many students are enrolled in each course?
			SELECT c.Course_Name, COUNT(DISTINCT e.Student_ID) AS No_of_Students
			FROM
				ENROLLMENTS e JOIN COURSES c
			ON 
				e.Course_ID = c.Course_ID
			GROUP BY 
				c.Course_Name
			ORDER BY
				No_of_Students DESC;


-- 2. Which students are enrolled in multiple courses, and which courses are they taking?
			
		WITH MultiCourseStudents AS (	
			SELECT Student_ID
			FROM
				ENROLLMENTS
			GROUP BY 
				Student_ID
			HAVING 
			COUNT (DISTINCT Course_ID) > 1)

		SELECT
			m.Student_ID,
			s.First_Name,
			s.Last_Name,
			c.Course_Name
		FROM
			MultiCourseStudents m
		JOIN
			STUDENTS s
		ON
			m.Student_ID = s.Student_ID
		JOIN
			COURSES c
		ON
			s.Department_ID = c.Department_ID
		JOIN
			ENROLLMENTS e
		ON
			c.Course_ID = e.Course_ID
		ORDER BY
			m.Student_ID;
			
-- 3. What is the total number of students per department across all courses?
			SELECT 
				d.Department_Name, COUNT (DISTINCT e.Student_ID) AS No_of_Student
			FROM
				DEPARTMENTS d
			JOIN
				COURSES c
			ON
				d.Department_ID = c.Department_ID
			JOIN
				ENROLLMENTS e
			ON
				c.Course_ID = e.Course_ID
			GROUP BY 
				d.Department_Name;

-- 4. Which courses have the highest number of enrollments?
			SELECT TOP 1
				c.Course_Name, COUNT(e.Student_ID) AS Enrollment_Count
			FROM
				ENROLLMENTS e
			JOIN
				COURSES c
			ON
				e.Course_ID = c.Course_ID
			GROUP BY
				c.Course_Name
			ORDER BY
				Enrollment_Count DESC;

-- 5. Which department has the least number of students?
			SELECT TOP 1
				d.Department_Name, COUNT(DISTINCT s.Student_ID) AS Student_Count
			FROM 
				DEPARTMENTS d
			JOIN
				STUDENTS s
			ON
				d.Department_ID = s.Department_ID
			GROUP BY
				d.Department_Name
			ORDER BY 
				Student_Count;

-- 6. Are there any students not enrolled in any course?
			SELECT 
				s.Student_ID, s.First_Name, s.Last_Name
			FROM
				STUDENTS s
			LEFT JOIN
				ENROLLMENTS e
			ON
				s.Student_ID = e.Student_ID

			WHERE 
				e.Student_ID
			IS NULL;

-- 7. How many courses does each student take on average?
			SELECT 
				COUNT(*)/ COUNT(DISTINCT Student_ID) AS AverageCoursePerStudent
			FROM
				ENROLLMENTS;

-- 8. What is the gender distribution of students across courses and instructors?
			SELECT 
				Gender,
				COUNT(Gender) AS GenderCount
			FROM
				STUDENTS
			GROUP BY
				Gender
			ORDER BY
				GenderCount DESC;

-- 9. Which course has the highest number of male or female students enrolled?
			SELECT 
				TOP 1
				e.Course_ID,
				COUNT(s.Gender) AS GenderCount
			FROM
				ENROLLMENTS e
			JOIN
				STUDENTS s
			ON
				e.Student_ID = s.Student_ID
			WHERE
				s.Gender = 'Male'
			GROUP BY
				e.Course_ID
			ORDER BY
				GenderCount DESC;
