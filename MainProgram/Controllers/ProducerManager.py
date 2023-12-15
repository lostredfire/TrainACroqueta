from Models.Producer import Producer
from Models.GameProducer import GameProducer
from Controllers.DBManager import DBManager
from Models.Constants import ReturnCodes

class ProducerManager:

   dbMngr = None

   def __init__(self, dbManager: DBManager ):
      print("--------- Producer Manager initializing...")
      self.dbMngr = dbManager

   def getProducers(self):
      """
      Send the request to DBManager and get the result 
      """
      listProducer = []
      result = self.dbMngr.getProducers()
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         for dat in result:
            datId = dat[0]
            datName = dat[1]
            datQtt = dat[2]
            datImg = dat[3]
            datDrcp = dat[4]
            datPrice = dat[5]
            dbProducer = Producer(datId,datName,datQtt,datImg,datDrcp,datPrice)
            listProducer.append(dbProducer)
         return listProducer
      return returnValue 
   
   def getGameProducers(self, idGame : int):
      """
      Send the request to DBManager and get the result 
      """
      listGameProducer = []
      result = self.dbMngr.getGameProducers(idGame)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         for dat in result:
            datIdProd = dat[0]
            datQuantity = dat[1]
            datQttyCroquetas = dat[2]
            dbGameProducer = GameProducer(None, datIdProd, datQuantity, datQttyCroquetas)
            listGameProducer.append(dbGameProducer.__dict__)
         return listGameProducer
      return returnValue 
   
   def updateGameproducer(self, listGameProducer):
      """
      Get the object Gameproducer and send to DBManager
      """
      for dat in listGameProducer:
         datGameProducer = GameProducer(dat['idGame'],dat['idProd'],dat['quantity'],dat['qttyCroquetas'])
         result = self.dbMngr.updateGameproducer(datGameProducer.idGame, datGameProducer.idProd, datGameProducer.quantity,datGameProducer.qttyCroquetas)
      
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.UPDATED_SUCCESS):
         returnValue = ReturnCodes.UPDATED_SUCCESS
         
      return returnValue 
   