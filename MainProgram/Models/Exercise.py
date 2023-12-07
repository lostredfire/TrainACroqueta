class Exercise():
    """ Exercise class to manage exercise information """

    idGame = None
    idExercise = None
    qttCroquetas = ""
    duration = ""
    datetime = ""

    def __init__(self, idGame: int = None, idExercise: int = None, qttCroquetas: int = None, duration: int = None, datetime = None ):
        """ Constructor with idGame, idExercise, qttCroquetas, duration and datetime """
        self.idGame= idGame
        self.idExercise = idExercise
        self.qttCroquetas = qttCroquetas
        self.duration = duration
        self.datetime = datetime
