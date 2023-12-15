from flask import Flask, jsonify, request
import Controllers.ApiManager as ApiManager
from Models.Constants import ReturnCodes
import json

HOST = '192.168.1.22'
PORT = 1109
app = Flask(__name__)

def init(mngr : ApiManager):
    """ 
    Inicialize managers API with connecton settings.
    """
    print("--------- API initializing...")
    app.apiMngr = mngr
    #app.run(HOST,PORT,debug=True, ssl_context=('cert.pem','key.pem'))
    app.run(HOST,PORT,debug=True)

@app.route('/api')
def indexapi():
    """ 
    Index API page
    """
    return "This is the Train A Croqueta's API home"


@app.route('/api/login', methods=['POST'])
def login():
    """ 
    Login API request and return the username and the password
    """
    try:
        userDict = request.get_json()
    except:
        return 'Bad request, unsupported media type',415
    
    result = app.apiMngr.login(userDict)
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    elif result == (ReturnCodes.NOT_USER):
        return 'Not user', 404
    elif result == (ReturnCodes.WRONG_PSSWD):
        return 'Wrong password', 406
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data', 404
    else:
        return json.dumps(result), 200

@app.route('/api/signup', methods=['PUT'])
def createUser():
    """ 
    Sing up API request 
    """
    try:
        newUserDict = request.get_json()
    except:
        return 'Bad request, unsupported media type', 415
    
    result = app.apiMngr.createUser(newUserDict)
    
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    elif result == (ReturnCodes.USER_EXISTS):
        return 'User already exists', 404
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data', 404
    else:
        return json.dumps(result), 200  

@app.route('/api/newexercise' , methods=['PUT'])
def newExercise():
    """
    Create a new Exercise's instance and return the ID of the execice
    """
    try:
        newExerciseDict = request.get_json()
    except:
        return 'Bad request, unsupported media type', 415
    
    result = app.apiMngr.createExercise(newExerciseDict)
    
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data', 404
    else:
        return json.dumps(result), 200

@app.route('/api/updateexercise' , methods=['PUT'])
def updateExercise():
    """
    Update Exercise's instance.
    """
    try:
        updtExerciseDict = request.get_json()
    except:
        return 'Bad request, unsupported media type', 415
    
    result = app.apiMngr.updateExercise(updtExerciseDict)
    
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data', 404
    elif result == (ReturnCodes.UPDATED_SUCCESS):
        return 'Updated successfully', 200
    

@app.route('/api/finishexercise' , methods=['PUT'])
def finishExercise():
    """
    Finish Exercise's instance.
    """
    try:
        fnshExerciseDict = request.get_json()
    except:
        return 'Bad request, unsupported media type', 415
    
    result = app.apiMngr.finishExercise(fnshExerciseDict)
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data', 404
    elif result == (ReturnCodes.UPDATED_SUCCESS):
        return 'Updated successfully', 200
    
@app.route('/api/getproducers' , methods=['GET'])
def getProducers():
    """
    Get the list of the Producers 
    """
    result = app.apiMngr.getProducers()
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    else: 
        return json.dumps([prd.__dict__ for prd in result]), 200

@app.route('/api/getgamedata' , methods=['POST'])
def getGamedata():
    """
    Get the info of the game
    """
    try:
        idUser = request.get_json()
    except:
        return 'Bad request, unsupported media type',415
    
    result = app.apiMngr.getGamedata(idUser)
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data', 404
    else:
        return json.dumps(result), 200

@app.route('/api/updategamedata' , methods=['PUT'])
def updateGamedata():
    """
    Update Game information.
    """
    try:
        saveGameData = request.get_json()
    except:
        return 'Bad request, unsupported media type', 415
    
    result = app.apiMngr.updateGamedata(saveGameData)
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data', 404
    elif result == (ReturnCodes.UPDATED_SUCCESS):
        return 'Updated successfully', 200

@app.route('/api/getranking' , methods=['GET'])
def getRanking():
    """
    Get the list of the Producers 
    """
    result = app.apiMngr.getRanking()
    if result == (ReturnCodes.ERROR):
        return 'Internal server error', 500
    else: 
        return json.dumps([rnk.__dict__ for rnk in result]), 200
    
    