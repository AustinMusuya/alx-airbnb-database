# Airbnb Clone — Database Schema

## Overview

This directory contains the SQL script used to create the core database schema for the Airbnb clone project.

---

## Files

- `schema.sql`: Contains the full schema definition using `CREATE TABLE` statements and indexes.
- `README.md`: Describes the purpose and structure of the database.

---

## Schema Details

### Tables Created

1. **users**
2. **properties**
3. **bookings**
4. **payments**
5. **reviews**
6. **messages**

---

## Key Features

- All tables use `UUID` as primary keys
- Foreign key constraints enforce referential integrity
- ENUM-like constraints for fields such as `role`, `status`, and `payment_method`
- Indexed key columns for performance optimization

---

## Usage

To initialize the database, run:

```bash
psql -U your_username -d your_database -f schema.sql
```
