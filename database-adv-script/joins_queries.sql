-- An INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name
FROM Booking b 
INNER JOIN User u ON b.user_id = u.user_id;

-- A LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews. 
 SELECT
    p.name AS property_name,
    p.description,
    p.location,
    r.rating,
    r.comment,
    r.created_at
FROM Property p 
LEFT JOIN Review r ON p.property_id = r.property_id
ODER BY r.cereated_at DESC;

-- A FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    b.booking_id, 
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM User u 
LEFT JOIN Booking b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id, 
    u.first_name, 
    u.last_name, 
    b.booking_id, 
    b.start_date, 
    b.end_date, 
    b.total_price, 
    b.status 
FROM User u 
RIGHT JOIN Booking b ON u.user_id = b.user_id;


