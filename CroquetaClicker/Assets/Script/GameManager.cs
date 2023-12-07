using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    
    //gameObjects
    public TMPro.TextMeshProUGUI nCroquetasTextComponent;
    public TMPro.TextMeshProUGUI nCroquetasPerSecondTextComponent;
    public TMPro.TextMeshProUGUI tituloMenu;
    public GameObject contentTiendaGO;
    public GameObject panelProducerPrefabGO;
    public GameObject panelStoreGO;
    public GameObject panelEstadisticasGO;
    public GameObject panelLogrosGO;
    public GameObject panelListaProductoresGO;
    public GameObject panelListaBonusGO;
    public GameObject panelBSQttyGO;
    public GameObject panelSettingsPrefabGO;
    public RectTransform panelMainRT;

    //other objects and variables
    public CursorsPanelController cursorsPanelController;
    public Animator croquetaAnimator;
    private ProducerManager _producerManager;
    private ProducerPanelController[] _producersPanelsControllers;
    private GameObject pnlSettingsGO;
    private int _nMilisSinceLastUpdate;
    private long _nTotalCroquetas;
    private bool _buyingMode = true;
    private int _qttyBuySell = 1;
    private bool _continueUpdating = false;

    void Awake() {

        DontDestroyOnLoad(gameObject); //falla porque cuando se destruye la escena, otros elementos tambien se destruyen y este game manager sigue intentando acceder a ellos.

    }

    void Start() {

        _producerManager = new ProducerManager();
        _nMilisSinceLastUpdate = 0;
        _nTotalCroquetas = 0;
        _producersPanelsControllers = new ProducerPanelController[GameGlobals.PRODUCER_TYPES.Length];

        for (int i = 0; i < GameGlobals.PRODUCER_TYPES.Length; i++) {
            GameObject producerPanel = Instantiate(panelProducerPrefabGO, contentTiendaGO.transform);
            producerPanel.GetComponent<RectTransform>().localPosition = new Vector3(0, (-120 * i) - 60, 0);
            _producersPanelsControllers[i] = producerPanel.GetComponent<ProducerPanelController>();
            _producersPanelsControllers[i].setProducer(GameGlobals.PRODUCER_TYPES[i], i, this);
            _producersPanelsControllers[i].setProducerPrice(_producerManager.calculateProducerPrice(i));
        }

        _continueUpdating = true;

    }

    void FixedUpdate() {

        if (!_continueUpdating) {
            return;
        }

        if (_nMilisSinceLastUpdate >= GameGlobals.UPDATE_TEXTS_EVERY_N_MILISECONDS) {
            _nMilisSinceLastUpdate = 0;
            updateUIElements();
        } else {
            _nMilisSinceLastUpdate += (int) (Time.fixedDeltaTime * 1000);
        }

    }

    public void changeBuySellQtty(int qtty) {

        _qttyBuySell = qtty;

        if (_qttyBuySell != -1) {
            for (int i = 0; i < GameGlobals.PRODUCER_TYPES.Length; i++) {
                _producersPanelsControllers[i].setBuySellQtty(_qttyBuySell);
            }
        }

        _nMilisSinceLastUpdate = 0;
        updateUIElements();
    
    }

    private void updateStorePanelBuySell() {

        if (_buyingMode) { // buying mode
            if (_qttyBuySell == -1) { // buying mode max
                for (int i = 0; i < GameGlobals.PRODUCER_TYPES.Length; i++) {
                    int aux = _producerManager.calculateMaxProducersToBuy(i, _nTotalCroquetas);
                    _producersPanelsControllers[i].setCanBuySell(aux > 0);
                    _producersPanelsControllers[i].setBuySellQtty(aux);
                }
            } else { // buying mode not max
                for (int i = 0; i < GameGlobals.PRODUCER_TYPES.Length; i++) {
                    _producersPanelsControllers[i].setCanBuySell(_producerManager.calculateMaxProducersToBuy(i, _nTotalCroquetas) >= _qttyBuySell);
                }
            }
        } else { // selling mode
            if (_qttyBuySell == -1) { // selling mode max
                for (int i = 0; i < GameGlobals.PRODUCER_TYPES.Length; i++) {
                    int aux = _producerManager.calculateMaxProducersToSell(i);
                    _producersPanelsControllers[i].setCanBuySell(aux > 0);
                    _producersPanelsControllers[i].setBuySellQtty(aux);
                }
            } else { // selling mode not max
                for (int i = 0; i < GameGlobals.PRODUCER_TYPES.Length; i++) {
                    _producersPanelsControllers[i].setCanBuySell(_producerManager.calculateMaxProducersToSell(i) >= _qttyBuySell);
                }
            }
        } 

    }

    private void updateInfoPanel() {

        _nTotalCroquetas += _producerManager.caculateProduced();
        nCroquetasTextComponent.text = _nTotalCroquetas.ToString() + " Croquetas";
        nCroquetasPerSecondTextComponent.text = _producerManager.calculateProduction().ToString() + " CPS";

    }

    private void updateUIElements() {

        updateInfoPanel();
        updateStorePanelBuySell();

    }

    /// <summary>
    /// Buy or sell the producer kind corresponding to the given index. Buy or sell is decided by the mode previously selected.
    /// </summary>
    /// <param name="producerIndex">The index of the producer kind to buy or sell. </param>
    public void buySellProducer(int producerIndex) {

        if (_buyingMode) {
            buyProducer(producerIndex);
        } else {
            sellProducer(producerIndex);
        }

    }

    /// <summary>
    /// Updates the producer panel with the info of the producer qtty and the producer price.
    /// </summary>
    /// <param name="producerIndex"></param>
    public void updateProducerPnlInfo(int producerIndex) {

        _producersPanelsControllers[producerIndex].setProducerQtty(_producerManager.ProducerList[producerIndex].producerTS.nProducers);
        _producersPanelsControllers[producerIndex].setProducerPrice(_producerManager.calculateProducerPrice(producerIndex)); 
    
    }

    /// <summary>
    /// Sells n producers of the producer kind corresponding to the given index
    /// </summary>
    /// <param name="producerIndex"> The index of the producer kind to sell. </param>
    public void sellProducer(int producerIndex) {

        if (_qttyBuySell == -1) {
            _nTotalCroquetas = _nTotalCroquetas + _producerManager.sellProducer(producerIndex, _producerManager.calculateMaxProducersToSell(producerIndex));
        } else {
            _nTotalCroquetas = _nTotalCroquetas + _producerManager.sellProducer(producerIndex, _qttyBuySell);
        }

        updateProducerPnlInfo(producerIndex);

        //TODO: if producerIndex == 1 -> eliminar cursor alrededor de croqueta.

    }

    /// <summary>
    /// Buys n producers of the producer kind corresponding to the given index.
    /// </summary>
    /// <param name="producerIndex"> The index of the producer kind to buy. </param>
    public void buyProducer(int producerIndex) {

        if (_qttyBuySell == -1) {
            _nTotalCroquetas = _producerManager.buyProducer(producerIndex, _nTotalCroquetas, _producerManager.calculateMaxProducersToBuy(producerIndex, _nTotalCroquetas));
        } else {
            _nTotalCroquetas = _producerManager.buyProducer(producerIndex, _nTotalCroquetas, _qttyBuySell);
        }
        
        updateProducerPnlInfo(producerIndex);

        if (producerIndex == 0) {
            cursorsPanelController.addCursor();
        }

    }

    public void croquetaClickEvent() {

        croquetaAnimator.Play("CroquetaClickAnim");
        SoundManager.instance.PlaySFX();
        _nTotalCroquetas += _producerManager.producePuntual(0);
        updateInfoPanel();

    }

    public void openProducerList() {

        panelListaBonusGO.SetActive(false);
        panelListaProductoresGO.SetActive(true);
        panelBSQttyGO.SetActive(true);
        tituloMenu.text = "Tienda / Productores";

    }

    public void openBonusList() {

        panelListaProductoresGO.SetActive(false);
        panelListaBonusGO.SetActive(true);
        panelBSQttyGO.SetActive(false);
        tituloMenu.text = "Tienda / Bonus";

    }

    public void hideAllMenus() {

        panelStoreGO.SetActive(false);
        panelEstadisticasGO.SetActive(false);
        panelLogrosGO.SetActive(false);
        panelMainRT.offsetMin = new Vector2(300, panelMainRT.offsetMin.y);
        if (pnlSettingsGO != null) {
            Debug.Log("hiding settings menu");
            pnlSettingsGO.GetComponent<SettingsManager>().revertChanges();
        }

    }

    public void hideShowStore() {

        hideAllMenus();

        if (!panelStoreGO.activeSelf) {
            panelStoreGO.SetActive(true);
            panelMainRT.offsetMin = new Vector2(980, panelMainRT.offsetMin.y);
        } 

    }

    public void hideShowEstadisticas() {

        hideAllMenus();

        if (!panelEstadisticasGO.activeSelf) {
            panelEstadisticasGO.SetActive(true);
            panelMainRT.offsetMin = new Vector2(980, panelMainRT.offsetMin.y);
        } 

    }

    public void hideShowLogros() {
        
        hideAllMenus();

        if (!panelLogrosGO.activeSelf) {           
            panelLogrosGO.SetActive(true);
            panelMainRT.offsetMin = new Vector2(980, panelMainRT.offsetMin.y);
        }

    }

    public void hideShowSettings() {

        if (pnlSettingsGO == null) {
            hideAllMenus();
            pnlSettingsGO = Instantiate(panelSettingsPrefabGO, panelMainRT);
        } else {
            pnlSettingsGO.GetComponent<SettingsManager>().revertChanges();
        }

    }

    public void loadScene(string sceneName) {

        _continueUpdating = false;
        UnityEngine.SceneManagement.SceneManager.LoadScene(sceneName);

    }

    public bool buyingMode {
        get {
            return _buyingMode;
        }
        set {
            _buyingMode = value;
            changeBuySellQtty(_qttyBuySell);
        }
    }

}
