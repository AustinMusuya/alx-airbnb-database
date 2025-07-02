# 📘 Advanced SQL Join Queries – Airbnb Clone

This directory demonstrates use of SQL joins on the official Airbnb database schema.

## ✅ Entities Used

- `user`: contains user details (guest, host, admin)
- `property`: contains property listings
- `booking`: tracks booking transactions
- `review`: contains guest reviews for properties

## 🔍 Queries Overview

### 1. INNER JOIN: Bookings with Users

Lists all bookings that are linked to a registered user.

```sql
SELECT ...
FROM booking
INNER JOIN user ON booking.user_id = user.user_id;
```

### 2. LEFT JOIN: Properties with Reviews

Lists all properties and their reviews. Properties with no reviews are still included.

```sql
SELECT ...
FROM property
LEFT JOIN review ON property.property_id = review.property_id;
```

### 3. FULL OUTER JOIN: Users and Bookings

Returns all users and all bookings, even if some users haven't booked or some bookings aren't linked.

```sql
SELECT ...
FROM user
FULL OUTER JOIN booking ON user.user_id = booking.user_id;
```

> 🔁 **Note:** `FULL OUTER JOIN` is supported in PostgreSQL but not in MySQL.

## 📄 Files

- `joins_queries.sql`: Contains the SQL JOIN queries
- `README.md`: Explains query purpose and schema usage

# 📘 Subquery Practice – Airbnb Clone

This file contains SQL subqueries based on the Airbnb Clone database schema.

## 🔍 Queries Overview

### 1. Properties with Average Rating > 4.0

Uses a non-correlated subquery to retrieve all properties that have an average guest review rating greater than 4.0.

```sql
SELECT ...
FROM property
WHERE property.property_id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
```

### 2. Users with More Than 3 Bookings

Uses a correlated subquery to return users who have made more than 3 bookings.

```sql
SELECT ...
FROM user
WHERE (
    SELECT COUNT(*)
    FROM booking
    WHERE booking.user_id = user.user_id
) > 3;
```

## 💾 Files

- `subqueries.sql`: Contains the non-correlated and correlated subquery examples.
- `README.md`: This documentation.
