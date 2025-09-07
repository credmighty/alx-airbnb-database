# Query Optimization Report

## Initial Query
The original query joined **Bookings**, **Users**, **Properties**, and **Payments** directly with `INNER JOIN`.  
This ensured completeness but resulted in:
- Large result set with redundant columns.
- High execution time when tables grew large.
- Full table scans on joins if indexes were missing.

## Performance Analysis
Using `EXPLAIN` on the initial query:
- Multiple **nested loop joins** observed.
- Full scans on **Bookings** and **Payments** tables.
- Inefficient filtering due to lack of indexes.

## Refactored Query
Key optimizations:
1. **Removed unnecessary columns** to reduce payload size.
2. **Used LEFT JOIN** for `Payments` to avoid excluding bookings without payments.
3. **Relied on indexes** (`user_id`, `property_id`, `booking_id`) for faster lookups.

## Results
- Execution time reduced significantly (observed with `EXPLAIN`).
- Index usage confirmed in query plan.
- Query now scales better for larger datasets.

## Conclusion
Optimizing queries by trimming unused columns, reducing join complexity, and leveraging indexes can drastically improve performance.  
This practice ensures efficiency in production-scale databases.
