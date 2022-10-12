---
tags: CSC4500 - Database Design & Implementation
---

# Armstrong's Axioms

***Note: a &rarr; b is read as a functionally depends on b.***

## Reflexivity Rule
If *a* is a set of attributes and *b &subseteq; a*, then *a &rarr; b*.

Example:
- sname &rarr; sname
- sname, csect &rarr; csect
- cid, csect &rarr; cid

## Augmentation Rule
If *a &rarr; b* and *c* is a set of attributes then *ca &rarr; cb*.

Example:
- *a &rarr; b* = cid &rarr; crdhrs
- *c* = gpa
- New FD = cid, gpa &rarr; crdhrs, gpa

## Transitivity Rule
If *a &rarr; b* and *b &rarr; c*, then *a &rarr; c*.

Example:
- *a &rarr; b* = cid, csect &rarr; inst
- *b &rarr; c* = inst &rarr; office
- New FD = cid, cset &rarr; office

## Closure Set of Functional Dependencies (FDs)
Is the maximum set of functional dependencies that apply to a table. You can apply Armstrong's Axioms to a set of FDs to obtain the closure set of FDs.