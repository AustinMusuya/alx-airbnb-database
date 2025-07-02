-- 1. Total number of bookings made by each user
SELECT user_id,
    COUNT(*) AS total_bookings
FROM booking
GROUP BY user_id;
-- 2. Rank properties based on total number of bookings (highest to lowest)
SELECT property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (
        ORDER BY COUNT(*) DESC
    ) AS booking_rank
FROM booking
GROUP BY property_id;