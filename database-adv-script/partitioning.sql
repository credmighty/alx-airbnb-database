-- Partitioning Bookings table by start_date (PostgreSQL example)

-- Step 1: Create parent table
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    amount DECIMAL(10,2)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions (yearly, can be monthly depending on data size)
CREATE TABLE bookings_2023 PARTITION OF Bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF Bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF Bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Example query to test performance
-- Fetch bookings in a date range (optimizer will only scan the relevant partition)
EXPLAIN ANALYZE
SELECT *
FROM Bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
