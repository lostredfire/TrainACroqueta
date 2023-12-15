using System;
using System.Collections;
using System.Collections.Generic;

/// <summary>
/// Class that represents the ammount of Croquetas produced in a determinated moment.
/// </summary>
public class BaseTimeStamp {

    /// <summary>
    /// The number of Croquetas produced until a moment.
    /// </summary>
    protected long _nProduced;

    /// <summary>
    /// A variable that represents a moment.
    /// </summary>
    protected long _timeStamp;

    /// <summary>
    /// Constructor to build a TimeStamp from a saved data.
    /// </summary>
    /// <param name="nProduced"> The number of croquetas produced. </param>
    /// <param name="timeStamp"> The timeStamp when the data was saved.</param>
    public BaseTimeStamp(long nProduced, long timeStamp) {
        _nProduced = nProduced;
        _timeStamp = timeStamp;
    }

    /// <summary>
    /// Constructor to build a new TimeStamp
    /// </summary>
    /// <param name="nProduced"></param>
    public BaseTimeStamp(long nProduced) {
        _nProduced = nProduced;
        _timeStamp = DateTimeOffset.Now.ToUnixTimeSeconds();
    }

    public BaseTimeStamp updateTS() {
        _timeStamp = DateTimeOffset.Now.ToUnixTimeSeconds();
        return this;
    }

    // getters and setters

    public long nProduced {
        get {
            return _nProduced;
        } 
        set {
            _nProduced = value;
        }
    }

    public long timeStamp {
        get {
            return _timeStamp;
        }
        set {
            _nProduced = value;
        }
    }

}
