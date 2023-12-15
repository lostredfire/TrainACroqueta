using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProducerManager {

    private InGameProducer[] _producerList;
    private InGameProducer[] _puntualProducerList;
    private BaseTimeStamp _globalTimeStamp;
    private BonusManager _globalBonusManager;
    private GameData _gd;
    private long _totalProduction;
    private bool _prodTypesInitialized;
    private bool _gameDataInitialized;
    private bool _initialized;
    private bool _errorOccured;

    public delegate void ProdMngrInitedCb();
    private ProdMngrInitedCb prodMngrInitedCb;

    /// <summary>
    /// Producer Manager constructor
    /// </summary>
    /// <param name="cb"> The callback needed to notify the GUI that the producerList is ready. </param>
    public ProducerManager(ProdMngrInitedCb cb) {

        _initialized = false;
        _prodTypesInitialized = false;
        _gameDataInitialized = false;
        _errorOccured = false;
        prodMngrInitedCb = cb;
        ApiManager.instance.sendGetProducerList(processReceivedProducerList);
        ApiManager.instance.sendGetGameData(UserManager.instance.userSignedIn, processReceivedGameData);

    }

    /// <summary>
    /// Method callback that will be executed when the list of producers is received to process 
    /// the received json.
    /// </summary>
    /// <param name="respCode"> the http code of the response. </param>
    /// <param name="producerListJson"> the json provided by the api. </param>
    public void processReceivedProducerList(int respCode, string producerListJson) {

        if (respCode == 200) {

            Producer[] rcvProdList = JsonHelperList.ListFromJson<Producer>(producerListJson);
            foreach (Producer p in rcvProdList) p.parseImgToIcon();

            _producerList = new InGameProducer[rcvProdList.Length];
            _puntualProducerList = new InGameProducer[GameGlobals.PUNTUAL_PRODUCER_TYPES.Length];
            
            for (int i = 0; i < _producerList.Length; i++) {
                _producerList[i] = new InGameProducer(rcvProdList[i]);
            }
            for (int i = 0; i < _puntualProducerList.Length; i++) {
                _puntualProducerList[i] = new InGameProducer(GameGlobals.PUNTUAL_PRODUCER_TYPES[i]);
                _puntualProducerList[i].producerTS.addNProducers(0);
            }

        } else {
            _errorOccured = true;
        }

        _prodTypesInitialized = true;
        finishInitialization();

    }

    /// <summary>
    /// Method callback that will be executed when the gameData is received to process 
    /// the received json.
    /// </summary>
    public void processReceivedGameData(int respCode, string gameDataJson) {

        if (respCode == 200) {

            _gd = JsonUtility.FromJson<GameData>(gameDataJson);
            _gd.normalize();

            _globalTimeStamp = new BaseTimeStamp(_gd.nCroquetas, _gd.lastday);
            _globalBonusManager = new BonusManager(); 
            _totalProduction = -1; 

        } else {
            _errorOccured = true;
        }
        
        _gameDataInitialized = true;
        finishInitialization();

    }

    public void finishInitialization() {

        if (_prodTypesInitialized && _gameDataInitialized) {
            foreach (GameProducer gp in _gd.gameproducers) {
                _producerList[gp.idProd].initiailze(new ProducerTimeStamp(gp.qttyCroquetas, _gd.lastday, gp.quantity));
            }
            calculateProduction();
            calculateProduced();
            _initialized = true;
            prodMngrInitedCb();
        }

        if (_errorOccured) {
            prodMngrInitedCb();
        }

    }

    public void saveGameData() {
        
    }

    /// <summary>
    /// Gets the number of different types of producers.
    /// </summary>
    /// <returns> the number of different types of producers. </returns>
    public int getProducerTypesCount() {
        return _producerList.Length;
    }

    /// <summary>
    /// Calculates the production of all the producers in the list      in one time period.
    /// </summary>
    /// <returns> The total production of all the producers in the list in one time period. </returns>
    public long calculateProduction() {

        if (_totalProduction == -1) { // if the total production has not been calculated yet or is invalid
            
            long totalProduction = 0;
            foreach (Producer producer in _producerList) {
                totalProduction = totalProduction + producer.calculateProduction();
            }
            _totalProduction = (long) Math.Round(totalProduction * _globalBonusManager.totalMultiplier);
        
        }
        
        return _totalProduction;

    }

    /// <summary>
    /// Calculates the number of Croquetas produced by all the producers in the list since the last global time stamp.
    /// </summary>
    /// <returns> The number of Croquetas produced by all the producers in the list since the last global time stamp. </returns>
    public long calculateProduced() {

        long deltaTime = DateTimeOffset.Now.ToUnixTimeSeconds() - _globalTimeStamp.timeStamp;
        _globalTimeStamp.updateTS();
        return calculateProduction() * deltaTime;

    }

    /// <summary>
    /// Calculates the price of buying n producers of a determinated type.
    /// </summary>
    /// <param name="iProducer"> The index of the producer in the list. </param>
    /// <param name="nProducersToBuy"> The number of producers to buy. Defaults to 1. </param>
    /// <returns> The price of buying n producers of the given type. </returns>
    public long calculateProducerPrice(int iProducer, int nProducersToBuy = 1) {

        double basePrice = 0;
        for (int i = _producerList[iProducer].producerTS.nProducers; i < _producerList[iProducer].producerTS.nProducers + nProducersToBuy; i++) {
            basePrice += Math.Pow(GameGlobals.PRODUCER_PRICE_INCREMENT, i);
        }
        return (long) Math.Round(_producerList[iProducer].price * basePrice);

    }

    /// <summary>
    /// Calculates the price of selling n producers of a determinated type.
    /// </summary>
    /// <param name="iProducer"> The index of the producer in the list. </param>
    /// <param name="nProducersToSell"> The number of producers to sell. Defaults to 1. </param>
    /// <returns> The price of selling n producers of the given type. </returns>
    public long calculateProducerSellPrice(int iProducer, int nProducersToSell = 1) {

        double basePrice = 0;
        for (int i = _producerList[iProducer].producerTS.nProducers - nProducersToSell; i < _producerList[iProducer].producerTS.nProducers; i++) {
            basePrice += Math.Pow(GameGlobals.PRODUCER_PRICE_INCREMENT, i);
        }
        return (long) Math.Round(_producerList[iProducer].price * basePrice * (1 - GameGlobals.LOOSE_BY_SELL_PRODUCTOR));

    }

    /// <summary>
    /// Calculates the number of producers that can be bought with the current amount of Croquetas.
    /// </summary>
    /// <param name="iProducer"> The index of the producer in the list. </param>
    /// <param name="croquetasAvailable"> The current amount of Croquetas. </param>
    /// <returns> The number of producers that can be bought with the current amount of Croquetas. </returns>
    public int calculateMaxProducersToBuy(int iProducer, long croquetasAvailable) {

        int maxProducersToBuy = 0;
        long currentPrice = calculateProducerPrice(iProducer);
        while (croquetasAvailable >= currentPrice) {
            maxProducersToBuy++;
            croquetasAvailable -= currentPrice;
            currentPrice = calculateProducerPrice(iProducer, maxProducersToBuy + 1);
        }
        return maxProducersToBuy;

    }

    public int calculateMaxProducersToSell(int iProducer) {
            
        return _producerList[iProducer].producerTS.nProducers;
        
    }

    /// <summary>
    /// Buys n producers of a determinated type.
    /// </summary>
    /// <param name="iProducer"> The index of the producer in the list. </param>
    /// <param name="croquetasAvailable"> The current amount of Croquetas. </param>
    /// <param name="nProducersToBuy"> The number of producers to buy. Defaults to 1. </param>
    /// <returns> The amount of Croquetas left after the purchase. </returns>
    public long buyProducer(int iProducer, long croquetasAvailable, int nProducersToBuy = 1) {

        long price = calculateProducerPrice(iProducer, nProducersToBuy);
        if (croquetasAvailable >= price) {
            _producerList[iProducer].addNProducers(nProducersToBuy);
            _totalProduction = -1;
            return croquetasAvailable - price;
        } else {
            return -1;
        }

    }

    /// <summary>
    /// Sells n producers of a determinated type.
    /// </summary>
    /// <param name="iProducer"> The index of the producer in the list. </param>
    /// <param name="nProducersToSell"> The numbers of producers to sell. Defaults to 1. </param>
    /// <returns> The ammount of Croquetas gained by this operation. </returns>
    public long sellProducer(int iProducer, int nProducersToSell = 1) {
        
        long price = calculateProducerSellPrice(iProducer, nProducersToSell);
        _producerList[iProducer].addNProducers(nProducersToSell * (-1));
        _totalProduction = -1;
        return price;

    }

    public long producePuntual(int iProducer) {

        long production = _puntualProducerList[iProducer].calculateProduction();
        _puntualProducerList[iProducer].producerTS.updateTS(_puntualProducerList[iProducer].producerTS.nProduced + production);
        return (long) Math.Round(production * _globalBonusManager.totalMultiplier);

    }

    public InGameProducer[] ProducerList {
        get { 
            return _producerList; 
        }
    }

    public bool isInitializated {
        get {
            return _initialized;
        }
    }

    public bool isErrorOcurred {
        get {
            return _errorOccured;
        }
    }

}
