using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LoginPnlController : MonoBehaviour
{

    private bool _loginMode;
    public GameObject registerPnl;
    public TMPro.TMP_InputField txtUsername;
    public TMPro.TMP_InputField txtPasswd;
    public TMPro.TMP_InputField txtFullName;
    public TMPro.TMP_InputField txtEmail;
    public TMPro.TextMeshProUGUI txtError;
    public GameObject errorPnl;

    public void Start() {
        _loginMode = true;
        registerPnl.SetActive(!_loginMode);
    }

    public void okClicked() {

        if (_loginMode) 
            requestLogin();
        else 
            requestSignup();

    }

    public void registerClicked() {

        _loginMode = !_loginMode;
        registerPnl.SetActive(!_loginMode);

    }

    public void closeLoginPnl() {
        MainMenuManager.instance.toogleImgTitle();
        Destroy(gameObject);
    }

    public void cancelClicked() {
        closeLoginPnl();
    }

    public void closeErrorPnl() {
        errorPnl.SetActive(false);
    }

    private void requestLogin() {
        
        Debug.Log(txtUsername.text);
        Debug.Log(txtPasswd.text);
        UserManager.instance.loginUser(new User(txtUsername.text, txtPasswd.text), showLoginResult);

    }

    public void showLoginResult(int loginResult) {

        if (loginResult == 200) {
            closeLoginPnl();
        } else if (loginResult == 404) {
            txtError.text = "Error: Usuario no encontrado";
            errorPnl.SetActive(true);
        } else if (loginResult == 406) {
            txtError.text = "Error: Contraseña incorrecta";
            errorPnl.SetActive(true);
        }

    } 

    private void requestSignup() {



    }

}
