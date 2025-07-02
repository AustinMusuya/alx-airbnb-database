-- 1. Total number of bookings made by each user
SELECT user_id,
    COUNT(*) AS total_bookings
FROM booking
GROUP BY user_id;
-- 2. Rank properties based on total number of bookings (highest to lowest)
SELECT property_id,
    total_bookings,
    RANK() OVER (
        ORDER BY total_bookings DESC
    ) AS booking_rank,
    ROW_NUMBER() OVER (
        ORDER BY total_bookings DESC
    ) AS booking_row_number
FROM (
        SELECT property_id,
            COUNT(*) AS total_bookings
        FROM booking
        GROUP BY property_id
    ) AS property_bookings;