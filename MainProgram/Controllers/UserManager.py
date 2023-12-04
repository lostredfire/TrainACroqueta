from Models.User import User
from Controllers.DBManager import DBManager
from Models.Constants import ReturnCodes

class UserManager:

   dbmngr = None

   def __init__(self, dbmanager: DBManager  ):
      """
      Inicialize UserManager, get DBManager
      """
      print("--------- User Manager initializing...")
      self.dbmngr = dbmanager

   def loginuser(self, newuser: User):
      """
      Get the object User and send to DBManager
      """
      result = self.dbmngr.readUser(newuser.username)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.NOT_USER):
         returnValue = ReturnCodes.NOT_USER
      else: 
         for dat in result:
            datid = dat[0]
            datname = dat[1]
            datpass = dat[2]
            datfullname = dat[3]
            datemail = dat[4]
            datimg = dat[5]
         dbUser = User(datid,datname,datpass,datfullname,datemail,datimg)
         if (dbUser.passwd == newuser.passwd):
            returnValue = dbUser
         else:
            returnValue = ReturnCodes.WRONG_PSSWD
      return returnValue  
   
   def createuser(self, newuser: User):
      """
      Get the object User and send to DBManager
      """
      if (newuser.profileImg):
         result = self.dbmngr.createUser(newuser.username,newuser.passwd,newuser.fullName,newuser.email,newuser.profileImg)
      else:
         result = self.dbmngr.createUser(newuser.username,newuser.passwd,newuser.fullName,newuser.email)
      
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.USER_EXISTS):
         returnValue = ReturnCodes.USER_EXISTS
      else: 
         datiduser = result
         returnValue = User(datiduser)
      return returnValue
 
