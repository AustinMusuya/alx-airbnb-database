-- 🔍 Initial Query: Full Join across Bookings, Users, Properties, and Payments
EXPLAIN ANALYZE
SELECT b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM booking b
    JOIN user u ON b.user_id = u.user_id
    JOIN property p ON b.property_id = p.property_id
    LEFT JOIN payment pay ON b.booking_id = pay.booking_id;
-- ✅ Refactored Query: Optimized using only required columns, LEFT JOIN for users and payments
EXPLAIN ANALYZE
SELECT b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount
FROM booking b
    LEFT JOIN user u ON b.user_id = u.user_id
    LEFT JOIN property p ON b.property_id = p.property_id
    LEFT JOIN payment pay ON b.booking_id = pay.booking_id;