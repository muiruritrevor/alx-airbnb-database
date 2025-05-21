# Airbnb Database ER Diagram Requirements

## Overview

This directory contains the Entity-Relationship (ER) diagram for the Airbnb database, which models the core entities and relationships for the AirBnB clone project

## Files
- **AirBnB_ER_Diagram.drawio.png**: A PNG image of the ER diagram, showing entities, attributes, and relationships.

## Entities
The ER diagram includes the following entities with their attributes:
- **User**: Represents users (guests, hosts, admins).
  - Attributes: `user_id` (PK), `first_name`, `last_name`, `email` (UNIQUE), `password_hash`, `phone_number`, `role`, `created_at`.
- **Property**: Represents listings (e.g., houses, apartments).
  - Attributes: `property_id` (PK), `host_id` (FK -> User), `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`.
- **Booking**: Represents reservations made by users for properties.
  - Attributes: `booking_id` (PK), `property_id` (FK -> Property), `user_id` (FK -> User), `start_date`, `end_date`, `total_price`, `status`, `created_at`.
- **Payment**: Represents payments for bookings.
  - Attributes: `payment_id` (PK), `booking_id` (FK -> Booking), `amount`, `payment_date`, `payment_method`.
- **Review**: Represents user reviews for properties.
  - Attributes: `review_id` (PK), `property_id` (FK -> Property), `user_id` (FK -> User), `rating`, `comment`, `created_at`.

## Relationships
- **User to Property**: 1:N ("owns") - A user (host) can own multiple properties, but a property has one owner.
- **User to Booking**: 1:N ("makes") - A user (guest) can make multiple bookings, but a booking is made by one user.
- **Property to Booking**: 1:N ("booked for") - A property can have multiple bookings, but a booking is for one property.
- **Booking to Payment**: 1:1 ("paid for") - A booking has one payment, and a payment is for one booking.
- **User to Review**: 1:N ("writes") - A user can write multiple reviews, but a review is written by one user.
- **Property to Review**: 1:N ("receives") - A property can have multiple reviews, but a review is for one property.
