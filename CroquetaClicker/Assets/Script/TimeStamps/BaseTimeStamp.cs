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
    }

    public long timeStamp {
        get {
            return _timeStamp;
        }
    }

}
