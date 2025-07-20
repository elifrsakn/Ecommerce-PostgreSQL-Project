# E-commerce PostgreSQL Project

This project showcases a structured **relational e-commerce database** built with PostgreSQL. It includes a comprehensive database schema, synthetic sample data, and a set of SQL queries designed for analytical insights.

> ⚠️ **Disclaimer:** All data used in this project is **synthetically generated using Python scripts**. It does not reflect any real customer or product information.

---

## 🧱 Database Schema

The core schema is defined in `schema.sql` and consists of the following tables:

* `customers` – stores customer information
* `products` – holds product details such as name, category, price, and stock
* `orders` – tracks customer purchases and order totals
* `order_items` – links products to orders with quantity and pricing details
* `cart` – represents temporary shopping cart contents
* `reviews` – allows customers to rate and review products
* `discounts` – contains promotional codes and their conditions
* `used_discounts` – tracks which discounts were applied by which customers

All tables are linked using foreign keys and constraints to maintain referential integrity.

---

## 🥪 Sample Data

The file `insert_data.sql` contains randomly generated data for testing and demonstration purposes. The data was generated using Python libraries such as:

* [`Faker`](https://github.com/joke2k/faker) – for generating fake names, emails, dates, and text
* `random` – for product IDs, prices, quantities, etc.
* `datetime` – for generating timestamp values

---

## 📊 Analytical SQL Queries

The `queries/` folder contains reusable SQL scripts designed to answer business-related questions, such as:

| Query File                    | Description                                                          |
| ----------------------------- | -------------------------------------------------------------------- |
| `average_product_ratings.sql` | Calculates the average rating and number of reviews for each product |
| `best_selling_products.sql`   | Lists top-selling products based on quantity and revenue             |
| `monthly_sales.sql`           | Summarizes total orders and revenue per month                        |
| `regional_sales.sql`          | Aggregates sales data by customer country                            |
| `top_customers.sql`           | Identifies the highest-spending customers                            |

Each query is modular and can be executed independently.

---

## 🚀 Getting Started

### 1. Connect to PostgreSQL

```bash
psql -U postgres -d ecom
```

### 2. Create Schema and Load Data

```sql
\i schema.sql
\i insert_data.sql
```

### 3. Run Example Queries

```sql
\i queries/top_customers.sql
\i queries/monthly_sales.sql
```

---

## 🧰 Requirements

* PostgreSQL 14 or later
* `psql` command-line interface
* (Optional) Python 3.x for data generation

---

## 📁 Project Structure

```
.
├── schema.sql                # Database schema definition
├── insert_data.sql          # Python-generated fake data
├── queries/
│   ├── average_product_ratings.sql
│   ├── best_selling_products.sql
│   ├── monthly_sales.sql
│   ├── regional_sales.sql
│   └── top_customers.sql
└── README.md
```

---

## 📖 License & Contribution

This project is open-source and freely available for educational and personal use.
Feel free to fork it, suggest improvements, or contribute new queries.
