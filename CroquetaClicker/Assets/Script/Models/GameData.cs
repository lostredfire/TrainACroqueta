using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// class to parse json of getgamedata request.
/// </summary>
[Serializable]
public class GameData {
    
    public int idGame;
    public int nCroquetas;
    public long lastday;
    public GameProducer[] gameproducers;

    public GameData() {

    }

    /// <summary>
    /// If there are no saved data, the values returned by the api are not coherent, so this method makes them coherent.
    /// </summary>
    public void normalize() {
        if (lastday == 0) 
            lastday = DateTimeOffset.Now.ToUnixTimeSeconds();
        if (gameproducers == null) {
            gameproducers = new GameProducer[0];
        }
    }

    public string toJsonStr() {
        
        string jsonStr = "{\n";
        jsonStr += "\"idGame\":\"" + idGame + "\",\n";
        jsonStr += "\"nCroquetas\":\"" + nCroquetas + "\",\n";
        jsonStr += "\"lastday\":\"" + lastday + "\",\n";
        jsonStr += "\"gameproducers\":[\n";
        for (int i = 0; i < gameproducers.Length; i++) {
            jsonStr += "{\n";
            jsonStr += "\"idGame\":\"" + idGame + "\",\n";
            jsonStr += "\"idProd\":\"" + gameproducers[i].idProd + "\",\n";
            jsonStr += "\"quantity\":\"" + gameproducers[i].quantity + "\",\n";
            jsonStr += "\"qttyCroquetas\":\"" + gameproducers[i].qttyCroquetas + "\"\n";
            jsonStr += (i == gameproducers.Length - 1 ? "}\n" : "},\n");
        }
        jsonStr += "]\n";
        jsonStr += "}\n";

        return jsonStr;

    }

}
