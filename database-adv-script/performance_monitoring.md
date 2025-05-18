
# 🧠 Performance Monitoring & Optimization Report

## 🎯 Objective

Continuously monitor and refine database performance by analyzing execution plans and applying schema improvements where necessary.

---

## 🛠️ Tools & Techniques Used

- `EXPLAIN ANALYZE` – Analyzes SQL queries for potential performance bottlenecks.
- PostgreSQL profiling tools to monitor execution time, row fetch strategies, and index usage.

---

## 🔍 Monitoring Queries

### Query 1: Fetch all bookings for a specific property in June

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE property_id = 'some-id'
  AND start_date BETWEEN '2024-06-01' AND '2024-06-30';
```

### Observation:
- Execution used a **sequential scan**.
- High I/O and response time (~280ms).

---

## 🚧 Bottlenecks Identified

- Lack of index on `property_id` and `start_date`.
- Query scanned entire bookings table.

---

## 🛠️ Optimization Steps

### Step 1: Add Composite Index

```sql
CREATE INDEX idx_property_date ON bookings(property_id, start_date);
```

### Step 2: Re-run Analysis

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE property_id = 'some-id'
  AND start_date BETWEEN '2024-06-01' AND '2024-06-30';
```

---

## ✅ Results After Optimization

- **Index Scan** used instead of sequential scan.
- Query performance improved from ~280ms to ~40ms.
- Lower CPU and disk access observed.

---

## 📌 Conclusion

- Regular monitoring using `EXPLAIN ANALYZE` helps uncover hidden inefficiencies.
- Indexing and schema improvements can drastically reduce execution time.
- Best practice: Profile and tune queries regularly, especially high-frequency ones.

---

## 📁 File

- `performance_monitoring.md` – This report on monitoring and improvements
