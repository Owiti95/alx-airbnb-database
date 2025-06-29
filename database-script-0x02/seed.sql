-- =========================
-- INSERT USERS
-- =========================
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  (uuid_generate_v4(), 'Alice', 'Wonderland', 'alice@example.com', 'hashedpassword1', '1234567890', 'guest'),
  (uuid_generate_v4(), 'Bob', 'Builder', 'bob@example.com', 'hashedpassword2', '0987654321', 'host'),
  (uuid_generate_v4(), 'Charlie', 'Chaplin', 'charlie@example.com', 'hashedpassword3', NULL, 'admin');

-- =========================
-- INSERT PROPERTIES
-- =========================
-- Assume Bob (the host) owns two properties. You'll need to fetch Bob’s user_id manually if you're testing.
-- Here we simulate it using a subquery for clarity (you can use known UUIDs if you hardcode)
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (uuid_generate_v4(), (SELECT user_id FROM Users WHERE email = 'bob@example.com'), 'Cozy Cottage', 'A cozy wooden cottage in the forest.', 'Nairobi', 45.00),
  (uuid_generate_v4(), (SELECT user_id FROM Users WHERE email = 'bob@example.com'), 'Beach House', 'Beautiful beachside retreat.', 'Mombasa', 120.00);

-- =========================
-- INSERT BOOKINGS
-- =========================
-- Alice (guest) books the Cottage
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (uuid_generate_v4(), 
   (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), 
   (SELECT user_id FROM Users WHERE email = 'alice@example.com'),
   '2025-07-01', '2025-07-05', 180.00, 'confirmed');

-- =========================
-- INSERT PAYMENTS
-- =========================
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (uuid_generate_v4(),
   (SELECT booking_id FROM Booking WHERE total_price = 180.00),
   180.00,
   'credit_card');

-- =========================
-- INSERT REVIEWS
-- =========================
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (uuid_generate_v4(),
   (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'),
   (SELECT user_id FROM Users WHERE email = 'alice@example.com'),
   5,
   'Wonderful stay, highly recommend!');

-- =========================
-- INSERT MESSAGES
-- =========================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (uuid_generate_v4(),
   (SELECT user_id FROM Users WHERE email = 'alice@example.com'),
   (SELECT user_id FROM Users WHERE email = 'bob@example.com'),
   'Hi Bob, is your beach house available next weekend?');