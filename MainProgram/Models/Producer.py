
class Producer():
    """ Exercise class to manage producer information """

    idProd = None
    prodName = None
    prodQuantity = None
    imgHex = None
    description = None
    price = None

    def __init__(self, idProd : int, prodName : str, prodQuantity : int, img : bytes, description : str, price : int ):
        """ Constructor with idProd, prodName, prodQuantity, img, description and price """
        self.idProd = idProd
        self.prodName = prodName
        self.prodQuantity = prodQuantity
        self.imgHex = img.hex()
        self.description = description
        self.price = price 

