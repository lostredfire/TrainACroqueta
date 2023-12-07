using System.Collections;
using System.Collections.Generic;

/// <summary>
/// Class that contains an array of ProducerTimeStamp and provide operations over all the individuals producers and timeStamps.
/// </summary>
public class ProductionTimeStamp : BaseTimeStamp {

    private ProducerTimeStamp[] _productorsTS;

    /// <summary>
    /// Constructs a ProductionTimeStamp instance.
    /// </summary>
    /// <param name=nProduced> The total Croquetas produced in a determinated moment by all the productors.</param>
    /// <param name=productorsTS> An array of each individual producerTimeStamp 's</param>
    public ProductionTimeStamp(long nProduced, ProducerTimeStamp[] productorsTS) : base(nProduced) {
        _productorsTS = productorsTS;
    }

    public ProducerTimeStamp[] productorsTS {
        get {
            return _productorsTS;
        }
    }

}
