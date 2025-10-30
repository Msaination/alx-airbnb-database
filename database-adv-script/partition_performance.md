Performance Report
Before Partitioning:

Full table scan on bookings

High execution time

No pruning of irrelevant rows

After Partitioning:

Query planner prunes partitions outside the date range

Only bookings_2025 is scanned

Significant reduction in I/O and execution time

Improved scalability for future growth
