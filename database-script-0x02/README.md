# Airbnb Clone — Sample Data

## Overview

This script (`seed.sql`) populates the Airbnb clone database with realistic sample data to support testing and development.

---

## Entities Seeded

- **Users**: 3 users (host, guest, admin)
- **Properties**: 2 listed properties
- **Bookings**: 2 bookings (confirmed and pending)
- **Payments**: 1 payment for a confirmed booking
- **Reviews**: 1 review left by a guest
- **Messages**: 1 guest-to-host message

---

## Usage

Ensure the database schema is already created (run `schema.sql` first).

Then seed the data with:

```bash
psql -U your_username -d your_database -f seed.sql
```
