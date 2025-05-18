/**
Find total number of bookings made by each user

**/
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;

/**

This query ranks properties by number of bookings.

RANK() assigns the same rank to ties; use ROW_NUMBER() if you want unique ranking.

The OVER (ORDER BY COUNT(*) DESC) defines the ranking logic.
**/
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;
