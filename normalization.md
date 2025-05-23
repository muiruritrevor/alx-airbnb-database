# Airbnb Database Schema (3NF)

## Overview
This schema defines the Airbnb databse in Third Normal Form(3NF), ensuring no transitive dependacies, no partial dependencies, and atomic attributes with primary keys. The schema includes five tables: User, Property, Payment, Booking and Review

## Tables

1. User
   - user_id: UUID, PRIMARY KEY, INDEXED
   - first_name: VARCHAR, NOT NULL
   - last_name: VARCHAR, NOT NULL
   - email: VARCHAR, UNIQUE, NOT NULL
   - password_hash: VARCHAR, NOT NULL
   - phone_number: VARCHAR, NULL
   - role: ENUM('guest', 'host', 'admin'), NOT NULL
   - created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   * Notes: In 3NF. All attributes depend on user_id. No transitive dependencies.

2. Property
   - property_id: UUID, PRIMARY KEY, INDEXED
   - host_id: UUID, FOREIGN KEY REFERENCES User(user_id), NOT NULL
   - name: VARCHAR, NOT NULL
   - description: TEXT, NOT NULL
   - location: VARCHAR, NOT NULL
   - pricepernight: DECIMAL, NOT NULL
   - created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   - updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
   * Notes: In 3NF. location could be split into an Address table (e.g., street, city, country) for further normalization, but VARCHAR is sufficient for simplicity.

3. Booking
   - booking_id: UUID, PRIMARY KEY, INDEXED
   - property_id: UUID, FOREIGN KEY REFERENCES Property(property_id), NOT NULL
   - user_id: UUID, FOREIGN KEY REFERENCES User(user_id), NOT NULL
   - start_date: DATE, NOT NULL
   - end_date: DATE, NOT NULL
   - total_price: DECIMAL, NOT NULL
   - status: ENUM('pending', 'confirmed', 'canceled'), NOT NULL
   - created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   * Notes: In 3NF. total_price is stored for performance but could be computed (pricepernight * (end_date - start_date)). No transitive dependencies.

4. Payment
   - payment_id: UUID, PRIMARY KEY, INDEXED
   - booking_id: UUID, FOREIGN KEY REFERENCES Booking(booking_id), NOT NULL
   - amount: DECIMAL, NOT NULL
   - payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   - payment_method: ENUM('credit_card', 'paypal', 'stripe'), NOT NULL
   * Notes: In 3NF. amount is specific to the payment, not dependent on other non-key attributes.

5. Review
   - review_id: UUID, PRIMARY KEY, INDEXED
   - property_id: UUID, FOREIGN KEY REFERENCES Property(property_id), NOT NULL
   - user_id: UUID, FOREIGN KEY REFERENCES User(user_id), NOT NULL
   - rating: INTEGER, CHECK (rating >= 1 AND rating <= 5), NOT NULL
   - comment: TEXT, NOT NULL
   - created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
   * Notes: In 3NF. All attributes depend on review_id.

## Relationships
- User to Property: 1:N ("owns") - host_id links Property to User.
- User to Booking: 1:N ("makes") - user_id links Booking to User.
- Property to Booking: 1:N ("booked for") - property_id links Booking to Property.
- Booking to Payment: 1:1 ("paid for") - booking_id links Payment to Booking.
- User to Review: 1:N ("writes") - user_id links Review to User.
- Property to Review: 1:N ("receives") - property_id links Review to Property.



