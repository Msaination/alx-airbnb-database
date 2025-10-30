-- Retrieve filtered bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.payment_id = pay.payment_id
WHERE 
    b.booking_date >= '2025-01-01'
    AND pay.status = 'Completed';

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.payment_id = pay.payment_id
WHERE 
    b.booking_date >= '2025-01-01'
    AND pay.status = 'Completed';



-- Indexes to speed up joins
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_payment_id ON bookings(payment_id);
CREATE INDEX idx_users_user_id ON users(user_id);
CREATE INDEX idx_properties_property_id ON properties(property_id);
CREATE INDEX idx_payments_payment_id ON payments(payment_id);

SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    u.email
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id;
