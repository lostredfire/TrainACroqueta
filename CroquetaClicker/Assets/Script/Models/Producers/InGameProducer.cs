using System;
using System.Collections;
using System.Collections.Generic;

public class InGameProducer : Producer {

    private ProducerTimeStamp _prodTS;
    private BonusManager _bonusManager;

    /// <summary>
    /// Constructs an InGameProducer instance. This object will contain its assigned bonusses and the ProducerTimeStamp with the ammount of Croquetas produced until a determinated moment and the count of producers.
    /// This constructor is meant to be called when the player buys the first of this producer, so the bonusList will be empty and the timeStamp's producedCroquetas count will be 0
    /// </summary>
    /// <param name=baseProducer> The base productor described in GameGlobals. </param>
    public InGameProducer(Producer baseProducer) : base(baseProducer) {

        _bonusManager = new BonusManager();
        _prodTS = new ProducerTimeStamp(0, 0);

    }

    /// <summary>
    /// Constructs an InGameProducer instance. This object will contain its assigned bonusses and the ProducerTimeStamp with the ammount of Croquetas produced until a determinated moment and the count of producers.
    /// </summary>
    /// <param name=baseProducer> The base productor described in GameGlobals. </param>
    /// <param name=bonusList> A list that contains all the bonus assigned to this producer. </param>
    /// <param name=producerTS> The last known timeStamp of this producer. </param>
    public InGameProducer(Producer baseProducer, List<Bonus> bonusList, ProducerTimeStamp producerTS) : base(baseProducer) {

        _bonusManager = new BonusManager(bonusList);
        _prodTS = producerTS;

    }

    /// <summary>
    /// Initiailzes the data of this inGameProducer from a saved data.
    /// </summary>
    /// <param name="pts"> The saved data. </param>
    public void initiailze(ProducerTimeStamp pts) {
        _prodTS = pts;
        addNProducers(0);
    }

    /// <summary>
    /// Adds n producers to the producerCount.
    /// </summary>
    /// <param name=nProducersToAdd> The number of producers to add. Defaults to 1. </param>
    public void addNProducers(int nProducersToAdd = 1) {
        _prodTS.addNProducers(calculateProduced(), nProducersToAdd);
    }

    /// <summary>
    /// Calculates the production of this kind of producer.
    /// </summary>
    /// <returns> The production of this kind of producer. </returns>
    public override long calculateProduction() {
        return (long) Math.Round((prodQuantity + _bonusManager.totalBaseAdder) * _prodTS.nProducers * _bonusManager.totalMultiplier);
    }

    /// <summary>
    /// Calculates the number of Croquetas produced by this kind of producer since the last timeStamp.
    /// </summary>
    /// <returns> The number of Croquetas produced by this kind of producer since the last timeStamp. </returns>
    public long calculateProduced() {
        return calculateProduction() * (DateTimeOffset.Now.ToUnixTimeSeconds() - _prodTS.timeStamp);
    }


    // Getters and setters
    public BonusManager bonusManager {
        get {
            return _bonusManager;
        } 
    }
    public ProducerTimeStamp producerTS {
        get {
            return _prodTS;
        }
    }

}
