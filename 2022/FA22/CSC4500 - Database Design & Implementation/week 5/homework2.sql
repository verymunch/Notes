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