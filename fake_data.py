from faker import Faker
import random

fake = Faker()
Faker.seed(42)

NUM_CUSTOMERS = 100
NUM_PRODUCTS = 50
NUM_ORDERS = 200

with open("insert_data.sql", "w", encoding="utf-8") as f:

    # --- Customers ---
    f.write("-- Customers\n")
    for _ in range(1, NUM_CUSTOMERS + 1):
        name = fake.name().replace("'", " ")
        email = fake.unique.email()
        city = fake.city().replace("'", " ")
        country = fake.country().replace("'", " ")
        f.write(
            f"INSERT INTO customers (name, email, city, country) VALUES ('{name}', '{email}', '{city}', '{country}');\n"
        )

    # --- Products ---
    f.write("\n-- Products\n")
    for _ in range(1, NUM_PRODUCTS + 1):
        name = fake.word().capitalize() + " " + fake.word().capitalize()
        category = random.choice(["Electronics", "Books", "Toys", "Clothing", "Kitchen"])
        price = round(random.uniform(10, 500), 2)
        stock = random.randint(0, 100)
        f.write(
            f"INSERT INTO products (name, category, price, stock) VALUES ('{name}', '{category}', {price}, {stock});\n"
        )

    # --- Orders ---
    f.write("\n-- Orders\n")
    for order_id in range(1, NUM_ORDERS + 1):
        customer_id = random.randint(1, NUM_CUSTOMERS)
        order_date = fake.date_between(start_date="-2y", end_date="today")
        total_amount = round(random.uniform(50, 1000), 2)
        f.write(
            f"INSERT INTO orders (customer_id, order_date, total_amount) VALUES ({customer_id}, '{order_date}', {total_amount});\n"
        )

    # --- Order Items ---
    f.write("\n-- Order Items\n")
    for order_id in range(1, NUM_ORDERS + 1):
        num_items = random.randint(1, 3)
        added_products = random.sample(range(1, NUM_PRODUCTS + 1), num_items)
        for product_id in added_products:
            quantity = random.randint(1, 5)
            unit_price = round(random.uniform(10, 300), 2)
            f.write(
                f"INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES ({order_id}, {product_id}, {quantity}, {unit_price});\n"
            )

    # --- Reviews ---
    f.write("\n-- Reviews\n")
    for _ in range(100):
        product_id = random.randint(1, NUM_PRODUCTS)
        customer_id = random.randint(1, NUM_CUSTOMERS)
        rating = random.randint(1, 5)
        comment = fake.sentence(nb_words=6).replace("'", "")
        f.write(
            f"INSERT INTO reviews (product_id, customer_id, rating, comment) VALUES ({product_id}, {customer_id}, {rating}, '{comment}');\n"
        )

print("✔️ insert_data.sql başarıyla oluşturuldu.")
