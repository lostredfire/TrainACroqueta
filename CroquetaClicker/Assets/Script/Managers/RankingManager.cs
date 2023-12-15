using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RankingManager {

    private static RankingManager _instance;
    private bool _rankingLoaded;
    private RankingItem[] _rankingItems;
    public delegate void showOperationResult(int respCode);
    private showOperationResult showResCallback;

    private RankingManager() {

        if (_instance == null) {
            _instance = this; 
            _rankingLoaded = false;
        } 

    }

    public void loadRankingData(showOperationResult showResCb) {
        this.showResCallback = showResCb;
        ApiManager.instance.sendGetRanking(processRankingResult);
    }

    public void processRankingResult(int respCode, string rankingJson) {

        if (respCode == 200) {
            _rankingItems = JsonHelperList.ListFromJson<RankingItem>(rankingJson);
            _rankingLoaded = true;
        } 
        showResCallback(respCode);

    }

    public bool isRankingLoaded {
        get {
            return _rankingLoaded;
        }
    }

    public RankingItem[] rankingItems {
        get {
            return _rankingItems;
        }
    }

    public static RankingManager instance {
        get {
            if (_instance == null)
                return new RankingManager();
            else
                return _instance;
        }
    }

}
