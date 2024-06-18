import random
from faker import Faker
import pandas as pd
import hashlib
import json

# Initialize the Faker library
fake = Faker()

# Variables to control the number of records
NUM_USERS = 20
NUM_COMPANIES = 5
NUM_LOCATIONS = 15
NUM_ITEMS = 50
NUM_INVENTORY_RECORDS = 100

# Function to generate a password hash and salt
def generate_password_hash(password):
    salt = fake.sha256()[:16]  # Generate a random salt
    salted_password = password + salt
    password_hash = hashlib.sha256(salted_password.encode()).hexdigest()
    return password_hash, salt

# Step 1: Generate dummy data for the Companies table
companies = []
for company_id in range(1, NUM_COMPANIES + 1):
    companies.append({
        'company_id': company_id,
        'name': fake.company(),
        'addr': fake.address(),
        'created_at': fake.date_time_this_year(),
        'updated_at': fake.date_time_this_year()
    })

# Convert to DataFrame for better visualization
df_companies = pd.DataFrame(companies)

# Step 2: Create a mapping of users to companies
# Each user will be associated with one company
user_company_map = {user_id: random.randint(1, NUM_COMPANIES) for user_id in range(1, NUM_USERS + 1)}

# Step 3: Generate dummy data for the Users table
users = []
for user_id in range(1, NUM_USERS + 1):
    password = fake.password()
    password_hash, salt = generate_password_hash(password)
    users.append({
        'user_id': user_id,
        'company_id': user_company_map[user_id],  # Foreign key to Companies
        'username': fake.user_name(),
        'email': fake.email(),
        'password': password_hash,
        'salt': salt,
        'role': random.choice(['Admin', 'Employee']),
        'created_at': fake.date_time_this_year(),
        'updated_at': fake.date_time_this_year(),
        'firstname': fake.first_name(),
        'surname': fake.last_name()
    })

# Convert to DataFrame for better visualization
df_users = pd.DataFrame(users)

# Step 4: Generate dummy data for the Locations table
locations = []
for location_id in range(1, NUM_LOCATIONS + 1):
    locations.append({
        'location_id': location_id,
        'company_id': random.randint(1, NUM_COMPANIES),  # Foreign Key from Companies
        'location': fake.city(),
        'addr': fake.address(),
        'created_at': fake.date_time_this_year(),
        'updated_at': fake.date_time_this_year()
    })

# Convert to DataFrame for better visualization
df_locations = pd.DataFrame(locations)

# Step 5: Generate dummy data for the Items table
items = []
for _ in range(1, NUM_ITEMS + 1):
    sku = fake.unique.ean(length=13)
    items.append({
        'sku': sku,
        'name': fake.word(),
        'description': fake.sentence(),
        'category': fake.word(),
        'unit_type': random.choice(['whole', 'fractional', 'measured']),
        'metadata': json.dumps({'color': fake.color_name(), 'weight': random.uniform(1, 100)}),
        'created_at': fake.date_time_this_year(),
        'updated_at': fake.date_time_this_year()
    })

# Convert to DataFrame for better visualization
df_items = pd.DataFrame(items)

# Step 6: Generate dummy data for the Inventory table
inventory_records = []
for inventory_id in range(1, NUM_INVENTORY_RECORDS + 1):
    inventory_records.append({
        'inventory_id': inventory_id,
        'location_id': random.randint(1, NUM_LOCATIONS),  # Foreign Key from Locations
        'item_sku': random.choice(df_items['sku'].values),  # Foreign Key from Items
        'quantity': round(random.uniform(1, 100), 2),
        'created_at': fake.date_time_this_year(),
        'updated_at': fake.date_time_this_year()
    })

# Convert to DataFrame for better visualization
df_inventory = pd.DataFrame(inventory_records)

# DO NOT REMOVE - Function to remove existing CSV files
# def remove_existing_files():
#     files = ['users.csv', 'companies.csv', 'locations.csv', 'items.csv', 'inventory.csv']
#     for file in files:
#         if os.path.exists(file):
#             os.remove(file)
#             print(f"Removed existing file: {file}")
#         else:
#             print(f"File does not exist: {file}")

# # Remove existing files before generating new data
# remove_existing_files()

# Save the DataFrames to CSV files
df_companies.to_csv('companies.csv', index=False)
df_users.to_csv('users.csv', index=False)
df_locations.to_csv('locations.csv', index=False)
df_items.to_csv('items.csv', index=False)
df_inventory.to_csv('inventory.csv', index=False)

print("Dummy data generated and saved to CSV files.")

# The following code is for reference in case you want to manually copy SQL code  
# Function to generate SQL INSERT queries
def generate_insert_queries(df, table_name):
    columns = ', '.join(df.columns)
    values_list = []
    
    for _, row in df.iterrows():
        values = []
        for value in row:
            if pd.isnull(value):
                values.append('NULL')
            elif isinstance(value, (int, float)):
                values.append(str(value))
            else:
                values.append(f"'{str(value).replace('\'', '\'\'')}'")
        values_str = ', '.join(values)
        values_list.append(f"({values_str})")
    
    query = f"INSERT INTO {table_name} ({columns}) VALUES\n{',\n'.join(values_list)};"
    return query

# Generate SQL queries for each table
users_query = generate_insert_queries(df_users, 'users')
companies_query = generate_insert_queries(df_companies, 'companies')
locations_query = generate_insert_queries(df_locations, 'locations')
items_query = generate_insert_queries(df_items, 'items')
inventory_query = generate_insert_queries(df_inventory, 'inventory')

# Save the queries to a text file
with open('insert_queries.sql', 'w') as f:
    f.write("-- SQL queries to insert data into the tables\n\n")
    f.write("-- Insert data into companies table\n")
    f.write(companies_query + '\n\n')
    f.write("-- Insert data into users table\n")
    f.write(users_query + '\n\n')
    f.write("-- Insert data into locations table\n")
    f.write(locations_query + '\n\n')
    f.write("-- Insert data into items table\n")
    f.write(items_query + '\n\n')
    f.write("-- Insert data into inventory table\n")
    f.write(inventory_query + '\n\n')

print("SQL insert queries have been generated and saved to insert_queries.sql.")
