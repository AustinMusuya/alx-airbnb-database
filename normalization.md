# 🧠 Database Normalization — Airbnb Clone

## Objective

Ensure the database schema is in **Third Normal Form (3NF)** to eliminate data redundancy and improve data integrity.

---

## 🔍 Step-by-Step Normalization

### ✅ First Normal Form (1NF)

All tables:

- Have atomic (indivisible) columns
- No repeating groups or arrays
- Have primary keys for row uniqueness

**✅ Achieved**

---

### ✅ Second Normal Form (2NF)

- All tables are already in 1NF
- There are no partial dependencies:
  - Each non-key attribute depends on the whole primary key (not a part of it)
  - All primary keys are single-column UUIDs, so partial dependency isn't a concern

**✅ Achieved**

---

### ✅ Third Normal Form (3NF)

- All tables are in 2NF
- No transitive dependencies exist:
  - Example: `User.email` does not determine `User.role` — all non-key attributes are directly dependent on the primary key
  - Payment methods, booking statuses, and user roles are handled with ENUMs, not separate tables, but there's no redundant or derived data
  - `Booking.total_price` might seem derived, but it is contextually valid as it locks in the price at the time of booking (not a violation)

**✅ Achieved**

---

## 💡 Considerations

While the schema is already in 3NF:

- If business logic evolves, it might be better to normalize ENUMs (`role`, `status`, `payment_method`) into lookup tables for flexibility
- `Location` in `Property` is currently a VARCHAR — this is fine for 3NF, but if richer geographic data is needed, consider splitting into `City`, `Country`, or a `Location` table

---

## ✅ Conclusion

The schema defined in the `alx-airbnb-database` project adheres to **3NF**. No redundant or transitive dependencies were found, and the design supports clean, maintainable data storage.
