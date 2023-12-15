from Models.Ranking import Ranking
from Controllers.DBManager import DBManager
from Models.Constants import ReturnCodes

class RankingManager:

   dbMngr = None

   def __init__(self, dbManager: DBManager ):
      print("--------- Ranking Manager initializing...")
      self.dbMngr = dbManager

   def getRanking(self):
      """
      Send the request to DBManager and get the result 
      """
      listRanking = []
      result = self.dbMngr.getRanking()
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         for dat in result:
            datidUser = dat[0]
            datUsername = dat[1]
            datNCroquetas = dat[2]
            dbRanking= Ranking(datidUser,datUsername, datNCroquetas)
            listRanking.append(dbRanking)
         return listRanking
      return returnValue 
   