import mysql.connector
import psycopg2
from psycopg2.extras import RealDictCursor
import os
from datetime import datetime
import logging
from prettytable import PrettyTable

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def fetch_mysql_sales():
    try:
        conn = mysql.connector.connect(
            host=os.getenv('MYSQL_HOST'),
            user=os.getenv('MYSQL_USER'),
            password=os.getenv('MYSQL_PASSWORD'),
            database='inventory_db'
        )
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM sales")
        results = cursor.fetchall()
        conn.close()
        logger.info(f"Fetched {len(results)} sales records")
        return results
    except Exception as e:
        logger.error(f"MySQL Error: {e}")
        return []

def fetch_postgres_purchases():
    try:
        conn = psycopg2.connect(
            host=os.getenv('POSTGRES_HOST'),
            user=os.getenv('POSTGRES_USER'),
            password=os.getenv('POSTGRES_PASSWORD'),
            database='supply_db'
        )
        cursor = conn.cursor(cursor_factory=RealDictCursor)
        cursor.execute("SELECT * FROM purchases")
        results = cursor.fetchall()
        conn.close()
        logger.info(f"Fetched {len(results)} purchase records")
        return results
    except Exception as e:
        logger.error(f"PostgreSQL Error: {e}")
        return []

def display_combined_data(sales, purchases):
    # Create a combined table
    table = PrettyTable()
    table.field_names = ["Type", "Product", "Quantity", "Date", "Partner", "Amount"]
    table.align = "l"

    # Add sales data
    for sale in sales:
        table.add_row([
            "SALE",
            sale['product'],
            sale['quantity'],
            sale['sale_date'],
            sale['customer'],
            f"${sale['amount']}"
        ])

    # Add purchase data
    for purchase in purchases:
        table.add_row([
            "PURCHASE",
            purchase['product'],
            purchase['quantity'],
            purchase['purchase_date'],
            purchase['supplier'],
            f"${purchase['unit_price']}"
        ])

    # Sort by date (newest first)
    table.sortby = "Date"
    table.reversesort = True

    print("\n=== COMBINED SALES & PURCHASES ===")
    print(table)

def main():
    logger.info("Starting data fetch...")
    start_time = datetime.now()

    sales = fetch_mysql_sales()
    purchases = fetch_postgres_purchases()

    if sales and purchases:
        display_combined_data(sales, purchases)
    else:
        logger.error("Failed to fetch data from one or both databases")

    logger.info(f"Completed in {(datetime.now() - start_time).total_seconds():.2f} seconds")

if __name__ == "__main__":
    main()
    input("Press Enter to exit...")
