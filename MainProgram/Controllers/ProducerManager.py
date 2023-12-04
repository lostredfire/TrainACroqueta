from Models.Producer import Producer
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