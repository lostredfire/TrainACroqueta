
class Ranking():
    """ Ranking class to manage users information """

    username = ""
    ncroquetas = ""
    idUser = None

    def __init__(self,idUser: int , username: str , ncroquetas: str):
        """ Constructor with username and ncroquetas """
        self.idUser = idUser
        self.username = username
        self.ncroquetas = ncroquetas
        