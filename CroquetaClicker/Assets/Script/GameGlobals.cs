using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameGlobals : MonoBehaviour {

    //variables to display in the inspector.
    public GameObject panelLoadingPrefabGO;
    public double maxBonusQtty;
    public double producerPriceIncrement;
    public double loose_by_sell_productor;
    public float cursorsRotationSpeed;
    public int maxCursors;
    public int nCircCursors;
    public int updateTextsEveryNMiliseconds;
    public int saveEveryNMilis;
    public Producer[] producerTypes;
    public Producer[] puntualProducerTypes;

    //static variables to be used in other scripts.
    public static double MAX_BONUS_QTTY;
    public static double PRODUCER_PRICE_INCREMENT;
    public static double LOOSE_BY_SELL_PRODUCTOR;
    public static float CURSORS_ROTATION_SPEED;
    public static int MAX_CURSORS;
    public static int N_CIRC_CURSORS;
    public static int UPDATE_TEXTS_EVERY_N_MILISECONDS;
    public static int SAVE_EVERY_N_MILIS;
    public static Producer[] PRODUCER_TYPES;
    public static Producer[] PUNTUAL_PRODUCER_TYPES;
    public static GameObject PANEL_LOADING_PREFAB_GO;

    void Awake() {

        DontDestroyOnLoad(gameObject);
        
        MAX_BONUS_QTTY = maxBonusQtty;
        PRODUCER_PRICE_INCREMENT = producerPriceIncrement;
        LOOSE_BY_SELL_PRODUCTOR = loose_by_sell_productor;
        CURSORS_ROTATION_SPEED = cursorsRotationSpeed;
        MAX_CURSORS = maxCursors;
        UPDATE_TEXTS_EVERY_N_MILISECONDS = updateTextsEveryNMiliseconds;
        SAVE_EVERY_N_MILIS = saveEveryNMilis;
        PRODUCER_TYPES = producerTypes;
        PUNTUAL_PRODUCER_TYPES = puntualProducerTypes;
        N_CIRC_CURSORS = nCircCursors;
        PANEL_LOADING_PREFAB_GO = panelLoadingPrefabGO;

    }


}
