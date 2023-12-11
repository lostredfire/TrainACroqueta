using System;
using System.Collections;
using System.Collections.Generic;

public class ProducerManager {

    private InGameProducer[] _producerList;
    private InGameProducer[] _puntualProducerList;
    private BaseTimeStamp _globalTimeStamp;
    private BonusManager _globalBonusManager;
    private long _totalProduction;

    public ProducerManager() {

        _producerList = new InGameProducer[GameGlobals.PRODUCER_TYPES.Length];
        _puntualProducerList = new InGameProducer[GameGlobals.PUNTUAL_PRODUCER_TYPES.Length];
        _globalTimeStamp = new BaseTimeStamp(0);
        _globalBonusManager = new BonusManager();
        _totalProduction = -1;

        for (int i = 0; i < _producerList.Length; i++) {
            _producerList[i] = new InGameProducer(GameGlobals.PRODUCER_TYPES[i]);
        }
        for (int i = 0; i < _puntualProducerList.Length; i++) {
            _puntualProducerList[i] = new InGameProducer(GameGlobals.PUNTUAL_PRODUCER_TYPES[i]);
            _puntualProducerList[i].producerTS.addNProducers(0);
        }
        calculateProduction();

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

        return (long) Math.Round(_producerList[iProducer].basePrice * Math.Pow(GameGlobals.PRODUCER_PRICE_INCREMENT, nProducersToBuy + _producerList[iProducer].producerTS.nProducers - 1));

    }

    /// <summary>
    /// Calculates the price of selling n producers of a determinated type.
    /// </summary>
    /// <param name="iProducer"> The index of the producer in the list. </param>
    /// <param name="nProducersToSell"> The number of producers to sell. Defaults to 1. </param>
    /// <returns> The price of selling n producers of the given type. </returns>
    public long calculateProducerSellPrice(int iProducer, int nProducersToSell = 1) {

        return (long) (calculateProducerPrice(iProducer, (nProducersToSell * (-1))) * (1 - GameGlobals.LOOSE_BY_SELL_PRODUCTOR));

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
            currentPrice = calculateProducerPrice(iProducer, maxProducersToBuy);
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

}
