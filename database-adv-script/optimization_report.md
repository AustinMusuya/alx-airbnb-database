# 🚀 Query Optimization Report – Airbnb Clone

This report outlines performance improvements achieved by refactoring a complex multi-table SQL query.

## 🔍 Initial Query Overview

The original query joins `booking`, `user`, `property`, and `payment` tables to retrieve full booking info.

```sql
EXPLAIN ANALYZE
SELECT ...
FROM booking
JOIN user ON ...
JOIN property ON ...
LEFT JOIN payment ON ...;
```

## ❌ Issues Detected:

Unnecessary JOINs when LEFT JOINs would suffice

Fetching all columns instead of just needed ones

Full table scans for user, property, and payment

## ✅ Optimization Strategy

Replaced unnecessary INNER JOINs with LEFT JOINs

Selected only essential columns

Ensured indexes on booking.user_id, booking.property_id, and payment.booking_id are used

## 💡 Performance Result

Using EXPLAIN ANALYZE, the refactored query shows:

- Reduced cost

- Faster execution time

- Index usage instead of sequential scans

## 📁 Files

perfomance.sql: Contains both original and optimized query with EXPLAIN ANALYZE

optimization_report.md: Describes the optimization process and findings
