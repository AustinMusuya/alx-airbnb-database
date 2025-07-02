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
