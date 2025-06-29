# Airbnb Database Normalization

## Objective

To ensure our database design follows best practices and is normalized to Third Normal Form (3NF) to eliminate redundancy and improve data integrity.

---

## Step 1: First Normal Form (1NF)

- All attributes in every table are atomic.
- There are no repeating groups or multivalued attributes.
- All tables satisfy 1NF.

---

## Step 2: Second Normal Form (2NF)

- No tables have composite primary keys.
- All non-key attributes fully depend on their primary key.
- All tables satisfy 2NF.

---

## Step 3: Third Normal Form (3NF)

- There are no transitive dependencies.
- Each non-key attribute depends only on the primary key.

### Table-by-table Analysis:

| Table    | Status | Notes                                                  |
| -------- | ------ | ------------------------------------------------------ |
| User     | ok     | All attributes depend on `user_id`                     |
| Property | ok     | `host_id` is a valid foreign key, no transitive fields |
| Booking  | ok     | All attributes describe the booking itself             |
| Payment  | ok     | All fields depend on `booking_id`                      |
| Review   | ok     | `property_id` and `user_id` are direct FKs             |
| Message  | ok     | Both sender and recipient are Users                    |

---

## Refinement (Location Normalization)

To improve scalability and reduce location redundancy:

- Extract `location` from the Property table.
- Create a new `Location` table with fields like `city` and `country`.
- Reference it in the Property table via `location_id`.

---

## Conclusion

The schema is in 3NF. Optional refinements (like normalizing location) can further improve maintainability in large datasets.
