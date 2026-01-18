# Mini E-Commerce Database Project

## Overview
This project is a Mini E-Commerce relational database built as part of the **Databases** course.  
The goal of the assignment is to design, model, and implement a realistic database using:

- Entity Relationship (ER) modeling
- Normalized relational tables (3NF)
- SQL scripts for database creation, data seeding, and CRUD operations
- Proper use of primary keys, foreign keys, and constraints
- Structured version control using GitHub

The database is designed to support a simple but realistic e-commerce system with customers, products, orders, and payments.

---

## Scenario
**Mini E-Commerce Platform**

The system supports:
- Customers placing orders
- Products grouped into categories
- Orders containing multiple products (many-to-many)
- Inventory tracking
- Payments linked to orders

---

## Entity Relationship Diagram (ERD)
The ER diagram defines all entities, attributes, primary keys, foreign keys, and relationships.

**Entities:**
- Category
- Customer
- Product
- Inventory
- Order
- OrderItem (junction table)
- Payment

**Relationships:**
- Category 1 → N Product
- Customer 1 → N Order
- Product 1 → 1 Inventory
- Order 1 → N OrderItem
- Product 1 → N OrderItem  
  (resolves many-to-many between Order and Product)
- Order 1 → 1 Payment

ERD files can be found in:/ERDiagram/ERDiagramECommerce.png


## Database Design
The database is designed according to **Third Normal Form (3NF)**:
- No repeating groups
- No duplicated data
- All non-key attributes depend on the key

**Data integrity is enforced using:**
- Primary Keys (PK)
- Foreign Keys (FK)
- NOT NULL constraints
- UNIQUE constraints
- CHECK constraints
- DEFAULT values