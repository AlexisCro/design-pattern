# Design Patterns - Ruby on Rails

This repository contains practical implementations of various design patterns in Ruby, organized as practical exercises (TPs). Each TP focuses on one or more design patterns to help understand their usage and benefits.

## Requirements

- Ruby 3.3.6
- Rails 8.x

## Installation
After that you've installed ruby

```bash
git clone <project_url>

cd <project_directory>

bundle install # will install whole dependencies, including rails
```

## Testing Design Patterns

All design patterns can be tested using the Rails console:

```bash
rails console
# or
rails c
```

---

## TP1 - Template Method Pattern

**Location:** `app/services/tp1/document_bank/`

The Template Method pattern defines the skeleton of an algorithm in a base class, letting subclasses override specific steps without changing the algorithm's structure.

### Concept

In this TP, we have a `Customer` base class that defines the workflow for creating bank documents (RIB, Certificate). Subclasses (`CustomerProfessional`, `CustomerParticular`) implement specific behaviors like SIREN generation.

### How to Test

```ruby
# Create a professional customer (has SIREN)
pro = Tp1::DocumentBank::CustomerProfessional.new(
  attributes: {
    professional: true,
    first_name: "John",
    last_name: "Doe"
  }
)

pro.get_siren
# => "123456789" (random 9-digit number)

pro.get_documents
# => [{ type: "RIB", IBAN: "FR76...", ... }, { type: "Certificate", ... }]

# Create a particular customer (no SIREN)
particular = Tp1::DocumentBank::CustomerParticular.new(
  attributes: {
    professional: false,
    first_name: "Jane",
    last_name: "Smith"
  }
)

particular.get_siren
# => "This is a particular customer, no SIREN available"

particular.get_documents
# => [{ type: "RIB", ... }, { type: "Certificate", terms_of_use: "" }]
```

---

## TP2 - Prototype Pattern

**Location:** `app/services/tp2/`

The Prototype pattern creates new objects by cloning an existing object (prototype) instead of creating from scratch.

### Concept

Contracts can be duplicated using the `duplicate` method. Each contract type (Car, Housing, Life) extends the base `Contract` class with specific validations.

### How to Test

```ruby
# Create a car insurance contract
car_contract = Tp2::ContractCar.new(
  attributes: {
    start_date: Date.today,
    end_date: Date.today + 1.year,
    amount: 1200,
    customer_name: "John Doe",
    registration: "AB-123-CD"
  }
)

car_contract.attributes[:name_version]
# => "contractcar_v1706534400_1"

# Duplicate the contract (Prototype pattern)
duplicated = car_contract.duplicate

duplicated.attributes[:version]
# => 1 (new version)

# Update the original
car_contract.update(amount: 1500)
car_contract.get_version
# => 2

# Create a housing contract
housing_contract = Tp2::ContractHousing.new(
  attributes: {
    start_date: Date.today,
    end_date: Date.today + 1.year,
    amount: 800,
    customer_name: "Jane Smith"
  }
)

# Create a life insurance contract
life_contract = Tp2::ContractLife.new(
  attributes: {
    start_date: Date.today,
    end_date: Date.today + 30.years,
    amount: 50000,
    customer_name: "Bob Wilson"
  }
)
```

---

## TP3 - Decorator Pattern

**Location:** `app/services/tp3/`

The Decorator pattern attaches additional responsibilities to an object dynamically, providing a flexible alternative to subclassing.

### Concept

Notifications can be decorated with different types (Order, Delivery, Support, Discord) to add context to the message. Each decorator wraps a notification and adds its own prefix.

### How to Test

```ruby
# Create an order notification
order = Tp3::NotificationOrderDecorator.new("Your order #12345 has been confirmed")
order.send_email
# => "Email - Order - Your order #12345 has been confirmed"

order.send_sms
# => "SMS - Order - Your order #12345 has been confirmed"

order.send_push
# => "Push - Order - Your order #12345 has been confirmed"

# Create a delivery notification
delivery = Tp3::NotificationDeliveryDecorator.new("Your package is on the way")
delivery.send_email
# => "Email - Delivery - Your package is on the way"

# Create a support notification
support = Tp3::NotificationSupportDecorator.new("An agent will contact you shortly")
support.send_email
# => "Email - Support - An agent will contact you shortly"

# Create a Discord notification
discord = Tp3::NotificationDiscordDecorator.new("New message in #general")
discord.send_push
# => "Push - Discord - New message in #general"
```

---

## TP4 - Adapter Pattern

**Location:** `app/services/tp4/`

The Adapter pattern allows incompatible interfaces to work together by wrapping an object with a compatible interface.

### Concept

`PaymentPro` is an external payment service with a different interface (uses codes for currency/state). The `Adapter` wraps it to provide a standardized `PaymentService` interface.

### How to Test

```ruby
# Create a PaymentPro instance (external service with different interface)
payment_pro = Tp4::PaymentPro.new(100, "1")  # 100 EUR (1 = EUR code)

# Use the adapter to standardize the interface
adapter = Tp4::Adapter.new(payment_pro)

# Process payment using the standard interface
adapter.process_payment(100, "EUR")

# Get transaction status (translated from codes)
adapter.get_transaction_status
# => "processed"

# Refund using standard interface
adapter.refund_payment

adapter.get_transaction_status
# => "refunded"
```

---

## TP5 - Proxy & Decorator Patterns

**Location:** `app/services/tp5/`

This TP combines two patterns:
- **Proxy Pattern**: Controls access to an object, adding behavior before/after the original operation
- **Decorator Pattern**: Adds responsibilities to objects dynamically

### Concept

`Message` includes a `Proxy` module that adds logging. Decorators (`ChiffrementDecorator`, `CompressionDecorator`, `SignDecorator`) can transform the message content.

### How to Test

```ruby
# Create a simple message
message = Tp5::Message.new("Hello, World!")

# Send the message directly
message.send
# Output: Hello, World!

# Use proxy to log the send action
message.logged_send
# Output:
# Logging message send action...
# Hello, World!

# Apply encryption decorator
encrypted = Tp5::Decorator::ChiffrementDecorator.new(message)
encrypted.send
# Output: Encrypting message...

encrypted.content
# => "Encrypting message : Hello, World!"

# Apply compression decorator
compressed = Tp5::Decorator::CompressionDecorator.new(message)
compressed.send
# Output: Compressing message...

compressed.content
# => "Compressed message : Hello, World!"

# Apply signature decorator
signed = Tp5::Decorator::SignDecorator.new(message)
signed.send
# Output: Signing message...

signed.content
# => "Sign message : Hello, World!"

# Chain decorators (apply multiple transformations)
message = Tp5::Message.new("Secret data")
encrypted = Tp5::Decorator::ChiffrementDecorator.new(message)
encrypted.send
# Use logged_send from proxy
encrypted.logged_send
```

---

## TP9 - Observer Pattern

**Location:** `app/services/tp9/`

The Observer pattern defines a subscription mechanism to notify multiple objects about events that happen to the object they're observing.

### Concept

`Stock` is the subject that notifies its subscribers (`Alerts`, `Graphical`) when the price changes. Subscribers can be added or removed dynamically.

### How to Test

```ruby
# Create a stock (subject)
stock = Tp9::Stock.new

# Create subscribers
alerts = Tp9::Alerts.new
graphical = Tp9::Graphical.new

# Subscribe to stock updates
stock.subscribe(alerts)
stock.subscribe(graphical)

stock.subscribers.count
# => 2

# Update price - all subscribers are notified
stock.update_price(150.50)
# Output:
# Alert Service: Stock price updated.
# Graphical Service: Stock price updated.

# Update name - only first subscriber is notified
stock.update_name("AAPL")
# Output:
# Alert Service: Stock price updated.

# Unsubscribe a service
stock.unsubscribe(graphical)

stock.subscribers.count
# => 1

# Now only alerts will be notified
stock.update_price(155.00)
# Output:
# Alert Service: Stock price updated.
```

---

## Additional Design Patterns

### Builder Pattern

**Location:** `app/services/builder.rb`

Used to build SQL queries step by step.

```ruby
# The Builder module is included in Customer and Order classes
customer = Customer::CustomerCash.new(attributes: { price: 1000 })

# Build a query step by step
customer.select(:name, :email)
        .where(status: "active", role: "admin")
        .or(verified: true)
        .limit(10)
        .to_sql
# => "SELECT name, email FROM Customer::CustomerCash WHERE status = 'active' AND role = 'admin' OR (verified = true) LIMIT 10 ;"
```

### Factory Pattern

**Location:** `app/services/customer/` and `app/services/order/`

Creates objects without specifying the exact class.

```ruby
# Create a cash customer (automatically creates cash order)
cash_customer = Customer::CustomerCash.new(
  attributes: { price: 1000, name: "John" }
)

cash_customer.attributes[:payment_method]
# => "cash"

cash_customer.attributes[:order][:paid]
# => true

# Create a credit customer
credit_customer = Customer::CustomerCredit.new(
  attributes: { price: 2000, name: "Jane" }
)

credit_customer.attributes[:payment_method]
# => "credit"
```

### Singleton Pattern

**Location:** `app/services/liasse_vierge.rb`

Ensures a class has only one instance.

```ruby
# Get the singleton instance
liasse = LiasseVierge.instance

# Add documents
liasse.add_document({ type: "RIB", data: "..." })
liasse.add_document({ type: "Certificate", data: "..." })

liasse.documents.count
# => 2

# Same instance everywhere
another_liasse = LiasseVierge.instance
another_liasse.documents.count
# => 2 (same documents)

# Clear documents
liasse.clear_documents
```

---

## Project Structure

```
app/services/
├── builder.rb              # Builder Pattern
├── customer/               # Factory Pattern
│   ├── customer.rb
│   ├── customer_cash.rb
│   └── customer_credit.rb
├── documents/              # Abstract Factory
│   ├── abstract_document.rb
│   └── demande_immatriculation.rb
├── liasse_vierge.rb        # Singleton Pattern
├── order/                  # Factory Pattern
│   ├── order.rb
│   ├── order_cash.rb
│   └── order_credit.rb
├── tp1/                    # Template Method Pattern
│   └── document_bank/
├── tp2/                    # Prototype Pattern
├── tp3/                    # Decorator Pattern
├── tp4/                    # Adapter Pattern
├── tp5/                    # Proxy + Decorator Patterns
└── tp9/                    # Observer Pattern
```

---

## Design Patterns Summary

| TP | Pattern(s) | Purpose |
|----|------------|---------|
| TP1 | Template Method | Define algorithm skeleton, let subclasses override specific steps |
| TP2 | Prototype | Clone objects instead of creating from scratch |
| TP3 | Decorator | Add responsibilities dynamically without subclassing |
| TP4 | Adapter | Convert interface to work with incompatible systems |
| TP5 | Proxy + Decorator | Control access and add transformations to objects |
| TP9 | Observer | Notify subscribers when state changes |
| - | Builder | Construct complex objects step by step |
| - | Factory | Create objects without specifying exact class |
| - | Singleton | Ensure single instance of a class |

---

## Running Tests

```bash
# Run all tests
rails test

# Run specific test file
rails test test/services/tp1_test.rb
```

## License

This project is for educational purposes.
