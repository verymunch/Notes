# Relational Algebra Statements
These are the relational algebra statements for queries 1A, 3, 4, 6, and 9. 

- Query 1A: Show the sid, sname and major for all students in an art course. 

    &Pi;<sub>sid, sname, major</sub> (&sigma;<sub>cid</sub> LIKE "ART%" (E &bowtie; S))

- Query 3: Show the names of all students and faculty.

  &Pi;<sub>sname</sub> (SE) &cup; &Pi;<sub>fname</sub> (F)

- Query 4: Show all courses that have no students enrolled.

  &Pi;<sub>cid</sub> (&sigma;<sub>sid = ""</sub> (E))

- Query 6: Show the faculty id and faculty name for all faculty that have taught all computer science majors.

  

- Query 9: Show the student id and number of credits they are taking.

  &Pi;<sub>sid, credits</sub> (SE)