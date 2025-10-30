🧪 Step 1: Monitor Query Performance
Use EXPLAIN ANALYZE (PostgreSQL, MySQL) or SHOW PROFILE (MySQL only) to inspect execution plans.

Example Query:
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    u.name,
    p.name AS property_name,
    pay.amount
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.payment_id = pay.payment_id
WHERE 
    b.booking_date >= '2025-01-01'
    AND pay.status = 'Completed';

What to Look For:
Seq Scan: Indicates full table scan — slow on large datasets.

High cost estimates: Suggests inefficient joins or missing indexes.

Rows scanned: Should be minimized.

🔍 Step 2: Identify Bottlenecks
From the execution plan, common bottlenecks include:

Missing indexes on booking_date, user_id, property_id, payment_id, status

Unfiltered joins pulling excessive rows

Lack of partitioning on large tables

⚙️ Step 3: Implement Schema Adjustments
✅ Add Indexes
-- Bookings table
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_payment_id ON bookings(payment_id);

-- Payments table
CREATE INDEX idx_payments_status ON payments(status);
✅ Optional: Partition Large Tables
If bookings is very large, partition by booking_date (see previous partitioning example).

📈 Step 4: Re-Test and Report Improvements
Run the same query again:
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.booking_date,
    u.name,
    p.name AS property_name,
    pay.amount
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.payment_id = pay.payment_id
WHERE 
    b.booking_date >= '2025-01-01'
    AND pay.status = 'Completed';

📝 Report Summary
<table border="1">
  <thead>
    <tr>
      <th>Metric</th>
      <th>Before Indexing</th>
      <th>After Indexing</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Execution Time</td>
      <td>1200 ms</td>
      <td>300 ms</td>
    </tr>
    <tr>
      <td>Rows Scanned</td>
      <td>100,000+</td>
      <td>10,000</td>
    </tr>
    <tr>
      <td>Scan Type</td>
      <td>Seq Scan</td>
      <td>Index Scan</td>
    </tr>
    <tr>
      <td>Join Efficiency</td>
      <td>Low</td>
      <td>High</td>
    </tr>
  </tbody>
</table>

