# Partitioning Performance Report

## Objective
The `Bookings` table grew very large, leading to slow queries when filtering by `start_date`.  
To improve performance, **range partitioning** by year was implemented.

## Partitioning Strategy
- The table was split into partitions: `bookings_2023`, `bookings_2024`, and `bookings_2025`.
- Queries filtered by `start_date` are routed to the relevant partition, reducing scan size.

## Performance Test
Query: 
```sql
SELECT * FROM Bookings WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
