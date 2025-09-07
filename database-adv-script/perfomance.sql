-- Initial complex query (unoptimized)
-- Retrieves bookings with user, property, and payment details

SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id;


-- Refactored / Optimized query
-- Assumes indexes are created on user_id, property_id, and booking_id for faster joins

SELECT 
    b.booking_id,
    b.booking_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_date
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id;
