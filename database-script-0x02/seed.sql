
-- Insert Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('a1b2c3d4-e5f6-7890-1111-222233334444', 'Alice', 'Hostman', 'alice@example.com', 'hashed_pw_1', '0700111222', 'host'),
  ('b1c2d3e4-f5a6-7890-2222-333344445555', 'Bob', 'Guestman', 'bob@example.com', 'hashed_pw_2', '0700333444', 'guest'),
  ('c1d2e3f4-a5b6-7890-3333-444455556666', 'Clara', 'Adminson', 'clara@example.com', 'hashed_pw_3', '0700555666', 'admin');

-- Insert Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES 
  ('p1a2b3c4-d5e6-7890-4444-555566667777', 'a1b2c3d4-e5f6-7890-1111-222233334444', 'Oceanview Apartment', 'A cozy seaside apartment', 'Mombasa, Kenya', 75.00),
  ('p2b3c4d5-e6f7-7890-5555-666677778888', 'a1b2c3d4-e5f6-7890-1111-222233334444', 'Nairobi Studio', 'Minimalist studio in CBD', 'Nairobi, Kenya', 50.00);

-- Insert Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('bk1c2d3e4-f5g6-7890-6666-777788889999', 'p1a2b3c4-d5e6-7890-4444-555566667777', 'b1c2d3e4-f5a6-7890-2222-333344445555', '2025-07-10', '2025-07-15', 375.00, 'confirmed'),
  ('bk2d3e4f5-g6h7-7890-7777-888899990000', 'p2b3c4d5-e6f7-7890-5555-666677778888', 'b1c2d3e4-f5a6-7890-2222-333344445555', '2025-08-01', '2025-08-03', 100.00, 'pending');

-- Insert Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
  ('pay1e2f3g4-h5i6-7890-8888-999900001111', 'bk1c2d3e4-f5g6-7890-6666-777788889999', 375.00, 'credit_card');

-- Insert Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
  ('rv1f2g3h4-i5j6-7890-9999-000011112222', 'p1a2b3c4-d5e6-7890-4444-555566667777', 'b1c2d3e4-f5a6-7890-2222-333344445555', 5, 'Amazing stay! Great view and host.');

-- Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
  ('msg1g2h3i4-j5k6-7890-aaaa-111122223333', 'b1c2d3e4-f5a6-7890-2222-333344445555', 'a1b2c3d4-e5f6-7890-1111-222233334444', 'Hi, is your apartment available next week?');
