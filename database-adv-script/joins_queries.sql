SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.booking_date,
    users.user_id,
    users.name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.user_id;

