import Interfaces.API.Api as Api

from Controllers.UserManager import UserManager
from Controllers.ExerciseManager import ExerciseManager
from Controllers.ProducerManager import ProducerManager
from Controllers.GameManager import GameManager
from Controllers.RankingManager import RankingManager

from Models.User import User
from Models.Exercise import Exercise
from Models.GameData import Gamedata
from Models.Constants import ReturnCodes


class ApiManager:

   usrMngr = None
   excMngr = None
   prdMngr = None
   gameMngr = None    
   rnkMngr = None

   def __init__(self, userManager: UserManager, exerciseManager: ExerciseManager, producerManager: ProducerManager, gameManager : GameManager, rankingManager : RankingManager):
      """
      Inicialize API and managers
      """
      print("--------- API Manager initializing...")
      # Initialize the API Server
      self.usrMngr = userManager
      self.excMngr = exerciseManager
      self.prdMngr = producerManager
      self.gameMngr = gameManager
      self.rnkMngr = rankingManager
      Api.init(self)

   def login(self, userDict : dict):
      """
      Check if the dict has the right keys and create the object User with this values. 
      """
      if ( len(userDict) == 2 ) and ( "username" in userDict ) and ( "passwd" in userDict ) :
         newUser = User(None,userDict["username"],userDict["passwd"])
         result = self.usrMngr.loginuser(newUser)
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

   def createUser(self, newUserDict : dict):
      """
      Check if the dict has the right keys and create the object User with this values. 
      """
      if ( len(newUserDict) == 4 ) or ( len(newUserDict) == 5 ):
         if ( len(newUserDict) == 4):
            newUser = User(None,newUserDict["username"],newUserDict["passwd"],newUserDict["fullname"],newUserDict["email"])
         else: 
            newUser = User(None,newUserDict["username"],newUserDict["passwd"],newUserDict["fullname"],newUserDict["email"],newUserDict["profileimg"])
         
         result = self.usrMngr.createuser(newUser)
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         elif result == (ReturnCodes.USER_EXISTS):
            returnValue = ReturnCodes.USER_EXISTS
         else:
            resultIdUser = result
            newUser.idUser = result
            resultValuedg = self.createDatagame(resultIdUser)
            if resultValuedg == (ReturnCodes.ERROR):
               returnValue = ReturnCodes.ERROR
            elif resultValuedg == (ReturnCodes.CREATED):
               returnValue = newUser.__dict__
      else:
         returnValue = ReturnCodes.MISSING_DATA

      return returnValue   
   

   def createExercise(self, exerciseDict : dict):
      """
      Check if the dict has the right keys and create the object Exercise with this values. 
      """
      if ( len(exerciseDict) == 2 ) and ( "idGame" in exerciseDict ) and ( "dateTime" in exerciseDict ) :
         newExercise = Exercise(exerciseDict["idGame"],None,None,None,exerciseDict["dateTime"])
         result = self.excMngr.createExercise(newExercise)
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
         uptExercise = Exercise(None,exerciseDict["idExercise"],exerciseDict["qttCroquetas"])
         result = self.excMngr.updateExercise(uptExercise)
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
         fnshExercise = Exercise(None,exerciseDict["idExercise"],exerciseDict["qttCroquetas"],exerciseDict["duration"])
         result = self.excMngr.finishExercise(fnshExercise)
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
      result = self.prdMngr.getProducers()
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else:
         returnValue = result

      return returnValue   
   
   def getGamedata(self,gameDataDict: dict):
      """
      Send the resquest to GameManager 
      """
      if ( len(gameDataDict) == 1 ) and ( "idUser" in gameDataDict ):
         result = self.gameMngr.getGamedata(gameDataDict["idUser"])
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         else:
            if (result.gameproducer == 0):
               result.gameproducer = []
            returnValue = result.__dict__
      else:
         returnValue = ReturnCodes.MISSING_DATA
      return returnValue   
   
   def updateGamedata(self, gameDataDict : dict):
      """
      Check if the dict has the right keys and create the object Gamedata with this values. 
      """
      if ( len(gameDataDict) == 4 ) and ( "idGame" in gameDataDict ) and ( "nCroquetas" in gameDataDict ) and ( "lastday" in gameDataDict ) and ("gameproducers" in gameDataDict):
         uptGameData = Gamedata(gameDataDict["idGame"],None,gameDataDict["nCroquetas"],gameDataDict["lastday"])
         result = self.gameMngr.updateGamedata(uptGameData)
         result = self.prdMngr.updateGameproducer(gameDataDict["gameproducers"])
         if result == (ReturnCodes.ERROR):
            returnValue = ReturnCodes.ERROR
         elif result == (ReturnCodes.UPDATED_SUCCESS):
            returnValue = ReturnCodes.UPDATED_SUCCESS
      else:
         returnValue = ReturnCodes.MISSING_DATA

      return returnValue
   
   def createDatagame(self, idUser: int):
      """
      Create datagame base to new users
      """
      result = self.gameMngr.createGamedata(idUser)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else:
            returnValue = ReturnCodes.CREATED
      
      return returnValue   
   
   def getRanking(self):
      """
      Send the resquest to RankingManager
      """
      result = self.rnkMngr.getRanking()
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else:
         returnValue = result

      return returnValue  