-- 1. INNER JOIN: Retrieve all bookings with their corresponding users
SELECT booking.booking_id,
    booking.property_id,
    booking.start_date,
    booking.end_date,
    booking.total_price,
    booking.status,
    user.user_id,
    user.first_name,
    user.last_name,
    user.email
FROM booking
    INNER JOIN user ON booking.user_id = user.user_id
ORDER BY booking.start_date DESC;
-- 2. LEFT JOIN: Retrieve all properties and their reviews (include properties with no reviews)
SELECT property.property_id,
    property.name AS property_name,
    property.location,
    review.review_id,
    review.rating,
    review.comment,
    review.created_at AS review_date
FROM property
    LEFT JOIN review ON property.property_id = review.property_id;
-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if no relationship exists
-- ⚠️ Note: This works in PostgreSQL. MySQL does not support FULL OUTER JOIN directly.
SELECT user.user_id,
    user.first_name,
    user.last_name,
    booking.booking_id,
    booking.property_id,
    booking.start_date,
    booking.status
FROM user
    FULL OUTER JOIN booking ON user.user_id = booking.user_id;