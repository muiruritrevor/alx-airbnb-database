-- using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name
FROM Booking b INNER JOIN User u ON b.user_id = u.user_id;
 
