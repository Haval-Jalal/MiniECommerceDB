# Mini E-Commerce Database Project

## Overview
This project is a Mini E-Commerce relational database built as part of the **Databases** course.  
The goal of the assignment is to design, model, and implement a realistic database using:

- Entity Relationship (ER) modeling (ERD)
- Normalized relational tables (3NF)
- SQL scripts for database creation, data seeding, and CRUD operations
- Proper use of primary keys, foreign keys, and constraints
- Advanced SQL queries, joins, aggregations, views, and stored procedures
- Structured version control using GitHub

The database is designed to support a realistic e-commerce system including customers, products, categories, inventory, orders, order items, and payments.

---

## Scenario
**Mini E-Commerce Platform**

The system supports:
- Customers placing orders
- Products grouped into categories
- Orders containing multiple products (many-to-many)
- Inventory tracking
- Payments linked to orders
- Business-related queries for reporting and analytics

---

## Entity Relationship Diagram (ERD)
The ER diagram defines all entities, attributes, primary keys, foreign keys, and relationships.

### Entities
- Category
- Customer
- Product
- Inventory
- Order
- OrderItem (junction table)
- Payment

### Relationships
- Category 1 → N Product  
- Customer 1 → N Order  
- Product 1 → 1 Inventory  
- Order 1 → N OrderItem  
- Product 1 → N OrderItem  
  (resolves many-to-many between Order and Product)  
- Order 1 → 1 Payment  

**ERD file:**  
`/ERDiagram/ERDiagramECommerce.png`

---

## Database Design
The database is designed according to **Third Normal Form (3NF)**:

- No repeating groups
- No duplicated data
- All non-key attributes depend on the primary key

### Data integrity is enforced using:
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
9. `09_Views.sql`
10. `10_StoredProcedures.sql`

Optional verification file:  
`00_Verification_Selects.sql`

---

## Implemented Functionality

### Database Structure
- Fully normalized schema (3NF)
- 7 relational tables
- One many-to-many relationship via `OrderItem`
- Complete PK & FK enforcement
- Data integrity using constraints

### CRUD Operations
- Insert operations for all major entities
- Select queries including filters and joins
- Update operations for business-relevant fields
- Delete operations with correct handling of foreign key constraints

### Advanced Queries
- Multi-table JOIN queries
- Aggregation queries using GROUP BY and HAVING
- Subqueries
- Business logic queries (e.g. unpaid orders, order summaries)

### Views
- `vw_OrderSummary` – summarized order and customer data  
- `vw_ProductOverview` – product and category overview  

### Stored Procedures
- `sp_CreateOrder` – transactional order creation with rollback support  
- `sp_UpdateOrderStatus` – controlled order status updates  

---

## Current Status

### Completed
- [x] Scenario selection
- [x] ER diagram created and finalized
- [x] Database schema designed
- [x] Tables created with PK, FK, and constraints
- [x] Seed data implemented and verified
- [x] Full CRUD implementation
- [x] Advanced JOIN and aggregation queries
- [x] Views implemented
- [x] Stored procedures implemented with transactions
- [x] GitHub repository structure finalized
- [x] Documentation completed

---

## Reflections
- The database was designed to be realistic and scalable rather than a simple toy example.
- Many-to-many relationships were resolved using a junction table (`OrderItem`).
- Data integrity is protected using strong constraints and foreign key relationships.
- Transactions and rollback logic ensure consistency during multi-step operations.
- Views and stored procedures were implemented to improve maintainability, security, and reusability.
- If extended further, the system could include authentication, role-based security, and order tracking.

---

## Future Improvements
- User authentication and authorization
- Password hashing and security enhancements
- Role-based access control
- Full .NET Console or Web API integration
- Reporting dashboards and analytics queries

---

## Technologies Used
- SQL Server
- SQL Server Management Studio (SSMS)
- GitHub
- ER modeling (draw.io)
- .NET Console Application (project structure prepared)

---

## Author
Student project for the **Databases** course.  
**Name:** Haval Jalal