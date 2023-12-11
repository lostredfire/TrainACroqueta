using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoginPnlController : MonoBehaviour
{

    private bool _loginMode;

    public void Start() {
        _loginMode = true;
    }

    public void okClicked() {

        if (_loginMode) 
            requestLogin();
        else 
            requestSignup();

    }

    //TODO: metodo para mostrar/ocultar datos registro

    private void requestLogin() {
        
        UserManager.instance.loginUser(new User("silviarc", "silviarc"));

    }

    private void requestSignup() {

    }

}
