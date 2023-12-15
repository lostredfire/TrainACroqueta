from Interfaces.MariaDB.MariaDBConnector import DBConnect
from Models.Constants import ReturnCodes

dbConnection = None

def init(dbConn : DBConnect):
   print("--------- MariaDBDataWriter initializing...")
   global dbConnection
   dbConnection = dbConn


def createUser(username : str, passwd: str, fullName: str, email: str, profileImg):
   """
   Create the sentence sql
   """
   global dbConnection
   if (profileImg == None):
      sql = "INSERT INTO users (userName,password,fullName,email) VALUES ('"+username+"','"+passwd+"','"+fullName+"','"+email+"');"
   else: 
      sql = "INSERT INTO users (userName,password,fullName,email,profileImg) VALUES ('"+username+"','"+passwd+"','"+fullName+"','"+email+"','"+profileImg+"');"
      
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlWriteRead(sql)
   else:
      returnValue = ReturnCodes.ERROR

   return returnValue

def createExercise(idGame : int, dateTime):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "INSERT INTO exercisecroquetas (idGame,dateTime) VALUES ("+ str(idGame)+",'"+ str(dateTime)+"');"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlWriteRead(sql)
   else:
      returnValue = ReturnCodes.ERROR
   return returnValue

def updateExercise(idExercise : int, qttyCroquetas : int):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "UPDATE exercisecroquetas SET qttyCroquetas = "+ str(qttyCroquetas)+" WHERE idExercise = "+ str(idExercise)+";"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlWrite(sql)
   else:
      returnValue = ReturnCodes.ERROR
   return returnValue

def finishExercise(idExercise : int, qttCroquetas : int, duration: int ):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "UPDATE exercisecroquetas SET qttyCroquetas = " + str(qttCroquetas) + ",duration = " + str(duration) + " WHERE idExercise = " + str(idExercise) + ";"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlWrite(sql)
   else:
      returnValue = ReturnCodes.ERROR
   return returnValue

def updateGamedata(idGame : int, nCroquetas : int , lastDay):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "update gamedata set nCroquetas = " + str(nCroquetas) + ", lastDay = " + str(lastDay) + " where idGame = " + str(idGame) + ";"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlWrite(sql)
   else:
      returnValue = ReturnCodes.ERROR
   return returnValue

def createGamedata(idUser : int):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "INSERT INTO gamedata (idUser) VALUES ('" + str(idUser) + "');"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlWrite(sql)
   else:
      returnValue = ReturnCodes.ERROR
   return returnValue

def createGameproducer(idGame : int, idProd :int):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "INSERT INTO gameproducer (idGame,idProd) VALUES (" + str(idGame) + "," + str(idProd) + ");"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlWrite(sql)
   else:
      returnValue = ReturnCodes.ERROR
   return returnValue

def updateGameproducer(idGame : int, idProd : int , quantity : int, qttyCroquetas : int):
   """
   Create the sentence sql
   """
   global dbConnection
   sql = "update gameproducer set quantity = " + str(quantity) + ", qttyCroquetas = " + str(qttyCroquetas) + " where idGame = "+str(idGame) + " and idProd = " + str(idProd) + ";"
   if (dbConnection != None):
      returnValue = dbConnection.executeSqlWrite(sql)
   else:
      returnValue = ReturnCodes.ERROR
   return returnValue
