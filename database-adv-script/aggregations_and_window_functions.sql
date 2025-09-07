-- 1. Aggregation with GROUP BY
-- Find the total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;


-- 2. Window function
-- Rank properties based on the total number of bookings they have received
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Properties p
LEFT JOIN Bookings b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;
