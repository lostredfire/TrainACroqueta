using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;

/// <summary>
/// Class that represents the constant values of a kind of producer. This class is meant to be displayed and edited from the unity editor to change the properties of the producers that will be used in game.
/// </summary>
[Serializable]
public class Producer {

    public string name;
    public string description;
    public Sprite icon;
    public double baseProduction;
    public double basePrice;

    /// <summary>
    /// Constructs a Producer instance. This object will contain the constant values of a kind of producer.
    /// </summary>
    /// <param name=other> The producer from which to take the params </param>
    public Producer(Producer other) {
        name = other.name;
        description = other.description;
        icon = other.icon;
        baseProduction = other.baseProduction;
        basePrice = other.basePrice;
    }

    /// <summary>
    /// Calculates the production of this kind of producer.
    /// </summary>
    /// <returns> The production of this kind of producer. </returns>
    public virtual long calculateProduction() {
        return (long) Math.Round(baseProduction);
    }

}
