
# Airbnb Clone – Database Design

This document outlines the core database schema for an Airbnb-style booking platform, including entities, attributes, relationships, and implementation in SQL. The schema supports functionalities such as user management, property listings, bookings, payments, reviews, and messaging.

---

## 📊 Entities & Attributes

### 🧑‍💼 User
- `user_id`: UUID, Primary Key
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (`guest`, `host`, `admin`), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 🏡 Property
- `property_id`: UUID, Primary Key
- `host_id`: FK → User(`user_id`)
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### 📅 Booking
- `booking_id`: UUID, Primary Key
- `property_id`: FK → Property(`property_id`)
- `user_id`: FK → User(`user_id`)
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 💳 Payment
- `payment_id`: UUID, Primary Key
- `booking_id`: FK → Booking(`booking_id`)
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

---

### 📝 Review
- `review_id`: UUID, Primary Key
- `property_id`: FK → Property(`property_id`)
- `user_id`: FK → User(`user_id`)
- `rating`: INTEGER (1 to 5), NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### 💬 Message
- `message_id`: UUID, Primary Key
- `sender_id`: FK → User(`user_id`)
- `recipient_id`: FK → User(`user_id`)
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## 🔗 Entity Relationships

- **User → Property** (1:N): A host can own many properties.
- **User → Booking** (1:N): A guest can make many bookings.
- **Property → Booking** (1:N): A property can have many bookings.
- **Booking → Payment** (1:1): Each booking has one payment.
- **User → Review** (1:N): A user can write many reviews.
- **Property → Review** (1:N): A property can have many reviews.
- **User → Message** (1:N): Users can send and receive messages.



## 📐 Diagram

![Entity Relationship Diagram](ERD/requirements.png)
