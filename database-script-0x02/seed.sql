
-- Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid-001', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('uuid-002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host', CURRENT_TIMESTAMP),
('uuid-003', 'Carol', 'Lee', 'carol@example.com', 'hashed_pw_3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('prop-001', 'uuid-002', 'Seaside Villa', 'A beautiful villa by the sea.', 'Cape Town, South Africa', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('prop-002', 'uuid-002', 'Mountain Cabin', 'Cozy cabin in the Drakensberg mountains.', 'KwaZulu-Natal, South Africa', 90.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('book-001', 'prop-001', 'uuid-001', '2025-12-01', '2025-12-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
('book-002', 'prop-002', 'uuid-001', '2026-01-10', '2026-01-12', 180.00, 'pending', CURRENT_TIMESTAMP);

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay-001', 'book-001', 600.00, CURRENT_TIMESTAMP, 'credit_card'),
('pay-002', 'book-002', 180.00, CURRENT_TIMESTAMP, 'paypal');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('rev-001', 'prop-001', 'uuid-001', 5, 'Amazing stay! Highly recommend.', CURRENT_TIMESTAMP),
('rev-002', 'prop-002', 'uuid-001', 4, 'Great location, but a bit cold at night.', CURRENT_TIMESTAMP);

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('msg-001', 'uuid-001', 'uuid-002', 'Hi Bob, is the villa available for New Year\'s?', CURRENT_TIMESTAMP),
('msg-002', 'uuid-002', 'uuid-001', 'Hi Alice, yes it is available from Dec 30 to Jan 2.', CURRENT_TIMESTAMP);
