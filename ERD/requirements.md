🔹 Identify All Entities and Their Attributes
The 6 main entities are:

User

user_id (PK)

first_name

last_name

email (Unique)

password_hash

phone_number

role (ENUM: guest, host, admin)

created_at

- Property

property_id (PK)

host_id (FK → User)

name

description

location

pricepernight

created_at

updated_at

- Booking

booking_id (PK)

property_id (FK → Property)

user_id (FK → User)

start_date

end_date

total_price

status (ENUM: pending, confirmed, canceled)

created_at

- Payment

payment_id (PK)

booking_id (FK → Booking)

amount

payment_date

payment_method (ENUM: credit_card, paypal, stripe)

- Review

review_id (PK)

property_id (FK → Property)

user_id (FK → User)

rating (Check 1–5)

comment

created_at

- Message

message_id (PK)

sender_id (FK → User)

recipient_id (FK → User)

message_body

sent_at

2.Relationships Between Entities

Relationship Description
User ↔ Booking A user can have many bookings; each booking is for one user. (1:N)
User ↔ Property (as host) A host (user) can have many properties. (1:N)
Property ↔ Booking A property can have many bookings. (1:N)
Booking ↔ Payment Each booking has one payment. (1:1)
User ↔ Review A user can write many reviews. (1:N)
Property ↔ Review A property can have many reviews. (1:N)
User ↔ Message Users can send and receive many messages. (1:N from user to message via sender_id and recipient_id)
