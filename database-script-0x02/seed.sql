-- Sample Data for Airbnb Database
USE airbnb;

-- Insert Users (3 hosts, 2 guests, 1 admin)
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('u1', 'Alice', 'Oga', 'alice.oga@email.com', 'hash1', '+254700111222', 'host', '2025-05-01 10:00:00'),
('u2', 'Bob', 'Mwas', 'bob.mwas@email.com', 'hash2', '+254700333444', 'host', '2025-05-02 12:00:00'),
('u3', 'Carol', 'Wong', 'carol.wong@email.com', 'hash3', NULL, 'host', '2025-05-03 14:00:00'),
('u4', 'David', 'Kim', 'david.kim@email.com', 'hash4', '+254700555666', 'guest', '2025-05-04 09:00:00'),
('u5', 'Eve', 'Boi', 'eve.boi@email.com', 'hash5', '+254700777888', 'guest', '2025-05-05 11:00:00'),
('u6', 'Admin', 'User', 'admin@email.com', 'hash6', '+254700999000', 'admin', '2025-05-06 08:00:00');

-- Insert Properties (owned by hosts u1, u2, u3)
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('p1', 'u1', 'Cozy Nairobi Cottage', 'A charming cottage in Nairobi.', 'Nairobi, Kenya', 50.00, '2025-05-07 10:00:00', '2025-05-07 10:00:00'),
('p2', 'u1', 'Nairobi Loft', 'Modern loft with city views.', 'Nairobi, Kenya', 80.00, '2025-05-08 12:00:00', '2025-05-08 12:00:00'),
('p3', 'u2', 'Mombasa Beach House', 'Beachfront house in Mombasa.', 'Mombasa, Kenya', 120.00, '2025-05-09 14:00:00', '2025-05-09 14:00:00'),
('p4', 'u3', 'Kisumu Apartment', 'Spacious apartment near Lake Victoria.', 'Kisumu, Kenya', 60.00, '2025-05-10 09:00:00', '2025-05-10 09:00:00');

-- Insert Bookings (by guests u4, u5 for properties)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('b1', 'p1', 'u4', '2025-06-01', '2025-06-03', 100.00, 'confirmed', '2025-05-15 10:00:00'), -- 2 nights * $50
('b2', 'p3', 'u4', '2025-06-10', '2025-06-12', 240.00, 'pending', '2025-05-16 12:00:00'), -- 2 nights * $120
('b3', 'p2', 'u5', '2025-06-05', '2025-06-07', 160.00, 'confirmed', '2025-05-17 14:00:00'), -- 2 nights * $80
('b4', 'p4', 'u5', '2025-06-15', '2025-06-16', 60.00, 'canceled', '2025-05-18 09:00:00'); -- 1 night * $60

-- Insert Payments (for confirmed bookings b1, b3)
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay1', 'b1', 100.00, '2025-05-15 10:30:00', 'credit_card'),
('pay2', 'b3', 160.00, '2025-05-17 14:30:00', 'paypal');

-- Insert Reviews (by guests u4, u5 for properties they booked)
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('r1', 'p1', 'u4', 4, 'Great stay, cozy and clean!', '2025-06-04 10:00:00'),
('r2', 'p2', 'u5', 5, 'Amazing views, highly recommend.', '2025-06-08 12:00:00');


