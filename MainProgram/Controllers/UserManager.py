from Models.User import User
from Controllers.DBManager import DBManager
from Models.Constants import ReturnCodes

class UserManager:

   dbMngr = None

   def __init__(self, dbManager: DBManager  ):
      """
      Inicialize UserManager, get DBManager
      """
      print("--------- User Manager initializing...")
      self.dbMngr = dbManager

   def loginuser(self, newUser: User):
      """
      Get the object User and send to DBManager
      """
      result = self.dbMngr.readUser(newUser.username)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.NOT_USER):
         returnValue = ReturnCodes.NOT_USER
      else: 
         for dat in result:
            datId = dat[0]
            datName = dat[1]
            datPass = dat[2]
            datFullName = dat[3]
            datEmail = dat[4]
            datImg = dat[5]
         dbUser = User(datId, datName, datPass, datFullName, datEmail, datImg)
         if (dbUser.passwd == newUser.passwd):
            returnValue = dbUser
         else:
            returnValue = ReturnCodes.WRONG_PSSWD
      return returnValue  
   
   def createuser(self, newUser: User):
      """
      Get the object User and send to DBManager
      """
      if (newUser.profileImg):
         result = self.dbMngr.createUser(newUser.username, newUser.passwd, newUser.fullName, newUser.email, newUser.profileImg)
      else:
         result = self.dbMngr.createUser(newUser.username, newUser.passwd, newUser.fullName, newUser.email)
      
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.USER_EXISTS):
         returnValue = ReturnCodes.USER_EXISTS
      else: 
         returnValue = result
      return returnValue
 
