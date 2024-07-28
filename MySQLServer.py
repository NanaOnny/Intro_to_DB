import mysql.connector
from mysql.connector import errorcode

def create_database(cursor):
    try:
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as Invalid:
        print(f"Failed creating database: {Invalid}")


def main():
    try:
        mydb = mysql.connector.connect(host = "localhost", user = "root",passwd = "nanaonnyMySQLServer8.0.39")
        mycursor = mydb.mycursor()
        create_database(mycursor)

        mycursor.close()
        mydb.close()

    except mysql.connector.Error as  Invalid:
        if Invalid.Invalid == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Please check username and/or password")
        elif Invalid.Invalid == errorcode.ER_BAD_DB_ERROR:
            print("Sorry, database does not exist")
        else:
            print(Invalid)


if __name__ == "__main__":
    main()