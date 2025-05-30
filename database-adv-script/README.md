## Airbnb Database - Advanced SQL Joins Queries

This directory contains advanced SQL queries demonstrating various types of joins (INNER JOIN, LEFT JOIN, FULL OUTER JOIN) using the Airbnb database (airbnb). These queries are designed to master complex SQL operations, aligning with the objective of understanding and applying joins to retrieve and analyze data.

### Directory Structure

#### File: joins_queries.sql

    Contains SQL queries showcasing different join types applied to the airbnb database tables (User, Booking, Property, Review).

#### File: README.md

    This documentation file, providing an overview and usage instructions.


### Database Context

The airbnb database is structured in 3NF with the following key tables:

-**User** (user_id, first_name, last_name, email, role, created_at): Stores user information (hosts, guests, admins).

-**Property** (property_id, host_id, name, location, pricepernight): Stores property listings.

-**Booking** (booking_id, property_id, user_id, start_date, end_date, total_price, status): Stores booking records.

-**Review** (review_id, property_id, user_id, rating, comment): Stores property reviews.


### Queries Overview
The joins_queries.sql file includes three queries:

-**INNER JOIN:** Retrieves all bookings and the users who made them, showing booking details (booking_id, start_date, total_price, status) and user info (first_name, last_name, email).

-**LEFT JOIN:** Retrieves all properties and their reviews, including properties without reviews, displaying property details (property_id, name, location) and review details (rating, comment) or NULL if no reviews exist.

-**FULL OUTER JOIN:** Retrieves all users and all bookings, including users without bookings and bookings without users (simulated using LEFT JOIN + RIGHT JOIN + UNION due to MySQL’s lack of native FULL OUTER JOIN), with NULL for non-matching rows.

### Usage

Set Up the Database:

Ensure MySQL is running and the airbnb database is created.

Load the schema and sample data:
mysql -u airbnb_user -p airbnb < database-script-0x01/schema.sql
mysql -u airbnb_user -p airbnb < database-script-0x02/sample_data.sql

Run the Queries:

Execute the queries in joins_queries.sql:
mysql -u airbnb_user -p airbnb < database-adv-script/joins_queries.sql

