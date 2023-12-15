using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class User {

    public enum UserToJsonModes {
        LOGIN_DATA,
        SIGNUP_DATA,
        ID_USER

    }

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

    public User(string username, string passwd, string fullName, string email) {
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

    public string toJsonStr(UserToJsonModes mode) {

        string jsonstr = "{\n";
        if (mode == UserToJsonModes.ID_USER) jsonstr += "\"idUser\":\"" + idUser + "\"";
        if (mode == UserToJsonModes.LOGIN_DATA || mode == UserToJsonModes.SIGNUP_DATA) jsonstr += "\"username\":\"" + username + "\",\n";
        if (mode == UserToJsonModes.LOGIN_DATA || mode == UserToJsonModes.SIGNUP_DATA) jsonstr += "\"passwd\":\"" + passwd + "\"" + (mode == UserToJsonModes.LOGIN_DATA ? "\n": ",\n");
        if (mode == UserToJsonModes.SIGNUP_DATA) jsonstr += "\"fullname\":\"" + fullName + "\",\n";
        if (mode == UserToJsonModes.SIGNUP_DATA) jsonstr += "\"email\":\"" + email + "\"\n";
        jsonstr += "}";
        return jsonstr;

    }

}
