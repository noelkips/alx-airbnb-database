ALX Airbnb Database Module – SQL Joins
======================================

Overview
--------
This repository contains solutions for Task 0 of the ALX Airbnb Database Module, focusing on mastering SQL JOINs using a simulated Airbnb database.

The goal of this task is to develop a deep understanding of how different types of joins work—namely INNER JOIN, LEFT JOIN, and FULL OUTER JOIN—and how they apply to real-world relational datasets.

Learning Objective
------------------
- Understand and apply various SQL JOIN operations.
- Retrieve related data from multiple tables in different join scenarios.
- Handle missing or unmatched data through appropriate join types.

SQL Join Types Covered
-----------------------

1) INNER JOIN – Bookings and Users
Retrieve all bookings along with the user who made each booking.

SQL:
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;

Returns: Only records where a user exists for the booking.

2) LEFT JOIN – Properties and Reviews
Retrieve all properties and any reviews they may have, including properties with no reviews.

SQL:
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id;

Returns: All properties. For properties without reviews, review-related fields will be NULL.

3) FULL OUTER JOIN – Users and Bookings
Retrieve all users and all bookings, even if there is no match between them.

SQL:
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id;

Returns:
- Users who made bookings.
- Users with no bookings.
- Bookings not linked to any user.

Note: Some SQL engines like MySQL do not support FULL OUTER JOIN natively. In such cases, a workaround using UNION between LEFT JOIN and RIGHT JOIN may be used.

Files
-----
0-joins.sql       -- SQL queries for INNER, LEFT, and FULL OUTER JOINs
README.txt        -- Project documentation for Task 0

How to Run
----------
1. Set up your PostgreSQL database and import your schema/data if applicable.
2. Execute the queries using a SQL client or psql:

Command:
psql -f 0-joins.sql

License
-------
This project is part of the ALX Software Engineering Program. Intended for educational use only.

Author
------
Your Name
GitHub: https://github.com/noel-kips
