import mariadb

# Globar variables with configurations of database
HOST = '192.168.1.22'
PORT = 3306
USER = 'root'
PASSWD = 'Cst0mP4ssF0rM4r14Db'
DB = 'trainacroquetadb'

class DBConnect():

   dbconection = None

   def __init__(self):
      """
      Configurate the connector and connect to MariaDB
      """
      print("--------- MariaDBConnector initializing...")
      try:
         self.dbconection = mariadb.connect(
            user = USER, 
            password= PASSWD,
            host= HOST,
            port= PORT,
            database= DB
         )
      except mariadb.Error as e:
         return("Error")
      
      self.dbcursor = self.dbconection.cursor()

   def executeSqlRead(self, sql):
      """
      Get a sql sentence and execute, return the result
      """
      self.dbcursor.execute(sql)
      self.dbconection.commit()
      return self.dbcursor.fetchall()
   
   def executeSqlWrite(self, sql):
      """
      Get a sql sentence and execute, return the result
      """
      self.dbcursor.execute(sql)
      rows = self.dbcursor.rowcount
      self.dbconection.commit()
      return rows
   
   def executeSqlWriteRead(self, sql):
      """
      Get a sql sentence and execute, return the result
      """
      self.dbcursor.execute(sql)
      rowid = self.dbcursor.lastrowid
      self.dbconection.commit()
      return rowid

      