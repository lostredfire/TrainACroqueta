import mariadb

# Globar variables with configurations of database
HOST = "192.168.1.22"
PORT = 3306
USER = "root"
PASSWD = "Cst0mP4ssF0rM4r14Db"
DB = "trainacroquetadb"

try:
    conn = mariadb.connect(
        user = "root", 
        password="Cst0mP4ssF0rM4r14Db",
        host="192.168.1.22",
        port=3306,
        database="trainacroquetadb"
    )
except mariadb.Error as e:
    print(e)

cur = conn.cursor()
cur.execute("INSERT INTO users (userName, password, fullName, email) VALUES ('Silviaaaatestaaa','tesaaaaaat','Holaaaaaa','emaaaaaaail')")
print(cur.lastrowid)
conn.commit()
conn.close()
