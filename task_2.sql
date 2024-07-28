import mysql.connector
from mysql.connector import errorcode

try:

    mydb = mysql.connector.connect(
        host='localhost',  
        user='my username',  
        password='my password',  
        database='alx_book_store'  
    )

    if mydb.is_connected():
        print("Connection successful.")
        mycursor = mydb.cursor()


        create_authors_table = 
        CREATE TABLE IF NOT EXISTS Authors (
            author_id INT AUTO_INCREMENT PRIMARY KEY,
            author_name VARCHAR(215) NOT NULL
        )
        
        
        create_books_table = 
        CREATE TABLE IF NOT EXISTS Books (
            book_id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(130) NOT NULL,
            author_id INT,
            price DOUBLE,
            publication_date DATE,
            FOREIGN KEY (author_id) REFERENCES authors(author_id)
        )
        
        create_customers_table = 
        CREATE TABLE IF NOT EXISTS Customers (
            customer_id INT AUTO_INCREMENT PRIMARY KEY,
            customer_name VARCHAR(215) NOT NULL,
            email VARCHAR(215),
            address TEXT
        )
        
        
        create_orders_table = 
        CREATE TABLE IF NOT EXISTS Orders (
            order_id INT AUTO_INCREMENT PRIMARY KEY,
            customer_id INT,
            order_date DATE,
            FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        )
        
        
        create_order_details_table = 
        CREATE TABLE IF NOT EXISTS Order_Details (
            orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
            order_id INT,
            book_id INT,
            quantity DOUBLE,
            FOREIGN KEY (order_id) REFERENCES Orders(order_id),
            FOREIGN KEY (book_id) REFERENCES Books(book_id)
        )
        
        mycursor.execute(create_authors_table)
        mycursor.execute(create_books_table)
        mycursor.execute(create_customers_table)
        mycursor.execute(create_orders_table)
        mycursor.execute(create_order_details_table)

        print("Created successfully!")

except mysql.connector.Error as Invalid:
    if Invalid.Invalid == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Check your username and/or your password")
    elif Invalid.Invalid == errorcode.ER_BAD_DB_ERROR:
        print("Database doesn't exist")
    else:
        print(Invalid)
finally:
    if mydb.is_connected():
        mycursor.close()
        mydb.close()
        print("Connection ended.")
        