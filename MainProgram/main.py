#!/usr/bin/python3

from Controllers.ApiManager import ApiManager
from Controllers.ExerciseManager import ExerciseManager
from Controllers.GameManager import GameManager
from Controllers.RankingManager import RankingManager
from Controllers.RewardsManager import RewardsManager
from Controllers.UserManager import UserManager
from Controllers.DBManager import DBManager
from Controllers.ProducerManager import ProducerManager

def main():
    """ 
    Main initializes managers for all use cases.
    """
    print("--------- Main starts working")

    # Initialize the managers
    dbMngr = DBManager()
    usrMngr = UserManager(dbMngr)
    exMngr = ExerciseManager(dbMngr)
    prdMngr = ProducerManager(dbMngr)
    gameMngr = GameManager(dbMngr,prdMngr)
    rewMngr = RewardsManager()
    rankMngr = RankingManager()
    apiMngr = ApiManager(usrMngr,exMngr,prdMngr,gameMngr)
    
if __name__ == "__main__":
    main()  

