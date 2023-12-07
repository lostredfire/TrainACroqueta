using System.Collections;
using System.Collections.Generic;
using System;

public class BonusManager
{

    private List<Bonus> _bonusList;
    private double _totalMultiplier;
    private double _totalBaseAdder;

    public BonusManager() {

        _bonusList = new List<Bonus>();
        _totalMultiplier = 1;
        _totalBaseAdder = 0;

    }

    public BonusManager(List<Bonus> bonusList) {

        _bonusList = bonusList;
        updateTotalMultiplier();
        updateTotalBaseAdder();

    }

    public void addBonus(Bonus bonus) {

        _bonusList.Add(bonus);
        if (bonus.type == BonusType.TOTAL_MULTIPLIER) 
            updateTotalMultiplier(bonus);
        if (bonus.type == BonusType.BASE_PRODUCTION_ADDER)
            updateTotalBaseAdder(bonus);

    }

    public Bonus buildRandomBonus() {
            
        Random rnd = new Random();
        BonusType type = (BonusType)rnd.Next(BonusType.GetValues(typeof(BonusType)).Length);
        double qtty = rnd.NextDouble() * GameGlobals.MAX_BONUS_QTTY;
    
        return new Bonus(type, qtty);

    }

    private void updateTotalMultiplier() {
            
        _totalMultiplier = 1;
        foreach (Bonus bonus in _bonusList) {
            if (bonus.type == BonusType.TOTAL_MULTIPLIER) {
                updateTotalMultiplier(bonus);
            }
        }

    }

    private void updateTotalBaseAdder() {
            
        _totalBaseAdder = 0;
        foreach (Bonus bonus in _bonusList) {
            if (bonus.type == BonusType.BASE_PRODUCTION_ADDER) {
                updateTotalBaseAdder(bonus);
            }
        }

    }

    private void updateTotalBaseAdder(Bonus b) {
        _totalBaseAdder = _totalBaseAdder + b.quantity;
    }

    private void updateTotalMultiplier(Bonus b) {
        _totalMultiplier = _totalMultiplier + (b.quantity * _totalMultiplier) + b.quantity;
    }

    public List<Bonus> bonusList {
        get {
            return _bonusList;
        }
    }

    public double totalMultiplier {
        get {
            return _totalMultiplier;
        }
    }

    public double totalBaseAdder {
        get {
            return _totalBaseAdder;
        }
    }

}
