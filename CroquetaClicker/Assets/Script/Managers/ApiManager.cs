using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ApiManager
{
    
    private static ApiManager _instance;
    private API _api;

    private ApiManager() {
        if (_instance == null) {
            _instance = this; 
            _api = new API();
        } 
    }

    public void sendLogin(User u, API.msgReceivedCallback loginCallback) {

        _api.sendPostToApi("login", u.toJsonStr(User.UserToJsonModes.LOGIN_DATA), loginCallback);

    }

    public void sendSignup(User u, API.msgReceivedCallback signupCallback) {

        _api.sendPutToApi("signup", u.toJsonStr(User.UserToJsonModes.SIGNUP_DATA), signupCallback);

    }

    public void sendGetProducerList(API.msgReceivedCallback respCallback) {

        _api.sendGetToApi("getproducers", respCallback);

    }

    public void sendUpdateGameData(GameData gd, API.msgReceivedCallback respCallback) { //puede fallar porque no devuelve nada el put.

        _api.sendPutToApi("updategamedata", gd.toJsonStr(), respCallback);

    }

    public void sendGetGameData(User u, API.msgReceivedCallback respCallback) {

        _api.sendPostToApi("getgamedata", u.toJsonStr(User.UserToJsonModes.ID_USER), respCallback);

    }

    public void sendGetRanking(API.msgReceivedCallback respCallback) {

        _api.sendGetToApi("getranking", respCallback);

    }

    public static ApiManager instance {
        get {
            if (_instance == null)
                return new ApiManager();
            else
                return _instance;
        }
    }

}
