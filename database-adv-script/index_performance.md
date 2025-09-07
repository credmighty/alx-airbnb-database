# Index Performance Report

## Objective
To improve query performance by creating indexes on high-usage columns in the **Users**, **Bookings**, and **Properties** tables.

## Indexes Implemented
- **Users**
  - `user_id` (joins, primary lookups)
  - `email` (unique lookups)

- **Bookings**
  - `user_id` (join with Users)
  - `property_id` (join with Properties)
  - `booking_date` (filtering, sorting)

- **Properties**
  - `property_id` (joins)
  - `location` (searching, filtering)

## Performance Measurement
Using `EXPLAIN` (MySQL) or `EXPLAIN ANALYZE` (PostgreSQL):

### Example Query (before indexing)
```sql
EXPLAIN
SELECT u.first_name, u.last_name, COUNT(b.booking_id) AS total_bookings
FROM Users u
JOIN Bookings b ON u.user_id = b.user_id
WHERE b.booking_date >= '2025-01-01'
GROUP BY u.user_id;
