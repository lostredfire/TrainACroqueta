using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UserManager : MonoBehaviour
{
    private static UserManager instance;
    private bool _isUserSignedIn;
    private User _userSignedIn;
    void Awake()
    {
        if (instance == null) {
            instance = this; 
            _isUserSignedIn = false;
            _userSignedIn = null;
            DontDestroyOnLoad(this.gameObject);
        } else {
            Destroy(this.gameObject);
        }

    }

    public void signIn() {
        _isUserSignedIn = true;
        //TODO
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
