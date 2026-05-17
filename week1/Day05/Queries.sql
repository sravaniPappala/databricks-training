-- 1. List all students along with their department names.
SELECT s.student_name, d.department_name
FROM Student s
LEFT JOIN Department d
ON s.department_id = d.department_id;

-- 2. Display all staff members and their department names, including staff without departments.
SELECT st.staff_name, d.department_name
FROM Staff st
LEFT JOIN Department d
ON st.department_id = d.department_id;

-- 3. Find all departments that currently have no students assigned.
SELECT d.department_name
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
WHERE s.student_id IS NULL;

-- 4. Show students who do not have any marks recorded.
SELECT s.student_name
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id
WHERE m.student_id IS NULL;

-- 5. Display subjects that are not assigned to any staff member.
SELECT subject_name
FROM Subject
WHERE staff_id IS NULL;

-- 6. Find the average CGPA department-wise.
SELECT d.department_name, AVG(s.cgpa) AS avg_cgpa
FROM Student s
JOIN Department d
ON s.department_id = d.department_id
GROUP BY d.department_name;

-- 7. Display departments where the average CGPA is greater than 8.0.
SELECT d.department_name, AVG(s.cgpa) AS avg_cgpa
FROM Student s
JOIN Department d
ON s.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(s.cgpa) > 8.0;

-- 8. Find the total number of students in each department.
SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM Department d
LEFT JOIN Student s
ON d.department_id = s.department_id
GROUP BY d.department_name;

-- 9. Display the highest and lowest marks scored in each subject.
SELECT subject_id,
       MAX(marks) AS highest_marks,
       MIN(marks) AS lowest_marks
FROM Mark
GROUP BY subject_id;

-- 10. Find students who scored more than 90 in any exam.
SELECT DISTINCT s.student_name
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks > 90;

-- 11. Display the names of students who belong to the Computer Science department.
SELECT s.student_name
FROM Student s
JOIN Department d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- 12. Find the number of subjects handled by each staff member.
SELECT st.staff_name, COUNT(sub.subject_id) AS subject_count
FROM Staff st
LEFT JOIN Subject sub
ON st.staff_id = sub.staff_id
GROUP BY st.staff_name;

-- 13. Display students along with the total marks they obtained across all subjects.
SELECT s.student_name,
       SUM(m.marks) AS total_marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id
GROUP BY s.student_name;

-- 14. Find departments with more than 2 staff members.
SELECT d.department_name, COUNT(st.staff_id) AS total_staff
FROM Department d
JOIN Staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING COUNT(st.staff_id) > 2;

-- 15. Display students whose CGPA is above the average CGPA.
SELECT student_name, cgpa
FROM Student
WHERE cgpa > (SELECT AVG(cgpa) FROM Student);

-- 16. Find staff members earning more than the average salary of their department.
SELECT staff_name, salary
FROM Staff s1
WHERE salary > (
    SELECT AVG(s2.salary)
    FROM Staff s2
    WHERE s1.department_id = s2.department_id
);

-- 17. Display the second highest salary among staff members.
SELECT MAX(salary) AS second_highest_salary
FROM Staff
WHERE salary < (
    SELECT MAX(salary)
    FROM Staff
);

-- 18. Find students who scored the highest marks in each subject.
SELECT s.student_name, m.subject_id, m.marks
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks = (
    SELECT MAX(m2.marks)
    FROM Mark m2
    WHERE m.subject_id = m2.subject_id
);

-- 19. Display all students and their marks, including students without marks.
SELECT s.student_name, m.subject_id, m.marks
FROM Student s
LEFT JOIN Mark m
ON s.student_id = m.student_id;

-- 20. Find subjects where the average marks are below 70.
SELECT sub.subject_name, AVG(m.marks) AS avg_marks
FROM Subject sub
JOIN Mark m
ON sub.subject_id = m.subject_id
GROUP BY sub.subject_name
HAVING AVG(m.marks) < 70;

-- 21. Display students ordered by CGPA in descending order.
SELECT *
FROM Student
ORDER BY cgpa DESC;

-- 22. Find the total salary expenditure department-wise.
SELECT d.department_name,
       SUM(st.salary) AS total_salary
FROM Department d
LEFT JOIN Staff st
ON d.department_id = st.department_id
GROUP BY d.department_name;

-- 23. Display departments where the total salary exceeds 200000.
SELECT d.department_name,
       SUM(st.salary) AS total_salary
FROM Department d
JOIN Staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING SUM(st.salary) > 200000;

-- 24. Find students admitted after 2021 and having CGPA above 7.5.
SELECT *
FROM Student
WHERE admission_year > 2021
AND cgpa > 7.5;

-- 25. Display the number of students admitted each year.
SELECT admission_year,
       COUNT(*) AS total_students
FROM Student
GROUP BY admission_year;

-- 26. Find the city with the maximum number of students.
SELECT city, COUNT(*) AS total_students
FROM Student
GROUP BY city
ORDER BY total_students DESC
LIMIT 1;

-- 27. Display all departments and their staff count, including empty departments.
SELECT d.department_name,
       COUNT(st.staff_id) AS staff_count
FROM Department d
LEFT JOIN Staff st
ON d.department_id = st.department_id
GROUP BY d.department_name;

-- 28. Find students who have failed in at least one subject (marks < 50).
SELECT DISTINCT s.student_name
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
WHERE m.marks < 50;

-- 29. Display staff hired before 2018.
SELECT *
FROM Staff
WHERE hire_date < '2018-01-01';

-- 30. Find departments where no staff salary is recorded as NULL.
SELECT d.department_name
FROM Department d
JOIN Staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING COUNT(*) = COUNT(st.salary);

-- 31. Assign a row number to students ordered by CGPA.
SELECT student_name,
       cgpa,
       ROW_NUMBER() OVER(ORDER BY cgpa DESC) AS row_num
FROM Student;

-- 32. Rank students based on their CGPA.
SELECT student_name,
       cgpa,
       RANK() OVER(ORDER BY cgpa DESC) AS rank
FROM Student;

-- 33. Display dense rank of staff salaries.
SELECT staff_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank
FROM Staff;

-- 34. Find the top 3 highest scoring students using window functions.
WITH ranked_students AS (
    SELECT s.student_name,
           m.marks,
           ROW_NUMBER() OVER(ORDER BY m.marks DESC) AS rn
    FROM Student s
    JOIN Mark m
    ON s.student_id = m.student_id
)
SELECT *
FROM ranked_students
WHERE rn <= 3;

-- 35. Display running total of marks for each student.
SELECT student_id,
       marks,
       SUM(marks) OVER(
           PARTITION BY student_id
           ORDER BY exam_date
       ) AS running_total
FROM Mark;

-- 36. Find the average marks for each subject using window functions.
SELECT subject_id,
       marks,
       AVG(marks) OVER(PARTITION BY subject_id) AS avg_marks
FROM Mark;

-- 37. Display previous exam marks for each student using LAG().
SELECT student_id,
       marks,
       LAG(marks) OVER(
           PARTITION BY student_id
           ORDER BY exam_date
       ) AS previous_marks
FROM Mark;

-- 38. Display next exam marks for each student using LEAD().
SELECT student_id,
       marks,
       LEAD(marks) OVER(
           PARTITION BY student_id
           ORDER BY exam_date
       ) AS next_marks
FROM Mark;

-- 39. Find the highest marks within each subject using MAX() OVER().
SELECT subject_id,
       marks,
       MAX(marks) OVER(PARTITION BY subject_id) AS highest_marks
FROM Mark;

-- 40. Display cumulative average marks ordered by exam date.
SELECT exam_date,
       marks,
       AVG(marks) OVER(
           ORDER BY exam_date
       ) AS cumulative_avg
FROM Mark;

-- 41. Find the first student admitted in each department.
WITH ranked_students AS (
    SELECT student_name,
           department_id,
           admission_year,
           ROW_NUMBER() OVER(
               PARTITION BY department_id
               ORDER BY admission_year
           ) AS rn
    FROM Student
)
SELECT *
FROM ranked_students
WHERE rn = 1;

-- 42. Display the latest hired staff member in each department.
WITH ranked_staff AS (
    SELECT staff_name,
           department_id,
           hire_date,
           ROW_NUMBER() OVER(
               PARTITION BY department_id
               ORDER BY hire_date DESC
           ) AS rn
    FROM Staff
)
SELECT *
FROM ranked_staff
WHERE rn = 1;

-- 43. Divide students into 4 CGPA quartiles using NTILE().
SELECT student_name,
       cgpa,
       NTILE(4) OVER(ORDER BY cgpa DESC) AS quartile
FROM Student;

-- 44. Find percentage rank of students based on CGPA.
SELECT student_name,
       cgpa,
       PERCENT_RANK() OVER(ORDER BY cgpa DESC) AS percent_rank
FROM Student;

-- 45. Display cumulative distribution of salaries.
SELECT staff_name,
       salary,
       CUME_DIST() OVER(ORDER BY salary DESC) AS cumulative_distribution
FROM Staff;

-- 46. Find subjects where a student's marks are above the subject average.
SELECT student_id,
       subject_id,
       marks
FROM (
    SELECT student_id,
           subject_id,
           marks,
           AVG(marks) OVER(PARTITION BY subject_id) AS avg_marks
    FROM Mark
) t
WHERE marks > avg_marks;

-- 47. Find departments whose average staff salary is higher than overall average salary.
SELECT d.department_name,
       AVG(st.salary) AS dept_avg_salary
FROM Department d
JOIN Staff st
ON d.department_id = st.department_id
GROUP BY d.department_name
HAVING AVG(st.salary) >
(
    SELECT AVG(salary)
    FROM Staff
);

-- 48. Display students who scored above department average marks.
WITH dept_avg AS (
    SELECT s.department_id,
           AVG(m.marks) AS avg_marks
    FROM Student s
    JOIN Mark m
    ON s.student_id = m.student_id
    GROUP BY s.department_id
)
SELECT s.student_name,
       m.marks
FROM Student s
JOIN Mark m
ON s.student_id = m.student_id
JOIN dept_avg d
ON s.department_id = d.department_id
WHERE m.marks > d.avg_marks;

-- 49. Find the nth highest mark (3rd highest) using DENSE_RANK().
WITH ranked_marks AS (
    SELECT marks,
           DENSE_RANK() OVER(ORDER BY marks DESC) AS rank
    FROM Mark
)
SELECT *
FROM ranked_marks
WHERE rank = 3;

-- 50. Generate a report showing student name, department,
-- subject, exam type, marks, department average, and overall rank.

SELECT s.student_name,
       d.department_name,
       sub.subject_name,
       m.exam_type,
       m.marks,
       AVG(m.marks) OVER(PARTITION BY d.department_name) AS dept_avg,
       RANK() OVER(ORDER BY m.marks DESC) AS overall_rank
FROM Student s
JOIN Department d
ON s.department_id = d.department_id
JOIN Mark m
ON s.student_id = m.student_id
JOIN Subject sub
ON m.subject_id = sub.subject_id;