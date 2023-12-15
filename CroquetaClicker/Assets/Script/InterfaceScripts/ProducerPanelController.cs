using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ProducerPanelController : MonoBehaviour {

    public Image imgProducerComponent;
    public TMPro.TextMeshProUGUI txtProducerNameComponent;
    public TMPro.TextMeshProUGUI txtProducerDescriptionComponent;
    public TMPro.TextMeshProUGUI txtProducerQttyComponent;
    public TMPro.TextMeshProUGUI txtProducerPriceComponent;
    public TMPro.TextMeshProUGUI txtBuyQttyComponent;
    public Button btnBuyComponent;
    
    private Producer _producer;
    private int _producerIndex;
    private GameManager _gameManager;

    public void setProducer(Producer producer, int producerIndex, GameManager gameManager) {

        _producer = producer;
        _producerIndex = producerIndex;
        _gameManager = gameManager;
        imgProducerComponent.sprite = producer.icon;
        txtProducerNameComponent.text = producer.prodName;
        txtProducerDescriptionComponent.text = producer.description;
        txtProducerQttyComponent.text = "0";
        txtProducerPriceComponent.text = producer.price.ToString();
        txtBuyQttyComponent.text = "1";

    }

    public void setProducerQtty(int qtty) {

        txtProducerQttyComponent.text = qtty.ToString();

    }

    public void setProducerPrice(double price) {

        txtProducerPriceComponent.text = price.ToString();

    }

    public void setBuySellQtty(int qtty) {

        if (_gameManager.buyingMode) {
            txtBuyQttyComponent.text = "+" + qtty.ToString();
        } else {
            txtBuyQttyComponent.text = "-" + qtty.ToString();
        }

    }

    public void buyBtnClick() {
        
        _gameManager.buySellProducer(_producerIndex);
        SoundManager.instance.PlaySFX();

    }

    public void setCanBuySell(bool canBuy) {

        if (canBuy) {
            txtBuyQttyComponent.color = Color.green;
        } else {
            txtBuyQttyComponent.color = Color.red;
        }
        btnBuyComponent.enabled = canBuy;

    }

}
