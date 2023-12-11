from Models.GameProducer import GameProducer

class Gamedata():
    """ Gamedata class to manage game information """

    idGame = None
    idUser = None
    nCroquetas = None
    lastday = None
    gameproducer = None

    def __init__(self, idGame : int = None, idUser : int = None, nCroquetas : int = None, lastday = None, gameproducer: GameProducer = None):
        """ Constructor with idGame, idUser, nCroquetas and lastday """
        self.idGame = idGame
        self.idUser = idUser
        self.nCroquetas = nCroquetas
        self.lastday = lastday
        self.gameproducer = gameproducer