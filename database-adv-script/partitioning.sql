
-- Step 1: Create the parent table with partitioning by RANGE on start_date
CREATE TABLE bookings (
    id UUID NOT NULL,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions based on start_date ranges
CREATE TABLE bookings_2024_q1 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE bookings_2024_q2 PARTITION OF bookings
    FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE bookings_2024_q3 PARTITION OF bookings
    FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE bookings_2024_q4 PARTITION OF bookings
    FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');

-- Step 3: Sample query to test performance on partitioned table
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
