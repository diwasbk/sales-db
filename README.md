# Sales Database Management

This repository contains SQL scripts for creating and managing a simple sales database.

## Database Schema

The database consists of two main tables:

1. **customers**: Stores information about customers.
   - Columns:
     - `customer_id`: Unique identifier for each customer (INT, PRIMARY KEY)
     - `customer_name`: Name of the customer (VARCHAR(50))
     - `address`: Customer's address (VARCHAR(50))

2. **payment**: Stores payment information.
   - Columns:
     - `customer_id`: References the `customer_id` in the `customers` table (INT, PRIMARY KEY)
     - `amount`: Payment amount (DOUBLE)
     - `method`: Payment method (VARCHAR(50))

## SQL Script Overview

The SQL script (`sales.sql`) performs the following actions:

1. Creates a database named 'sales' and switches to it.
2. Creates the 'customers' table and inserts sample data.
3. Creates the 'payment' table and inserts sample data.
4. Performs various SQL queries to retrieve, update, delete, and analyze data.
5. Demonstrates different types of joins and SQL clauses.

## Author

- [Diwas Bk](https://github.com/diwasbk)
