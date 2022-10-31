---
tags: CSC4500 - Database Design & Implementation
---
# Normalization
In this section, we'll cover four forms of normalization. 

## First Normal Form (1NF)
A table is in 1NF if all attributes are atomic (trivial rule, assume every table follows 1NF). 

## Second Normal Form (2NF)
A table is in 2NF iff it is in 1NF and every non-prime attribute is dependent on the __entire key__ (whole primary key not part of the primary key).

## Third Normal Form (3NF)
A table is in 3NF iff it is in 2NF and no non-prime attribute is dependent on a non-prime attribute (can't have a non-prime dependent on another non-prime). No non-prime is transitively dependent on the primary key. 

## Boyce-Codd Normal  (BCNF)
A table is in BCNF when every determinant in the canonical cover is a candidate key.

# Normalization Violation Examples
1. R(A,B,C,D) where AB is the candidate key. 

    AB &rarr; C
    
    B &rarr; D
2.