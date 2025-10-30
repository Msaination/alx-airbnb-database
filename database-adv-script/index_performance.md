EXPLAIN ANALYZE
SELECT 
    p.name, COUNT(*) AS total_bookings
FROM 
    bookings b
JOIN 
    properties p ON b.property_id = p.property_id
WHERE 
    b.booking_date >= '2025-01-01'
GROUP BY 
    p.name;

