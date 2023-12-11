from flask import Flask, jsonify, request
import Controllers.ApiManager as ApiManager
from Models.Constants import ReturnCodes
import json

HOST = '192.168.1.22'
PORT = 1109
app = Flask(__name__)
#apiMngr = None

def init(mngr : ApiManager):
    """ 
    Inicialize managers API with connecton settings.
    """
    print("--------- API initializing...")
    app.apiMngr = mngr
    app.run(HOST,PORT,debug=True)


@app.route('/api')
def index():
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
        return 'Internal server error',500
    elif result == (ReturnCodes.NOT_USER):
        return 'Not user',404
    elif result == (ReturnCodes.WRONG_PSSWD):
        return 'Wrong password',406
    else:
        response = json.dumps(result)
        return response,202


@app.route('/api/signup', methods=['PUT'])
def createUser():
    """ 
    Sing up API request 
    """
    try:
        newuserDict = request.get_json()
    except:
        return 'Bad request, unsupported media type',415
    
    result = app.apiMngr.createUser(newuserDict)
    
    if result == (ReturnCodes.ERROR):
        return 'Internal server error',500
    elif result == (ReturnCodes.USER_EXISTS):
        return 'User already exists',404
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data',404
    else:
        response = json.dumps(result)
        return response,202  

@app.route('/api/newexercise' , methods=['PUT'])
def newExercise():
    """
    Create a new Exercise's instance and return the ID of the execice
    """
    try:
        newexerciseDict = request.get_json()
    except:
        return 'Bad request, unsupported media type',415
    
    result = app.apiMngr.createExercise(newexerciseDict)
    
    if result == (ReturnCodes.ERROR):
        return 'Internal server error',500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data',404
    else:
        response = json.dumps(result)
        return response,202

@app.route('/api/updateexercise' , methods=['PUT'])
def updateExercise():
    """
    Update Exercise's instance.
    """
    try:
        updtexerciseDict = request.get_json()
    except:
        return 'Bad request, unsupported media type',415
    
    result = app.apiMngr.updateExercise(updtexerciseDict)
    
    if result == (ReturnCodes.ERROR):
        return 'Internal server error',500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data',404
    elif result == (ReturnCodes.UPDATED_SUCCESS):
        return 'Updated successfully',202
    

@app.route('/api/finishexercise' , methods=['PUT'])
def finishExercise():
    """
    Finish Exercise's instance.
    """
    try:
        fnshexerciseDict = request.get_json()
    except:
        return 'Bad request, unsupported media type',415
    
    result = app.apiMngr.finishExercise(fnshexerciseDict)
    
    if result == (ReturnCodes.ERROR):
        return 'Internal server error',500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data',404
    elif result == (ReturnCodes.UPDATED_SUCCESS):
        return 'Updated successfully',202
    
@app.route('/api/getproducers' , methods=['GET'])
def getProducers():
    """
    Get the list of the Producers 
    """
    result = app.apiMngr.getProducers()
    if result == (ReturnCodes.ERROR):
        return 'Internal server error',500
    else: 
        response = json.dumps([prd.__dict__ for prd in result])
        return response,202

@app.route('/api/getgamedata' , methods=['GET'])
def getGamedata():
    """
    Get the info of the game
    """
    try:
        idgame = request.get_json()
    except:
        return 'Bad request, unsupported media type',415
    
    result = app.apiMngr.getGamedata(idgame)
    if result == (ReturnCodes.ERROR):
        return 'Internal server error',500
    else:
        response = json.dumps(result)
        return response,202

@app.route('/api/updategamedata' , methods=['PUT'])
def updateGamedata():
    """
    Update Game information.
    """
    try:
        savegamedata = request.get_json()
    except:
        return 'Bad request, unsupported media type',415
    
    result = app.apiMngr.updateGamedata(savegamedata)
    
    if result == (ReturnCodes.ERROR):
        return 'Internal server error',500
    elif result == (ReturnCodes.MISSING_DATA):
        return 'Missing data',404
    elif result == (ReturnCodes.UPDATED_SUCCESS):
        return 'Updated successfully',202

