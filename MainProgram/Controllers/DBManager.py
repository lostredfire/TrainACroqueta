from Interfaces.MariaDB.MariaDBConnector import DBConnect
import Interfaces.MariaDB.MariaDBDataReader as MariaDBDataReader
from Models.Constants import ReturnCodes
import Interfaces.MariaDB.MariaDBDataWriter as MariaDBDataWriter


class DBManager:
   
   dbConnector = None

   def __init__(self):
        """
        Inicialize DBManager, and create MariaDBConnector, MariaDBDataWriter and MariaDBDataReader
        """
        print("--------- DB Manager initializing...")
        # Initialize MariaDB
        self.dbConnector = DBConnect()
        MariaDBDataWriter.init(self.dbConnector)
        MariaDBDataReader.init(self.dbConnector)

   def readUser(self, username : str):  
      """
      Send the object User to MariaDBDataReader
      """   
      result = MariaDBDataReader.readUserPass(username)
      if((len(result)) == 0):
         returnValue = ReturnCodes.NOT_USER
      elif((len(result)) == 1):
         returnValue = result
      else:
         returnValue= ReturnCodes.ERROR
         
      return returnValue   
   
   def createUser(self, username : str, passwd: str, fullName: str, email: str, profileimg = None):  
      """
      Test if the user alrady exists, if not send the object User to MariaDBDataReader 
      """   
      sameuser = MariaDBDataReader.readUser(username)
      if((len(sameuser)) == 0):
         result = MariaDBDataWriter.createUser(username,passwd,fullName,email,profileimg)
         if(result >= 0):
            returnValue = result
         else:
            returnValue= ReturnCodes.ERROR
      elif((len(sameuser)) >= 1):
         returnValue = ReturnCodes.USER_EXISTS
      else:
         returnValue= ReturnCodes.ERROR

      return returnValue   
  
   def createExercise(self,idGame : int ,datetime):
      """
      Send the object User to MariaDBDataWriter
      """ 
      result = MariaDBDataWriter.createExercise(idGame, datetime)
      if(result >= 0):
         returnValue = result
      else:
         returnValue= ReturnCodes.ERROR

      return returnValue 
   
   def updateExercise(self,idExercise : int ,qttcroquetas : int):
      """
      Send the object User to MariaDBDataWriter
      """ 
      resultrow = MariaDBDataWriter.updateExercise(idExercise, qttcroquetas)
      if(resultrow == 0):
         returnValue = ReturnCodes.ERROR
      elif(resultrow == 1):
         returnValue = ReturnCodes.UPDATED_SUCCESS
      else:
         returnValue= ReturnCodes.ERROR

      return returnValue

   def finishExercise(self,idExercise : int ,qttcroquetas : int, duration : int):
      """
      Send the object User to MariaDBDataWriter
      """ 
      resultrow = MariaDBDataWriter.finishExercise(idExercise, qttcroquetas,duration)
      if(resultrow == 0):
         returnValue = ReturnCodes.ERROR
      elif(resultrow == 1):
         returnValue = ReturnCodes.UPDATED_SUCCESS
      else:
         returnValue= ReturnCodes.ERROR

      return returnValue
             
   def getProducers(self):
      """
      Send the request to MariaDBReader
      """ 
      result = MariaDBDataReader.readProducers()
      if((len(result)) == 0):
         returnValue= ReturnCodes.ERROR
      else:
         returnValue = result
         
      return returnValue   
   
   def getGamedata(self, idUser : int):
      """
      Send the request to MariaDBReader
      """ 
      result = MariaDBDataReader.readGamedata(idUser)
      if((len(result)) == 0):
         returnValue= ReturnCodes.ERROR
      else:
         returnValue = result
         
      return returnValue   
   
   def updateGamedata(self,idGame : int ,nCroquetas : int, lastday):
      """
      Send the object User to MariaDBDataWriter
      """ 
      resultrow = MariaDBDataWriter.updateGamedata(idGame, nCroquetas, lastday)
      if(resultrow == 0):
         returnValue = ReturnCodes.ERROR
      elif(resultrow == 1):
         returnValue = ReturnCodes.UPDATED_SUCCESS
      else:
         returnValue= ReturnCodes.ERROR

      return returnValue
   
   def createGamedata(self,idUser : int):
      """
      Send the request to MariaDBReader
      """ 
      result = MariaDBDataWriter.createGamedata(idUser)
      if(result >= 0):
         returnValue = ReturnCodes.CREATED
      else:
         returnValue= ReturnCodes.ERROR

      return returnValue 
   
   def getGameProducers(self, idGame: int):
      """
      Send the request to MariaDBReader
      """ 
      result = MariaDBDataReader.readGameProducers(idGame)
      if((len(result)) == 0):
         returnValue= ReturnCodes.ERROR
      else:
         returnValue = result
         
      return returnValue     
   
   def updateGameproducer(self,idGame : int ,idProd : int, quantity: int):
      """
      Test if the game has the producer, if not create a new instance and then update the game producer
      """ 
      exitsprod = MariaDBDataReader.readGameProducers(idGame, idProd)
      if((len(exitsprod)) == 0):
         resultcreate = self.createGameproducer(idGame,idProd)
         if (resultcreate == ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
      else:
         resultrow = MariaDBDataWriter.updateGameproducer(idGame, idProd, quantity)
         if(resultrow == 0):
            returnValue = ReturnCodes.ERROR
         elif(resultrow == 1):
            returnValue = ReturnCodes.UPDATED_SUCCESS
         else:
            returnValue= ReturnCodes.ERROR

      return returnValue
   
   def getRanking(self):
      """
      Send the request to MariaDBReader
      """ 
      result = MariaDBDataReader.readRanking()
      if((len(result)) == 0):
         returnValue= ReturnCodes.ERROR
      else:
         returnValue = result
         
      return returnValue   
   

