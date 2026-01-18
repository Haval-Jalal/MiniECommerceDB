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


---

## SQL Scripts Execution Order
Run the scripts in the following order:

1. `01_CreateDatabase.sql`
2. `02_CreateTables.sql`
3. `03_SeedData.sql`
4. `04_CRUD_Insert.sql`
5. `05_CRUD_Select.sql`
6. `06_CRUD_Update.sql`
7. `07_CRUD_Delete.sql`
8. `08_Joins_Queries.sql`

Scripts `09` and `10` are planned for future implementation.

---

## Current Status

### Completed
- [x] Scenario selection
- [x] ER diagram created and finalized
- [x] Database schema designed
- [x] Tables created with PK, FK, and constraints
- [x] GitHub repository structure created
- [x] Create database (`01_CreateDatabase.sql`)
- [x] Create tables (`02_CreateTables.sql`)
- [x] Seed data (`03_SeedData.sql`) + ('00_Verifcation_Selects.sql')

### In Progress

	CRUD operations
- [ ] Insert (`04_CRUD_Insert.sql`)
- [ ] Select (`05_CRUD_Select.sql`)
- [ ] Update (`06_CRUD_Update.sql`)
- [ ] Delete (`07_CRUD_Delete.sql`)
- [ ] Joins and complex queries (`08_Joins_Queries.sql`)




## Reflections (Initial)
- The database is designed to be realistic and scalable rather than a toy example.
- Many-to-many relationships are handled using a junction table (`OrderItem`).
- Constraints are used to protect data integrity at the database level.
- Further improvements could include user authentication, order history, and payment status tracking.

---

## Future Improvements
- Implement views for reporting
- Add stored procedures for common operations
- Implement security features such as password hashing and user management
- Connect the database to a .NET Console Application

---

## Technologies Used
- SQL Server
- SQL Server Management Studio (SSMS)
- GitHub
- ER modeling (draw.io)

---

## Author
Student project for the Databases course.
Name: Haval Jalal