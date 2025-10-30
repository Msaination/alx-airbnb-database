-- Step 1: Create the parent table with partitioning
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    payment_id INT,
    start_date DATE,
    end_date DATE,
    booking_status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions by year
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Add indexes to partitions for performance
CREATE INDEX idx_bookings_2023_start_date ON bookings_2023(start_date);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024(start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025(start_date);

-- Performance Test Query
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
