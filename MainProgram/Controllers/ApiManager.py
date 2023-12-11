import Interfaces.API.Api as Api
from Controllers.UserManager import UserManager
from Controllers.ExerciseManager import ExerciseManager
from Controllers.ProducerManager import ProducerManager
from Controllers.GameManager import GameManager

from Models.User import User
from Models.Exercise import Exercise
from Models.GameData import Gamedata
from Models.GameProducer import GameProducer
from Models.Constants import ReturnCodes

class ApiManager:

   usrmngr = None
   excmngr = None
   prdmngr = None
   gamemngr = None    

   def __init__(self, usermanager: UserManager, exercisemanager: ExerciseManager, producermanager: ProducerManager, gamemanager : GameManager):
      """
      Inicialize ApiManager, inicialize API and get UserManager
      """
      print("--------- API Manager initializing...")
      # Initialize the API Server
      self.usrmngr = usermanager
      self.excmngr = exercisemanager
      self.prdmngr = producermanager
      self.gmmngr = gamemanager
      Api.init(self)

   def login(self, userDict : dict):
      """
      Check if the dict has the right keys and create the object User with this values. 
      """
      if ( len(userDict) == 2 ) and ( "username" in userDict ) and ( "passwd" in userDict ) :
         newuser = User(None,userDict["username"],userDict["passwd"])
         result = self.usrmngr.loginuser(newuser)
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         elif result == (ReturnCodes.NOT_USER):
            returnValue = ReturnCodes.NOT_USER
         elif result == (ReturnCodes.WRONG_PSSWD):
            returnValue = ReturnCodes.WRONG_PSSWD
         else:
            returnValue = result.__dict__
      else:
         returnValue = ReturnCodes.MISSING_DATA

      return returnValue

   def createUser(self, newuserDict : dict):
      """
      Check if the dict has the right keys and create the object User with this values. 
      """
      if ( len(newuserDict) == 4 ) or ( len(newuserDict) == 5 ):
         if ( len(newuserDict) == 4):
            newuser = User(None,newuserDict["username"],newuserDict["passwd"],newuserDict["fullname"],newuserDict["email"])
         else: 
            newuser = User(None,newuserDict["username"],newuserDict["passwd"],newuserDict["fullname"],newuserDict["email"],newuserDict["profileimg"])
         
         result = self.usrmngr.createuser(newuser)
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         elif result == (ReturnCodes.USER_EXISTS):
            returnValue = ReturnCodes.USER_EXISTS
         else:
            resultiduser = result
            resultValuedg = self.createDatagame(result)
            if resultValuedg == (ReturnCodes.ERROR):
               returnValue = ReturnCodes.ERROR
            elif resultValuedg == (ReturnCodes.CREATED):
               returnValue = resultiduser.__dict__
      else:
         returnValue = ReturnCodes.MISSING_DATA

      return returnValue   
   

   def createExercise(self, exerciseDict : dict):
      """
      Check if the dict has the right keys and create the object Exercise with this values. 
      """
      if ( len(exerciseDict) == 2 ) and ( "idGame" in exerciseDict ) and ( "dateTime" in exerciseDict ) :
         newexercise = Exercise(exerciseDict["idGame"],None,None,None,exerciseDict["dateTime"])
         result = self.excmngr.createExercise(newexercise)
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         else:
            returnValue = result.__dict__
      else:
         returnValue = ReturnCodes.MISSING_DATA

      return returnValue

   def updateExercise(self, exerciseDict : dict):
      """
      Check if the dict has the right keys and create the object Exercise with this values. 
      """
      if ( len(exerciseDict) == 2 ) and ( "idExercise" in exerciseDict ) and ( "qttCroquetas" in exerciseDict ) :
         uptexercise = Exercise(None,exerciseDict["idExercise"],exerciseDict["qttCroquetas"])
         result = self.excmngr.updateExercise(uptexercise)
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         elif result == (ReturnCodes.UPDATED_SUCCESS):
            returnValue = ReturnCodes.UPDATED_SUCCESS
      else:
         returnValue = ReturnCodes.MISSING_DATA

      return returnValue

   def finishExercise(self, exerciseDict : dict):
      """
      Check if the dict has the right keys and create the object Exercise with this values. 
      """
      if ( len(exerciseDict) == 3 ) and ( "idExercise" in exerciseDict ) and ( "qttCroquetas" in exerciseDict ) and ( "duration" in exerciseDict ) :
         fnshexercise = Exercise(None,exerciseDict["idExercise"],exerciseDict["qttCroquetas"],exerciseDict["duration"])
         result = self.excmngr.finishExercise(fnshexercise)
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         elif result == (ReturnCodes.UPDATED_SUCCESS):
            returnValue = ReturnCodes.UPDATED_SUCCESS
      else:
         returnValue = ReturnCodes.MISSING_DATA

      return returnValue

   def getProducers(self):
      """
      Send the resquest to ProducerManager 
      """
      result = self.prdmngr.getProducers()
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else:
         returnValue = result

      return returnValue   
   
   def getGamedata(self,gamedataDict: dict):
      """
      Send the resquest to GameManager 
      """
      if ( len(gamedataDict) == 1 ) and ( "idUser" in gamedataDict ):
         result = self.gmmngr.getGamedata(gamedataDict["idUser"])
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         else:
            returnValue = result.__dict__
      else:
         returnValue = ReturnCodes.MISSING_DATA
      return returnValue   
   
   def updateGamedata(self, gamedataDict : dict):
      """
      Check if the dict has the right keys and create the object Gamedata with this values. 
      """
      if ( len(gamedataDict) == 3 ) and ( "idGame" in gamedataDict ) and ( "nCroquetas" in gamedataDict ) and ( "lastday" in gamedataDict ):
         uptgamedata = Gamedata(gamedataDict["idGame"],None,gamedataDict["nCroquetas"],gamedataDict["lastday"])
         result = self.gmmngr.updateGamedata(uptgamedata)
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         elif result == (ReturnCodes.UPDATED_SUCCESS):
            returnValue = ReturnCodes.UPDATED_SUCCESS
      else:
         returnValue = ReturnCodes.MISSING_DATA

      return returnValue
   
   def createDatagame(self, idUserDict: User):
      """
      Create datagame base to new users
      """
      result = self.gmmngr.createGamedata(idUserDict.idUser)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else:
            returnValue = ReturnCodes.CREATED
      
      return returnValue   
   