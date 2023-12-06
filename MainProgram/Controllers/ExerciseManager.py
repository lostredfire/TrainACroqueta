from Models.Exercise import Exercise
from Controllers.DBManager import DBManager
from Models.Constants import ReturnCodes

class ExerciseManager:

   dbmngr = None

   def __init__(self,dbmanager: DBManager ):
      print("--------- Exercise Manager initializing...")
      self.dbmngr = dbmanager

   def createExercise(self, newexercise: Exercise):
      """
      Get the object Exercise and send to DBManager
      """
      result = self.dbmngr.createExercise(newexercise.idGame,newexercise.datetime )
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         dbExercise = Exercise(None,result)
         returnValue = dbExercise
      return returnValue 
   
   def updateExercise(self, newexercise: Exercise):
      """
      Get the object Exercise and send to DBManager
      """
      result = self.dbmngr.updateExercise(newexercise.idExercise,newexercise.qttCroquetas )
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.UPDATED_SUCCESS):
         returnValue = ReturnCodes.UPDATED_SUCCESS

      return returnValue 
   
   def finishExercise(self, newexercise: Exercise):
      """
      Get the object Exercise and send to DBManager
      """
      result = self.dbmngr.finishExercise(newexercise.idExercise,newexercise.qttCroquetas,newexercise.duration)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.UPDATED_SUCCESS):
         returnValue = ReturnCodes.UPDATED_SUCCESS
         
      return returnValue 