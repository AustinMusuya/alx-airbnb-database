# 🏡 Airbnb Clone — System Requirements

## 1. Introduction

This document outlines the functional, non-functional, and database requirements for an Airbnb-like platform. The platform allows users to list, discover, and book properties online. Key actors include Guests, Hosts, and Admins.

---

## 2. Functional Requirements

### 2.1 User Roles

- **Guest**

  - Browse and search property listings
  - Make bookings
  - Leave reviews
  - Send/receive messages

- **Host**

  - List and manage properties
  - View/manage booking requests
  - Respond to messages

- **Admin**
  - Manage user accounts
  - Moderate listings and reviews

### 2.2 Features

- User registration and authentication
- Property listing management
- Booking system with availability handling
- Integrated payments
- Messaging system between users
- Property reviews and ratings

---

## 3. Entity Definitions and Attributes

### 🧑 User

| Field         | Type      | Constraints                          |
| ------------- | --------- | ------------------------------------ |
| user_id       | UUID      | Primary Key, Indexed                 |
| first_name    | VARCHAR   | NOT NULL                             |
| last_name     | VARCHAR   | NOT NULL                             |
| email         | VARCHAR   | UNIQUE, NOT NULL                     |
| password_hash | VARCHAR   | NOT NULL                             |
| phone_number  | VARCHAR   | NULLABLE                             |
| role          | ENUM      | ('guest', 'host', 'admin'), NOT NULL |
| created_at    | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP            |

---

### 🏠 Property

| Field         | Type      | Constraints                 |
| ------------- | --------- | --------------------------- |
| property_id   | UUID      | Primary Key, Indexed        |
| host_id       | UUID      | Foreign Key → User(user_id) |
| name          | VARCHAR   | NOT NULL                    |
| description   | TEXT      | NOT NULL                    |
| location      | VARCHAR   | NOT NULL                    |
| pricepernight | DECIMAL   | NOT NULL                    |
| created_at    | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP   |
| updated_at    | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP |

---

### 📅 Booking

| Field       | Type      | Constraints                          |
| ----------- | --------- | ------------------------------------ |
| booking_id  | UUID      | Primary Key, Indexed                 |
| property_id | UUID      | Foreign Key → Property(property_id)  |
| user_id     | UUID      | Foreign Key → User(user_id)          |
| start_date  | DATE      | NOT NULL                             |
| end_date    | DATE      | NOT NULL                             |
| total_price | DECIMAL   | NOT NULL                             |
| status      | ENUM      | ('pending', 'confirmed', 'canceled') |
| created_at  | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP            |

---

### 💳 Payment

| Field          | Type      | Constraints                         |
| -------------- | --------- | ----------------------------------- |
| payment_id     | UUID      | Primary Key, Indexed                |
| booking_id     | UUID      | Foreign Key → Booking(booking_id)   |
| amount         | DECIMAL   | NOT NULL                            |
| payment_date   | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP           |
| payment_method | ENUM      | ('credit_card', 'paypal', 'stripe') |

---

### ⭐ Review

| Field       | Type      | Constraints                         |
| ----------- | --------- | ----------------------------------- |
| review_id   | UUID      | Primary Key, Indexed                |
| property_id | UUID      | Foreign Key → Property(property_id) |
| user_id     | UUID      | Foreign Key → User(user_id)         |
| rating      | INTEGER   | CHECK (1 <= rating <= 5), NOT NULL  |
| comment     | TEXT      | NOT NULL                            |
| created_at  | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP           |

---

### 💬 Message

| Field        | Type      | Constraints                 |
| ------------ | --------- | --------------------------- |
| message_id   | UUID      | Primary Key, Indexed        |
| sender_id    | UUID      | Foreign Key → User(user_id) |
| recipient_id | UUID      | Foreign Key → User(user_id) |
| message_body | TEXT      | NOT NULL                    |
| sent_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP   |

---

## 4. Entity Relationships

| From Entity | To Entity | Relationship Type       |
| ----------- | --------- | ----------------------- |
| User        | Property  | One-to-Many (host_id)   |
| User        | Booking   | One-to-Many (user_id)   |
| Property    | Booking   | One-to-Many             |
| Booking     | Payment   | One-to-One              |
| Property    | Review    | One-to-Many             |
| User        | Review    | One-to-Many             |
| User        | Message   | Many-to-Many (self-ref) |

---

## 5. Constraints

### User Table

- `email` must be unique
- `first_name`, `last_name`, `email`, `password_hash`, `role` are required

### Booking Table

- `status` ENUM restricted to `pending`, `confirmed`, `canceled`

### Review Table

- `rating` must be between 1 and 5 inclusive

### Message Table

- Both `sender_id` and `recipient_id` must exist in the User table

---

## 6. Indexing

- All `Primary Keys` are indexed by default
- Additional Indexes:
  - `User.email`
  - `Property.property_id`
  - `Booking.property_id`
  - `Booking.booking_id`
  - `Payment.booking_id`

---

## 7. Non-Functional Requirements

- **Security**:
  - Passwords must be hashed
  - Use JWT for authentication
  - HTTPS-only communication
- **Performance**:
  - System should handle 100+ concurrent users
- **Scalability**:
  - Cloud-deployable, horizontally scalable DB (PostgreSQL recommended)
- **Portability**:
  - Must run on Dockerized Linux environments

---

## 8. ER Diagram

> \_[https://drive.google.com/file/d/1gdAlPugHUlxBrWFFWa7wwdjgRqt3ROjr/view?usp=sharing]

---

## 9. Future Extensions (Nice to Have)

- Calendar-based availability management
- Saved/favorite listings
- Notification system
- Admin dashboard with analytics
