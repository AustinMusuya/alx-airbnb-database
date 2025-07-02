# Index Performance Optimization – Airbnb Clone

This section focuses on improving SQL query performance by creating indexes on high-usage columns.

## 🧠 Rationale for Indexing

| Table    | Column      | Reason for Indexing                        |
| -------- | ----------- | ------------------------------------------ |
| booking  | user_id     | Frequently used in JOINs and WHERE clauses |
| booking  | property_id | Used in property JOINs                     |
| property | host_id     | Filter properties by host                  |
| user     | email       | Common for lookups, especially in auth     |
| user     | role        | Useful for filtering by guest/host/admin   |

## 🛠️ SQL Commands

```sql
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_property_host_id ON property(host_id);
CREATE INDEX idx_user_email ON user(email);
CREATE INDEX idx_user_role ON user(role);
```

### Before adding indexes:

```sql
EXPLAIN SELECT * FROM booking WHERE user_id = 'some-id';
```

### After adding indexes:

```sql
EXPLAIN SELECT * FROM booking WHERE user_id = 'some-id';
```
