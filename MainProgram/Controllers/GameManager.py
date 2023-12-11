from Models.GameData import Gamedata
from Controllers.DBManager import DBManager
from Controllers.ProducerManager import ProducerManager
from Models.Constants import ReturnCodes

class GameManager:

   dbmngr = None
   prdmngr = None

   def __init__(self,dbmanager: DBManager, prdmngr : ProducerManager):
      print("--------- Game Manager initializing...")
      self.dbmngr = dbmanager
      self.prdmngr = prdmngr

   def getGamedata(self, idUser : int):
      """
      Send the request to DBManager and get the result 
      """
      result = self.dbmngr.getGamedata(idUser)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         for dat in result:
            datidgame = dat[0]
            datncroquetas = dat[1]
            datlastday = str(dat[2])
            dbgame = Gamedata(datidgame,None,datncroquetas,datlastday)
            dbgame.gameproducer = self.prdmngr.getGameProducers(dat[0])
         return dbgame
      
      return returnValue 

   def updateGamedata(self,uptgamedata : Gamedata):
      """
      Get the object Gamedata and send to DBManager
      """
      result = self.dbmngr.updateGamedata(uptgamedata.idGame,uptgamedata.nCroquetas,uptgamedata.lastday)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.UPDATED_SUCCESS):
         returnValue = ReturnCodes.UPDATED_SUCCESS
         
      return returnValue 

   def createGamedata(self,idUser : int):
      """
      Send the idUser to create the gamedata
      """
      result = self.dbmngr.createGamedata(idUser)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.CREATED):
         returnValue = ReturnCodes.CREATED
         
      return returnValue 