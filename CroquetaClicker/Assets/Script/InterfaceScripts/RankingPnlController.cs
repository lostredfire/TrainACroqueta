using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class RankingPnlController : MonoBehaviour
{
    
    public TMPro.TextMeshProUGUI txtPosition;
    public TMPro.TextMeshProUGUI txtUserName;
    public TMPro.TextMeshProUGUI txtQttyCroquetas;
    private int _position;
    private string _username;
    private long _qttyCroquetas;
    private bool _isMe;

    //public void loadData(int position, int idUser, string userName, long qttyCroquetas) {
    public void loadData(int position, RankingItem ri) {

        _position = position;
        _username = ri.username;
        _qttyCroquetas = ri.ncroquetas;
        _isMe = UserManager.instance.userSignedIn.idUser == ri.idUser;

        txtPosition.text = _position.ToString();
        txtUserName.text = _username;
        txtQttyCroquetas.text = _qttyCroquetas.ToString();

    }

}
