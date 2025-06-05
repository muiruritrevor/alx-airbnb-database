-- A query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT
    u.user_id, 
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS booking_count
FROM User u 
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id;

-- A window function to rank properties based on the number of bookings they have recieved 

SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    COUNT(b.booking_id) AS booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.location
ORDER BY property_rank, p.property_id;
