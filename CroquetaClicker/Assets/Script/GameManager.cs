using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    
    //gameObjects
    public TMPro.TextMeshProUGUI nCroquetasTextComponent;
    public TMPro.TextMeshProUGUI nCroquetasPerSecondTextComponent;
    public TMPro.TextMeshProUGUI tituloMenuStore;
    public TMPro.TextMeshProUGUI tituloMenuInfo;
    public GameObject contentTiendaGO;
    public GameObject contentRankingGO;
    public GameObject panelProducerPrefabGO;
    public GameObject panelStoreGO;
    public GameObject panelEstadisticasGO;
    public GameObject panelRankingGO;
    public GameObject panelListaProductoresGO;
    public GameObject panelListaBonusGO;
    public GameObject panelBSQttyGO;
    public GameObject panelSettingsPrefabGO;
    public GameObject panelUserRankingPrefabGO;
    public Button btnBuyMode;
    public Button btnSellMode;
    public Button btnBS1;
    public Button btnBS10;
    public Button btnBS100;
    public Button btnBSmax;
    public RectTransform panelMainRT;
    private GameObject pnlSettingsGO;
    private GameObject _loadingPnl;

    //other objects and variables
    public CursorsPanelController cursorsPanelController;
    public Animator croquetaAnimator;
    private ProducerManager _producerManager;
    private ProducerPanelController[] _producersPanelsControllers;
    private RankingPnlController[] _rankingPanelsControllers;
    private int _nMilisSinceLastUpdate;
    private int _nMilisSinceLastSave;
    private long _nTotalCroquetas = 0;
    private bool _buyingMode = true;
    private int _qttyBuySell = 1;
    private bool _continueUpdating = false;

    void Awake() {

        DontDestroyOnLoad(gameObject);

    }

    void Start() {

        _loadingPnl = Instantiate(GameGlobals.PANEL_LOADING_PREFAB_GO, null);
        
        _producerManager = new ProducerManager(notifyProdMngrInitializated);

        _nMilisSinceLastUpdate = 0;
        _continueUpdating = false;

    }

    /// <summary>
    /// Crea los gameObjects que representan a los productores en la tienda, guarda las referencias de sus controladores y 
    /// actualiza los elementos de la interfaz con los datos de la partida cargada.
    /// </summary>
    public void notifyProdMngrInitializated() {

        if (_producerManager.isInitializated && !_producerManager.isErrorOcurred) {
            _producersPanelsControllers = new ProducerPanelController[_producerManager.getProducerTypesCount()];

            for (int i = 0; i < _producersPanelsControllers.Length; i++) {
                GameObject producerPanel = Instantiate(panelProducerPrefabGO, contentTiendaGO.transform);
                producerPanel.GetComponent<RectTransform>().localPosition = new Vector3(340, (-120 * i) - 60, 0);
                _producersPanelsControllers[i] = producerPanel.GetComponent<ProducerPanelController>();
                _producersPanelsControllers[i].setProducer(_producerManager.ProducerList[i], i, this);
                _producersPanelsControllers[i].setProducerPrice(_producerManager.calculateProducerPrice(i));
            }
            
            updateUIElements();
            _qttyBuySell = 1;
            buyingMode = true;
            _loadingPnl.SetActive(false);
            _continueUpdating = true;
            
        } else {
            //TODO: exit to main menu
        }

    }

    void FixedUpdate() {

        if (!_continueUpdating) {
            return;
        }

        int aux = (int) (Time.fixedDeltaTime * 1000);
        if (_nMilisSinceLastUpdate >= GameGlobals.UPDATE_TEXTS_EVERY_N_MILISECONDS) {
            _nMilisSinceLastUpdate = 0;
            updateUIElements();
        } else {
            _nMilisSinceLastUpdate += aux;
        }

        if (_nMilisSinceLastSave >= GameGlobals.SAVE_EVERY_N_MILIS) {
            _nMilisSinceLastSave = 0;
            _producerManager.saveGameData();
        } else {
            _nMilisSinceLastSave += aux;
        }

    }

    private void activateAllBSBtns() {
        btnBuyMode.interactable = true;
        btnSellMode.interactable = true;
        btnBS1.interactable = true;
        btnBS10.interactable = true;
        btnBS100.interactable = true;
        btnBSmax.interactable = true;
    }

    private void showCurrentBuySellQttyMode() {

        activateAllBSBtns();

        if (_buyingMode) 
            btnBuyMode.interactable = false;
        else 
            btnSellMode.interactable = false;

        if (_qttyBuySell == 1)
            btnBS1.interactable = false;
        else if (_qttyBuySell == 10)
            btnBS10.interactable = false;
        else if (_qttyBuySell == 100)
            btnBS100.interactable = false;
        else 
            btnBSmax.interactable = false;

    }

    public void changeBuySellQtty(int qtty) {

        _qttyBuySell = qtty;

        if (_qttyBuySell != -1) {
            for (int i = 0; i < _producerManager.ProducerList.Length; i++) {
                _producersPanelsControllers[i].setBuySellQtty(_qttyBuySell);
                if (buyingMode) _producersPanelsControllers[i].setProducerPrice(_producerManager.calculateProducerPrice(i, qtty));
                else _producersPanelsControllers[i].setProducerPrice(_producerManager.calculateProducerSellPrice(i, qtty));
            }
        }

        showCurrentBuySellQttyMode();

        _nMilisSinceLastUpdate = 0;
        updateUIElements();
    
    }

    private void updateStorePanelBuySell() {

        if (_buyingMode) { // buying mode
            if (_qttyBuySell == -1) { // buying mode max
                for (int i = 0; i < _producerManager.ProducerList.Length; i++) {
                    int aux = _producerManager.calculateMaxProducersToBuy(i, _nTotalCroquetas);
                    _producersPanelsControllers[i].setCanBuySell(aux > 0);
                    _producersPanelsControllers[i].setBuySellQtty(aux);
                    _producersPanelsControllers[i].setProducerPrice(_producerManager.calculateProducerPrice(i, aux));
                }
            } else { // buying mode not max
                for (int i = 0; i < _producerManager.ProducerList.Length; i++) {
                    _producersPanelsControllers[i].setCanBuySell(_producerManager.calculateMaxProducersToBuy(i, _nTotalCroquetas) >= _qttyBuySell);
                }
            }
        } else { // selling mode
            if (_qttyBuySell == -1) { // selling mode max
                for (int i = 0; i < _producerManager.ProducerList.Length; i++) {
                    int aux = _producerManager.calculateMaxProducersToSell(i);
                    _producersPanelsControllers[i].setCanBuySell(aux > 0);
                    _producersPanelsControllers[i].setBuySellQtty(aux);
                    _producersPanelsControllers[i].setProducerPrice(_producerManager.calculateProducerSellPrice(i, aux));
                }
            } else { // selling mode not max
                for (int i = 0; i < _producerManager.ProducerList.Length; i++) {
                    _producersPanelsControllers[i].setCanBuySell(_producerManager.calculateMaxProducersToSell(i) >= _qttyBuySell);
                }
            }
        } 

    }

    private void updateInfoPanel() {

        _nTotalCroquetas += _producerManager.calculateProduced();
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
        _producersPanelsControllers[producerIndex].setProducerPrice(_producerManager.calculateProducerPrice(producerIndex, _qttyBuySell)); 
    
    }

    /// <summary>
    /// Sells n producers of the producer kind corresponding to the given index
    /// </summary>
    /// <param name="producerIndex"> The index of the producer kind to sell. </param>
    public void sellProducer(int producerIndex) {

        int aux = 0;
        if (_qttyBuySell == -1)
            aux = _producerManager.calculateMaxProducersToSell(producerIndex);
        else
            aux = _qttyBuySell;
        _nTotalCroquetas += _producerManager.sellProducer(producerIndex, aux);

        updateProducerPnlInfo(producerIndex);

        if (producerIndex == 0)
            for (int i = 0; i < _qttyBuySell; i++)
                cursorsPanelController.delCursor();

    }

    /// <summary>
    /// Buys n producers of the producer kind corresponding to the given index.
    /// </summary>
    /// <param name="producerIndex"> The index of the producer kind to buy. </param>
    public void buyProducer(int producerIndex) {

        int aux = 0;
        if (_qttyBuySell == -1)
            aux = _producerManager.calculateMaxProducersToBuy(producerIndex, _nTotalCroquetas);
        else 
            aux = _qttyBuySell;
        _nTotalCroquetas = _producerManager.buyProducer(producerIndex, _nTotalCroquetas, aux);

        updateProducerPnlInfo(producerIndex);

        if (producerIndex == 0)
            if (_qttyBuySell != -1)
                for (int i = 0; i < aux; i++)
                    cursorsPanelController.addCursor();

    }

    public void croquetaClickEvent() {

        croquetaAnimator.Play("CroquetaClickAnim");
        SoundManager.instance.PlaySFX();
        _nTotalCroquetas += _producerManager.producePuntual(0);
        updateInfoPanel();

    }

    public void rankingReceivedCallback(int respCode) {

        _rankingPanelsControllers = new RankingPnlController[RankingManager.instance.rankingItems.Length];
        for (int i = 0; i < RankingManager.instance.rankingItems.Length; i++) {
            GameObject rankingPnl = Instantiate(panelUserRankingPrefabGO, contentRankingGO.transform);
            rankingPnl.GetComponent<RectTransform>().localPosition = new Vector3(340, (-85 * i) - 70, 0);
            _rankingPanelsControllers[i] = rankingPnl.GetComponent<RankingPnlController>();
            _rankingPanelsControllers[i].loadData(i + 1, RankingManager.instance.rankingItems[i]);
        }

    }

    public void openProducerList() {

        panelListaBonusGO.SetActive(false);
        panelListaProductoresGO.SetActive(true);
        panelBSQttyGO.SetActive(true);
        tituloMenuStore.text = "Tienda / Productores";

    }

    public void openBonusList() {

        panelListaProductoresGO.SetActive(false);
        panelListaBonusGO.SetActive(true);
        panelBSQttyGO.SetActive(false);
        tituloMenuStore.text = "Tienda / Bonus";

    }

    public void hideAllMenus() {

        panelStoreGO.SetActive(false);
        panelEstadisticasGO.SetActive(false);
        panelRankingGO.SetActive(false);
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

    public void hideShowRanking() {
        
        hideAllMenus();

        if (!panelRankingGO.activeSelf) {           
            panelRankingGO.SetActive(true);
            panelMainRT.offsetMin = new Vector2(980, panelMainRT.offsetMin.y);

            if (_rankingPanelsControllers == null) {
                RankingManager.instance.loadRankingData(rankingReceivedCallback);
            }

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
