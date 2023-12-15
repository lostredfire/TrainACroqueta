using System;
using UnityEngine;

/// <summary>
/// class to parse GameProducer field of getgamedata request
/// </summary>
[Serializable]
public class GameProducer {

    public int idProd;
    public int quantity;
    public long qttyCroquetas;

    public GameProducer(int id, int qtty, long qttyCroq) {
        this.idProd = id;
        this.quantity = qtty;
        this.qttyCroquetas = qttyCroq;
    }

}
