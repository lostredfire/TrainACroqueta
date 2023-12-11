using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UserManager
{
    private static UserManager _instance;
    private bool _isUserSignedIn;
    private User _userSignedIn;
    private UserManager() {

        if (_instance == null) {
            _instance = this; 
            _isUserSignedIn = false;
            _userSignedIn = null;
        } 

    }

    public void loginUser(User u) {

        ApiManager.instance.sendLogin(u, processLoginResult);

    }

    public void processLoginResult(string loginResultJson) {
        Debug.Log(loginResultJson);
        // if result ok -> setUserSignedIn
        // else show login wrong
    }

    public void setUserSignedIn(User u) {
        _isUserSignedIn = true;
        _userSignedIn = u;
    }

    public static UserManager instance {
        get {
            if (_instance == null)
                return new UserManager();
            else
                return _instance;
        }
    }

    public bool isUserSignedIn {
        get {
            return _isUserSignedIn;
        }
    }

    public User userSignedIn {
        get {
            return _userSignedIn;
        }
    }

}
