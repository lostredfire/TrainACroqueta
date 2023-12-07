using System;
using System.Collections;
using System.Collections.Generic;

/// <summary>
/// Class that contains a timeStamp of an individual kind of producer and the total number of producers of that kind in a determinated moment.
/// </summary>
public class ProducerTimeStamp : BaseTimeStamp {

    /// <summary>
    /// The total ammount of producers of this kind in a determinated moment.
    /// </summary>
    private int _nProducers;

    /// <summary>
    /// Constructs a ProducerTimeStamp instance.
    /// </summary>
    /// <param name=nProduced> The total ammount of Croquetas produced by all the producers of this kind at a determinated moment.</param>
    /// <param name=nProducers> The total ammount of producers in a determinated moment.</param>
    public ProducerTimeStamp(long nProduced, int nProducers) : base(nProduced) {
        _nProducers = nProducers;
    }

    /// <summary>
    /// Updates the Croquetas produced count and adds N producers to the producers count
    /// </summary>
    /// <param name=nProduced> the number of Croquetas produced until now. </param>
    /// <param name=n> the number of producers to add. Defaults to 1. </param>
    public void addNProducers(long nProduced, int n = 1) {
        updateTS(nProduced);
        _nProducers += n;
    }

    /// <summary>
    /// Updates the produced count til now and sets the timeStamp to now.
    /// </summary>
    public ProducerTimeStamp updateTS(long nProduced) {
        _nProduced = nProduced;
        _timeStamp = DateTimeOffset.Now.ToUnixTimeSeconds();
        return this;
    }


    // getters and setters

    public int nProducers {
        get {
            return _nProducers;
        }
    }

}
