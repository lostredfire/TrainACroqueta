
class User():
    """ User class to manage users information """

    idUser = None
    username = ""
    passwd = ""
    fullName = ""
    email = ""
    profileImg = None

    def __init__(self,iduser: int = None, username: str = None, pw: str = None, fullname : str = None, email : str = None, profileImg = None):
        """ Constructor with idUser, username, password, fullname, email and profileImg """
        self.idUser = iduser
        self.username = username
        self.passwd = pw
        self.fullName = fullname
        self.email = email
        self.profileImg = profileImg

    