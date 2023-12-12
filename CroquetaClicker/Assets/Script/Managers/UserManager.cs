using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UserManager
{
    private static UserManager _instance;
    private bool _isUserSignedIn;
    private User _userSignedIn;
    public delegate void showLoginResult(int respCode);
    private showLoginResult showResCallback;

    private UserManager() {

        if (_instance == null) {
            _instance = this; 
            _isUserSignedIn = false;
            _userSignedIn = null;
        } 

    }

    public void loginUser(User u, showLoginResult showResultCallback) {

        this.showResCallback = showResultCallback;
        ApiManager.instance.sendLogin(u, processLoginResult);

    }

    public void processLoginResult(int respCode, string loginResultJson) {

        User u = null;
        if (respCode == 200) {
            u = new User(loginResultJson);
        } 
        setUserSignedIn(u);
        this.showResCallback(respCode);

    }

    public void setUserSignedIn(User u) {
        _isUserSignedIn = true;
        _userSignedIn = u;
        MainMenuManager.instance.notifyUserLogged(u);
    }

    public void logout() {
        _isUserSignedIn = false;
        _userSignedIn = null;
        MainMenuManager.instance.notifyUserLogged(null);
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
