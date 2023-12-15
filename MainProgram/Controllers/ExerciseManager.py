from Models.Exercise import Exercise
from Controllers.DBManager import DBManager
from Models.Constants import ReturnCodes

class ExerciseManager:

   dbMngr = None

   def __init__(self,dbManager: DBManager ):
      print("--------- Exercise Manager initializing...")
      self.dbMngr = dbManager

   def createExercise(self, newExercise: Exercise):
      """
      Get the object Exercise and send to DBManager
      """
      result = self.dbMngr.createExercise(newExercise.idGame,newExercise.datetime )
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      else: 
         dbExercise = Exercise(None,result)
         returnValue = dbExercise
      return returnValue 
   
   def updateExercise(self, newExercise: Exercise):
      """
      Get the object Exercise and send to DBManager
      """
      result = self.dbMngr.updateExercise(newExercise.idExercise,newExercise.qttCroquetas )
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.UPDATED_SUCCESS):
         returnValue = ReturnCodes.UPDATED_SUCCESS

      return returnValue 
   
   def finishExercise(self, newExercise: Exercise):
      """
      Get the object Exercise and send to DBManager
      """
      result = self.dbMngr.finishExercise(newExercise.idExercise,newExercise.qttCroquetas,newExercise.duration)
      if result == (ReturnCodes.ERROR):
         returnValue = ReturnCodes.ERROR
      elif result == (ReturnCodes.UPDATED_SUCCESS):
         returnValue = ReturnCodes.UPDATED_SUCCESS
         
      return returnValue 