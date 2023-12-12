from Models.Ranking import Ranking
from Controllers.DBManager import DBManager
from Models.Constants import ReturnCodes

class RankingManager:

   dbmngr = None

   def __init__(self,dbmanager: DBManager ):
      print("--------- Ranking Manager initializing...")
      self.dbmngr = dbmanager

   def getRanking(self):
      """
      Send the request to DBManager and get the result 
      """
      listRanking = []
      result = self.dbmngr.getRanking()
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         for dat in result:
            datusername = dat[0]
            datncroquetas = dat[1]
            dbranking= Ranking(datusername,datncroquetas)
            listRanking.append(dbranking)
         return listRanking
      return returnValue 
   