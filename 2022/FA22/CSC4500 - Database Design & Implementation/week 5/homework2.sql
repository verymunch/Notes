-- Query 1A: Show the sid, sname and major for all students in an art course using a select/project/where query.
SELECT s.sid, s.sname, s.major
  FROM student s, enroll e
  WHERE s.sid = e.sid AND e.cid LIKE 'ART____';
-- or
SELECT s.sid, s.sname, s.major
  FROM student s, enroll e
  WHERE s.sid = e.sid AND e.cid LIKE 'ART%';

-- Query 1B: Show the sid, sname and major for all students in an art course using a join query.
SELECT s.sid, s.sname, s.major
  FROM student s JOIN enroll e ON e.sid = s.sid
  WHERE e.cid LIKE 'ART____';
-- or
SELECT s.sid, s.sname, s.major
  FROM student s JOIN enroll e ON e.sid = s.sid
  WHERE e.cid LIKE 'ART%'; 

-- Query 1C: Show the sid, sname and major for all students in an art course using a sub-query.
SELECT s.sid, s.sname, s.major
  FROM student s
  WHERE s.sid IN
  (SELECT e.sid
    FROM enroll e
    WHERE e.cid LIKE 'ART____');
-- or
SELECT s.sid, s.sname, s.major
  FROM student s
  WHERE s.sid IN
  (SELECT e.sid
    FROM enroll e
    WHERE e.cid LIKE 'ART%');

-- Query 1D: Show the sid, sname and major for all students in an art course using a correlated sub-query.
SELECT s.sid, s.sname, s.major
  FROM student s
  WHERE EXISTS
  (SELECT *
    FROM enroll e
    WHERE e.sid = s.sid AND e.cid LIKE 'ART____');
-- or
SELECT s.sid, s.sname, s.major
  FROM student s
  WHERE EXISTS
  (SELECT *
    FROM enroll e
    WHERE e.sid = s.sid AND e.cid LIKE 'ART%'); 

/* Query 2: Create a view that performs a join between all students and the courses they are taking. Call this view StudentEnroll. Use this view for any query below requiring a join between student and enroll. */
CREATE VIEW StudentEnroll(studentID, studentName, Major, Credits, courseID, Grade) AS
  SELECT s.sid, s.sname, s.major, s.credits, e.cid, e.grade
  FROM student s, enroll e
  WHERE s.sid = e.sid;
-- or, using a natural JOIN
CREATE VIEW StudentEnroll(studentID, studentName, Major, Credits, courseID, Grade) AS
  SELECT s.sid, s.sname, s.major, s.credits, e.cid, e.grade
  FROM student s JOIN enroll e ON s.sid = e.sid;
-- Display data from StudentEnroll view
SELECT *
  FROM StudentEnroll; 

-- Query 3: Show the names of all students and faculty.
SELECT se.studentName AS "Name", "Student" AS TYPE
  FROM StudentEnroll se
  UNION
    SELECT f.fname, "Faculty"
    FROM faculty f;

-- Query 4: Show all courses that have no students enrolled.

-- Query 5: Show the course id for all courses that have only one student enrolled. 
SELECT se.courseID
  FROM StudentEnroll se
  GROUP BY se.courseID
  HAVING COUNT(*) = 1;
-- or without using StudentEnroll view
SELECT e.cid
  FROM enroll e
  GROUP BY e.cid
  HAVING COUNT(*) = 1; 

-- Query 6: Show the faculty id and faculty name for all faculty that have taught all computer science majors.

-- Query 7: Show the student id, student name, course id and grade for any student that has earned a D or F.
SELECT se.sid, se.sname, se.cid, se.grade
  FROM StudentEnroll se
  WHERE se.grade = "D" OR se.grade = "F";

-- Query 8: Show the faculty member's id and name for the faculty teaching the most courses.
SELECT c.fid, f.fname
  FROM course c JOIN faculty f ON c.fid = f.fid
  GROUP by c.fid
  HAVING COUNT(*) >=
  (SELECT max(num)
    FROM (SELECT COUNT(*) AS num
      FROM course c
      GROUP BY c.fid));

-- Query 9: Show the student id and number of credits they are taking. A 0 should be displayed for any student not taking any courses.
SELECT s.sid, COALESCE(sum(c.crdhrs), 0) AS "crdhrs"
  FROM student s LEFT OUTER JOIN enroll e ON s.sid = e.sid  
    LEFT OUTER join course c ON e.cid = c.cid  
    GROUP BY s.sid;