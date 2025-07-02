-- Indexes for performance optimization
-- Before indexing performance test
EXPLAIN ANALYZE
SELECT *
FROM booking
WHERE user_id = 'sample-user-id';
-- Booking table: user_id and property_id are commonly used in WHERE/JOIN
CREATE INDEX idx_booking_user_id ON booking(user_id);
-- After indexing performance test
EXPLAIN ANALYZE
SELECT *
FROM booking
WHERE user_id = 'sample-user-id';
-- Index for property_id in booking table
CREATE INDEX idx_booking_property_id ON booking(property_id);
-- Property table: host_id often used in JOINs or filtering
CREATE INDEX idx_property_host_id ON property(host_id);
-- User table: email used in login/search and role used in filtering
CREATE INDEX idx_user_email ON user(email);
CREATE INDEX idx_user_role ON user(role);