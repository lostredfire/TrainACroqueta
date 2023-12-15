
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
   sql = "select idGame,nCroquetas,lastDay from gamedata where idUser = " + str(idUser) + ";"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlRead(sql)
   else:
      returnValue = ReturnCodes.ERROR

   return returnValue

def readGameProducers(idGame: int, idProd: int = None):
   """
   Create the sentence sql
   """
   global dbConnection
   if (idProd != None):
      sql = "SELECT quantity, qttyCroquetas FROM gameproducer where idGame = " + str(idGame) + " and idProd = "+ str(idProd) +";"
   else: 
      sql = "SELECT idProd, quantity, qttyCroquetas FROM gameproducer where idGame = " + str(idGame) + " ;"
  
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlRead(sql)
   else:
      returnValue = ReturnCodes.ERROR

   return returnValue

def readRanking():
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "select usr.userName, gd.nCroquetas from gamedata as gd inner join users as usr on usr.idUser = gd.idUser order by gd.nCroquetas DESC;"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlRead(sql)
   else:
      returnValue = ReturnCodes.ERROR

   return returnValue
