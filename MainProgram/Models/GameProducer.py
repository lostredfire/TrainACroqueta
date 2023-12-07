class GameProducer():
    """ Exercise class to manage producer information """

    idProd = None
    idGame = None
    quantity = None

    def __init__(self, idGame : int = None, idProd : int = None, quantity : int = None):
        """ Constructor with idProd, idProd and quantity """
        self.idGame = idGame
        self.idProd = idProd
        self.quantity = quantity
       