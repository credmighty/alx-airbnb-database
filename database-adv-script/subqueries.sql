-- 1. Non-correlated subquery:
-- Find all properties where the average rating is greater than 4.0
SELECT 
    p.property_id,
    p.name AS property_name
FROM Properties p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);


-- 2. Correlated subquery:
-- Find all users who have made more than 3 bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
) > 3;
