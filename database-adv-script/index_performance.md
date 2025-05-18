# 📈 Implement Indexes for Optimization

## ✅ Objective

Improve the performance of queries by identifying and creating indexes on frequently used columns in the `users`, `bookings`, and `properties` tables.

---

## 🧠 Why Indexing?

Indexes help speed up database queries by allowing the database engine to quickly locate rows without scanning the entire table. They are particularly useful on columns used in:

- `WHERE` clauses
- `JOIN` conditions
- `ORDER BY` clauses

---

## 🔍 High-Usage Columns Identified

| Table      | Column(s)        | Reason for Indexing                          |
|------------|------------------|----------------------------------------------|
| `users`    | `email`          | Frequently used for login/authentication     |
| `bookings` | `user_id`        | Used in JOINs with `users`                   |
|            | `property_id`    | Used in JOINs with `properties`              |
|            | `start_date`, `end_date` | Used in availability filtering       |
| `properties` | `location`     | Used in filtering and searching              |

---

## 🛠️ SQL Commands (Saved in `database_index.sql`)

```sql
-- Index for users table
CREATE INDEX idx_users_email ON users (email);

-- Indexes for bookings table
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_end_dates ON bookings (start_date, end_date);

-- Index for properties table
CREATE INDEX idx_properties_location ON properties (location);

## 🧪 Performance Testing

To evaluate the impact of indexing, we ran the same query before and after applying indexes and analyzed the query execution plan.

---

### 🔍 Before Indexing

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE property_id = 'some-id'
  AND start_date >= '2024-06-01';
```

🚀 After Indexing

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE property_id = 'some-id'
  AND start_date >= '2024-06-01';
```