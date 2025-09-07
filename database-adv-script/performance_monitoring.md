# Database Performance Monitoring and Refinement Report

## Objective
To continuously monitor and refine the database performance of the **Airbnb Clone Database** by analyzing execution plans and implementing improvements.

---

## Step 1: Monitoring Queries
We monitored frequently used queries with `EXPLAIN ANALYZE` (PostgreSQL) / `SHOW PROFILE` (MySQL).  

### Example Query 1
```sql
EXPLAIN ANALYZE
SELECT u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id
GROUP BY u.user_id;



EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';




CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);
