using System.Collections;
using System.Collections.Generic;


public class User {
    private int _idUser;
    private string _username;
    private string _passwd;
    private string _fullName;
    private string _email;
    //public Image profileImg;

    public User(int idUser, string username, string passwd, string fullName, string email) {
        _idUser = idUser;
        _username = username;
        _passwd = passwd;
        _fullName = fullName;
        _email = email;
        //profileImg = other.profileImg;
    }

    public User(string username, string passwd) {
        _username = username;
        _passwd = passwd;
    }

    public User(string jsonStr) {
        
    }

    public string toJsonStr(bool onlyLoginData) {

        string jsonstr = "{";
        //if (!onlyLoginData) jsonstr += "\"idUser\":\"" + _idUser + "\",\n"; 
        jsonstr += "\"username\":\"" + _username + "\",\n";
        jsonstr += "\"passwd\":\"" + _passwd + "\"" + (onlyLoginData ? "\n": ",\n");
        if (!onlyLoginData) jsonstr += "\"fullname\":\"" + _fullName + "\",\n";
        if (!onlyLoginData) jsonstr += "\"email\":\"" + _email + "\",\n";
        jsonstr += "}";
        return jsonstr;

    }

    public int idUser {
        get {
            return _idUser;
        }
    }

    public string username {
        get {
            return _username;
        }
    }

    public string fullName {
        get {
            return _fullName;
        }
    }

    public string email {
        get {
            return _email;
        }
    }

}
