-- inner join query
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id

--left join query
SELECT
    p.property_id,
    p.name,
    p.description,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id

--full outer join query
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users u
FULL OUTER JOIN Bookings b ON u.user_id = b.user_id
