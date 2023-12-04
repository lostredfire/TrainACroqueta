
from Interfaces.MariaDB.MariaDBConnector import DBConnect
from Models.Constants import ReturnCodes

dbConnection = None

def init(dbConn : DBConnect):
   """
   Inicialize MariaDBDataReader and get the instance of DBConnection
   """
   print("--------- MariaDBDataReader initializing...")
   global dbConnection
   dbConnection = dbConn


def readUserPass(username : str):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "SELECT  idUser, userName, password, fullName, email, profileImg FROM users WHERE userName = '" + username + "';"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlRead(sql)
   else:
      returnValue = ReturnCodes.ERROR

   return returnValue

def readUser(username : str):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "SELECT userName FROM users WHERE userName = '" + username + "';"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlRead(sql)
   else:
      returnValue = ReturnCodes.ERROR

   return returnValue

def readProducers():
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "SELECT idProd, prodName, prodQuantity, img, description, price FROM producer"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlRead(sql)
   else:
      returnValue = ReturnCodes.ERROR

   return returnValue

def readGamedata(idUser : int):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "select idGame,nCroquetas,lastDay from gamedata where idUser = '" + str(idUser) + "';"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlRead(sql)
   else:
      returnValue = ReturnCodes.ERROR

   return returnValue

