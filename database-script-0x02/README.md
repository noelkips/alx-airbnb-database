
# Seed Data – Airbnb Clone

This document provides sample SQL data inserts used to populate the Airbnb database schema. The purpose of this data is to simulate real-world scenarios and allow for development, testing, and demonstration of database functionality.

---

## 🧑‍💼 Users

We’ve created three users with varying roles:
- **Alice Johnson** – Guest
- **Bob Smith** – Host
- **Carol White** – Admin

These users will interact with other parts of the application like properties, bookings, payments, etc.

---

## 🏡 Properties

Bob Smith (the host) owns two properties:
- Ocean View Apartment in Miami, FL
- Mountain Cabin in Aspen, CO

Each property has its own price and description for realistic listing.

---

## 📅 Bookings

Alice (guest) has made bookings for both properties:
- Confirmed booking at the Ocean View Apartment.
- Pending booking at the Mountain Cabin.

This demonstrates different booking statuses.

---

## 💳 Payments

One payment has been successfully made for a confirmed booking using a credit card.

---

## 📝 Reviews

Alice has left a positive review for the Ocean View Apartment, rated 5 stars.

---

## 💬 Messages

The messaging system shows interaction between guest (Alice) and host (Bob) regarding property availability.

---

## 📂 How to Use

1. Ensure your database schema is created using the `schema.sql` file.
2. Run the `seed.sql` file using your preferred SQL tool:
   ```bash
   psql -U your_user -d your_database -f seed.sql
   ```

This will insert all sample records into the appropriate tables.

