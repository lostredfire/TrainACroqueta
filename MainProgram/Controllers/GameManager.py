from Models.GameData import Gamedata
from Controllers.DBManager import DBManager
from Controllers.ProducerManager import ProducerManager
from Models.Constants import ReturnCodes

class GameManager:

   dbMngr = None
   prdMngr = None

   def __init__(self, dbManager: DBManager, prdMngr : ProducerManager):
      print("--------- Game Manager initializing...")
      self.dbMngr = dbManager
      self.prdMngr = prdMngr

   def getGamedata(self, idUser : int):
      """
      Send the request to DBManager and get the result 
      """
      result = self.dbMngr.getGamedata(idUser)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         for dat in result:
            datIdGame = dat[0]
            datNCroquetas = dat[1]
            datLastDay = str(dat[2])
            dbGame = Gamedata(datIdGame,None,datNCroquetas,datLastDay)
            dbGame.gameproducer = self.prdMngr.getGameProducers(dat[0])
         return dbGame
      
      return returnValue 

   def updateGamedata(self, uptGameData : Gamedata):
      """
      Get the object Gamedata and send to DBManager
      """
      result = self.dbMngr.updateGamedata(uptGameData.idGame,uptGameData.nCroquetas,uptGameData.lastday)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.UPDATED_SUCCESS):
         returnValue = ReturnCodes.UPDATED_SUCCESS
         
      return returnValue 

   def createGamedata(self,idUser : int):
      """
      Send the idUser to create the gamedata
      """
      result = self.dbMngr.createGamedata(idUser)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.CREATED):
         returnValue = ReturnCodes.CREATED
         
      return returnValue 