import mariadb
from threading import Lock

# Globar variables with configurations of database
HOST = '192.168.1.22'
PORT = 3306
USER = 'root'
PASSWD = 'Cst0mP4ssF0rM4r14Db'
DB = 'trainacroquetadb'

class DBConnect():

   dbConection = None

   def __init__(self):
      """
      Configurate the connector and connect to MariaDB
      """
      self.lock = Lock()
      print("--------- MariaDBConnector initializing...")
      try:
         self.dbConection = mariadb.connect(
            user = USER, 
            password = PASSWD,
            host = HOST,
            port = PORT,
            database = DB
         )
      except mariadb.Error as e:
         return("Error")
      
      self.dbCursor = self.dbConection.cursor()

   def executeSqlRead(self, sql):
      """
      Get a sql sentence and execute, return the result
      """
      self.lock.acquire()
      self.dbCursor.execute(sql)
      self.dbConection.commit()
      self.lock.release()
      return self.dbCursor.fetchall()
   
   
   def executeSqlWrite(self, sql):
      """
      Get a sql sentence and execute, return the result
      """
      self.lock.acquire()
      self.dbCursor.execute(sql)
      rows = self.dbCursor.rowcount
      self.dbConection.commit()
      self.lock.release()
      return rows
   
   def executeSqlWriteRead(self, sql):
      """
      Get a sql sentence and execute, return the result
      """
      self.lock.acquire()
      self.dbCursor.execute(sql)
      rowId = self.dbCursor.lastrowid
      self.dbConection.commit()
      self.lock.release()
      return rowId

      