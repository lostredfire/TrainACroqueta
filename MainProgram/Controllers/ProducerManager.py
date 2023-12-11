from Models.Producer import Producer
from Models.GameProducer import GameProducer
from Controllers.DBManager import DBManager
from Models.Constants import ReturnCodes

class ProducerManager:

   dbmngr = None

   def __init__(self,dbmanager: DBManager ):
      print("--------- Producer Manager initializing...")
      self.dbmngr = dbmanager

   def getProducers(self):
      """
      Send the request to DBManager and get the result 
      """
      listProducer = []
      result = self.dbmngr.getProducers()
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         for dat in result:
            datid = dat[0]
            datname = dat[1]
            datqtt = dat[2]
            datimg = dat[3]
            datdrcp = dat[4]
            datprice = dat[5]
            dbproducer = Producer(datid,datname,datqtt,datimg,datdrcp,datprice)
            listProducer.append(dbproducer)
         return listProducer
      return returnValue 
   
   def getGameProducers(self,idGame : int):
      """
      Send the request to DBManager and get the result 
      """
      listgameProducer = []
      result = self.dbmngr.getGameProducers(idGame)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         for dat in result:
            datidprod = dat[0]
            datquantity = dat[1]
            dbgameproducer = GameProducer(None,datidprod,datquantity)
            listgameProducer.append(dbgameproducer.__dict__)
         return listgameProducer
      return returnValue 
   
   def updateGameproducer(self,listgameproducer):
      """
      Get the object Gameproducer and send to DBManager
      """
      for dat in listgameproducer:
            datgameproducer = GameProducer(dat['idGame'],dat['idProd'],dat['quantity'])
            result = self.dbmngr.updateGameproducer(datgameproducer.idGame, datgameproducer.idProd, datgameproducer.quantity)
      
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.UPDATED_SUCCESS):
         returnValue = ReturnCodes.UPDATED_SUCCESS
         
      return returnValue 