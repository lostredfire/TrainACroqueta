using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum BonusType { BASE_PRODUCTION_ADDER, TOTAL_MULTIPLIER }

public class Bonus {

    private BonusType _type;
    private double _qtty;

    public Bonus(BonusType type, double quantity) {
        _type = type;
        _qtty = quantity;
    }

    public BonusType type {
        get {
            return type;
        } 
        set {
            _type = value;
        }
    }
    public double quantity {
        get {
            return _qtty;
        } 
        set {
            _qtty = value;
        }
    }

}
