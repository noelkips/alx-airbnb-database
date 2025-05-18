
-- Initial Complex Query (Before Optimization)
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email AS user_email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- Optimized Query (After Indexing and Refactoring)
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    u.email AS user_email,
    p.title AS property_title,
    p.location,
    pay.amount,
    pay.status
FROM bookings b
INNER JOIN users u ON u.id = b.user_id
INNER JOIN properties p ON p.id = b.property_id
INNER JOIN payments pay ON pay.booking_id = b.id;
