using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class User {
    public int idUser;
    public string username;
    public string passwd;
    public string fullName;
    public string email;
    //public Image profileImg;

    public User(int idUser, string username, string passwd, string fullName, string email) {
        this.idUser = idUser;
        this.username = username;
        this.passwd = passwd;
        this.fullName = fullName;
        this.email = email;
        //this.profileImg = profileImg;
    }

    public User(string username, string passwd) {
        this.username = username;
        this.passwd = passwd;
    }

    public User(string jsonStr) {
        User aux = JsonUtility.FromJson<User>(jsonStr);
        idUser = aux.idUser;
        username = aux.username;
        passwd = aux.passwd;
        fullName = aux.fullName;
        email = aux.email;
    }

    public string toJsonStr(bool onlyLoginData) {

        string jsonstr = "{\n";
        jsonstr += "\"username\":\"" + username + "\",\n";
        jsonstr += "\"passwd\":\"" + passwd + "\"" + (onlyLoginData ? "\n": ",\n");
        if (!onlyLoginData) jsonstr += "\"fullname\":\"" + fullName + "\",\n";
        if (!onlyLoginData) jsonstr += "\"email\":\"" + email + "\",\n";
        jsonstr += "}";
        return jsonstr;

    }

}
