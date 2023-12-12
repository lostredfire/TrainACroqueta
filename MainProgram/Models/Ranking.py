class Ranking():
    """ Ranking class to manage users information """

    username = ""
    ncroquetas = ""

    def __init__(self, username: str , ncroquetas: str):
        """ Constructor with username and ncroquetas """
        self.username = username
        self.ncroquetas = ncroquetas
