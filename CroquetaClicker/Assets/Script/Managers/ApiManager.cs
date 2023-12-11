using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ApiManager
{
    
    private static ApiManager _instance;
    private API _api;
    //public delegate void msgReceivedCallback(string jsonStr);

    private ApiManager() {
        if (_instance == null) {
            _instance = this; 
            _api = new API();
        } 
    }

    public void sendLogin(User u, API.msgReceivedCallback loginCallback) {

//        IEnumerator corutine = _api.sendPostToApi("login", u.toJsonStr(true), loginCallback);
//        StartCoroutine(corutine);
        _api.sendPostToApi("login", u.toJsonStr(true), loginCallback);

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
