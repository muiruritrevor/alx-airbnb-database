-- Indexes for optimizing high-usage columns in Airbnb database
-- Index on Property.name for name-based searches (e.g., WHERE name LIKE '%Cottage%')
CREATE INDEX idx_property_name ON Property (name);

EXPLAIN SELECT property_id, name, location
FROM Property
WHERE name LIKE '%Cottage%';

EXPLAIN ANALYZE SELECT property_id, name, location
FROM Property
WHERE name LIKE 'Cozy%';

-- Index on Booking.status for filtering by status (e.g., WHERE status = 'confirmed')
CREATE INDEX idx_booking_status ON Booking (status);

-- Measeuring query performance
EXPLAIN SELECT 
    p.name,
    COUNT(b.booking_id) AS booking_count
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
WHERE b.status = 'confirmed'
GROUP BY p.name;


