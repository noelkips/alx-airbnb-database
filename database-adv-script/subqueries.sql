
/*
This is a non-correlated subquery: it runs independently of the outer query.
It finds all property_ids with an average rating above 4.0, then filters properties accordingly.


*/

SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);


/*
This is a correlated subquery: it depends on each row from the outer query.

For every user, it counts how many bookings they made and filters only those with more than 3.
*/
SELECT *
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
