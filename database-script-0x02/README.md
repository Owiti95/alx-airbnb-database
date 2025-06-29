# Database Seeding - Airbnb Project

## Overview

This script (`seed.sql`) populates the Airbnb schema with realistic sample data to simulate actual usage, including guests, hosts, bookings, and messages.

---

## Seeded Tables

| Table    | Records |
| -------- | ------- |
| Users    | 3       |
| Property | 2       |
| Booking  | 1       |
| Payment  | 1       |
| Review   | 1       |
| Message  | 1       |

---

## Relationships Maintained

- Bob (host) owns two properties.
- Alice (guest) books the "Cozy Cottage".
- A review and payment are tied to the booking.
- A message is sent from Alice to Bob.

---

## How to Run

```bash
psql -U your_user -d your_database -f seed.sql
```
