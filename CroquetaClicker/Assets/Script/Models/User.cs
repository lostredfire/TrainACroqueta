using System.Collections;
using System.Collections.Generic;


public class User 
{
    public int _idUser;
    public string _username;
    public string _passwd;
    public string _fullName;
    public string _email;
    //public Image profileImg;

    public User(int idUser, string username, string passwd, string fullName, string email){
        _idUser = idUser;
        _username = username;
        _passwd = passwd;
        _fullName = fullName;
        _email = email;
        //profileImg = other.profileImg;
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
