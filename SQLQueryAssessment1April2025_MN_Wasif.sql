CREATE DATABASE LMS_Assessment_MN_Wasif_27April
USE LMS_Assessment_MN_Wasif_27April
SELECT * FROM student_cheating_dataset

--1) Cheating Analysis:
--Count how many students cheated and how many did not.

SELECT SUM(CASE WHEN cheated = 1 THEN 1 END) AS students_caught_cheating, 
       SUM(CASE WHEN cheated = 0 THEN 1 END) AS students_not_cheating
FROM  student_cheating_dataset;

--2) Penalty Distribution:
-- Retrieve the average, minimum, and maximum penalty points given to students.

SELECT AVG(penalty_points) AS average_penalty_point ,
	   MIN(penalty_points) AS minimum_penalty_point,
	   MAX(penalty_points) AS maximum_penalty_point
FROM student_cheating_dataset;

--3) Behavior and Cheating:
-- Find the most common behavior among students who were caught cheating.

SELECT student_behavior,
       COUNT(*) AS count_student_behavior_caught_cheating       
FROM student_cheating_dataset
WHERE caught_cheating = 1
GROUP BY student_behavior
ORDER BY count_student_behavior_caught_cheating desc;


--4) Proctor Impact:
-- Count how many students cheated in exams with a proctor present vs. without a proctor.

SELECT SUM(CASE WHEN proctor_present = 1 THEN 1 END) AS with_proctor_present,
	   SUM(CASE WHEN proctor_present = 0 THEN 1 END) AS without_proctor_present
FROM student_cheating_dataset
WHERE cheated = 1;

--5) Subject-Wise Cheating Rates:
-- Calculate the percentage of students who cheated in each subject.

SELECT subject,
       COUNT(*) AS total_students,
	   SUM(CASE WHEN cheated = 1 THEN 1 END) AS students_cheating,
	   ROUND(((SUM(CASE WHEN cheated = 1 THEN 1 END)) * 100 / COUNT(*)),2) AS Percentage_students_cheating        
FROM student_cheating_dataset
GROUP BY subject 
ORDER BY students_cheating desc;