
-- Seed Data for Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('u1', 'Alice', 'Johnson', 'alice@example.com', 'hashedpassword1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('u2', 'Bob', 'Smith', 'bob@example.com', 'hashedpassword2', '2345678901', 'host', CURRENT_TIMESTAMP),
('u3', 'Carol', 'White', 'carol@example.com', 'hashedpassword3', '3456789012', 'admin', CURRENT_TIMESTAMP);

-- Seed Data for Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('p1', 'u2', 'Ocean View Apartment', 'A beautiful apartment with an ocean view.', 'Miami, FL', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('p2', 'u2', 'Mountain Cabin', 'Cozy cabin in the mountains.', 'Aspen, CO', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Seed Data for Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('b1', 'p1', 'u1', '2025-06-01', '2025-06-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
('b2', 'p2', 'u1', '2025-07-10', '2025-07-15', 1000.00, 'pending', CURRENT_TIMESTAMP);

-- Seed Data for Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay1', 'b1', 600.00, CURRENT_TIMESTAMP, 'credit_card');

-- Seed Data for Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('r1', 'p1', 'u1', 5, 'Fantastic place, loved the view!', CURRENT_TIMESTAMP);

-- Seed Data for Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('m1', 'u1', 'u2', 'Is the apartment available for next weekend?', CURRENT_TIMESTAMP),
('m2', 'u2', 'u1', 'Yes, it is available from Friday.', CURRENT_TIMESTAMP);
