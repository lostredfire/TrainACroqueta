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

        MainMenuManager.instance.toogleLoadingAnim();
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
        
        if (txtUsername.text == "" || txtPasswd.text == "") {
            showLoginResult(412);
        } else {
            UserManager.instance.loginUser(new User(txtUsername.text, txtPasswd.text), showLoginResult);
        }

    }

    public void showLoginResult(int loginResult) {

        MainMenuManager.instance.toogleLoadingAnim();
        if (loginResult == 200) {
            closeLoginPnl();
        } else if (loginResult == 404) {
            txtError.text = "Error: Usuario no encontrado.";
            errorPnl.SetActive(true);
        } else if (loginResult == 406) {
            txtError.text = "Error: Contraseña incorrecta.";
            errorPnl.SetActive(true);
        } else if (loginResult == 412) {
            txtError.text = "Es necesario rellenar todos los campos.";
            errorPnl.SetActive(true);
        } else if (loginResult == 500) {
            txtError.text = "Error: Fallo interno del servidor.";
            errorPnl.SetActive(true);
        }

    } 

    private void requestSignup() {

        if (txtUsername.text == "" || txtPasswd.text == "" || txtFullName.text == "" || txtEmail.text == "") {
            showSignupResult(412);
        } else {
            UserManager.instance.signupUser(new User(txtUsername.text, txtPasswd.text, txtFullName.text, txtEmail.text), showSignupResult);
        }

    }

    public void showSignupResult(int signupResult) {

        MainMenuManager.instance.toogleLoadingAnim();
        if (signupResult == 200) {
            closeLoginPnl();
        } else if (signupResult == 404) {
            txtError.text = "Error: ya existe un usuario con este nombre de usuario.";
            errorPnl.SetActive(true);
        } else if (signupResult == 412) {
            txtError.text = "Es necesario rellenar todos los campos.";
            errorPnl.SetActive(true);
        } else if (signupResult == 500) {
            txtError.text = "Error: Fallo interno del servidor.";
        }

    }

}
