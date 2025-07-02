-- Step 1: Backup original booking table
ALTER TABLE booking RENAME TO booking_backup;

-- Step 2: Create the partitioned table (RANGE partitioning on start_date)
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions by quarter (adjust date ranges as needed)
CREATE TABLE booking_q1_2025 PARTITION OF booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE booking_q2_2025 PARTITION OF booking
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE booking_q3_2025 PARTITION OF booking
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE booking_q4_2025 PARTITION OF booking
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- Step 4 (Optional): Migrate data from backup
INSERT INTO booking
SELECT * FROM booking_backup;