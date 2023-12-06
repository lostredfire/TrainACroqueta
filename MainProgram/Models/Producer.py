class Producer():
    """ Exercise class to manage producer information """

    idProd = None
    prodName = None
    prodQuantity = None
    img = None
    description = None
    price = None

    def __init__(self, idProd : int, prodName : str, prodQuantity : int, img, description : str, price : int ):
        """ Constructor with idProd, prodName, prodQuantity, img, description and price """
        self.idProd = idProd
        self.prodName = prodName
        self.prodQuantity = prodQuantity
        self.img = img
        self.description = description
        self.price = price 