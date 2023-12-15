
#if UNITY_EDITOR
using UnityEditor;
#endif

using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class MainMenuManager : MonoBehaviour
{

     private static MainMenuManager _instance;
     public GameObject panelSettingsPrefabGO;
     public GameObject panelLoginPrefabGO;
     public GameObject imgTitle;
     public Button btnStartGame;
     public TMPro.TextMeshProUGUI txtUserLbl;
     private GameObject loadingPnl;

     public void Awake() {
          if (_instance == null) {
               _instance = this;
          } else {
               Destroy(this.gameObject);
          }
     }

     public void Start() {
          FileInfo fileSettings = new FileInfo(Application.persistentDataPath + "/Settings/settings.dat");
          using (StreamReader sr = fileSettings.OpenText()) {
               SoundManager.instance.changeVolume(float.Parse(sr.ReadLine()));
               SoundManager.instance.changeEffectsVolume(float.Parse(sr.ReadLine()));
          }
          loadingPnl = Instantiate(GameGlobals.PANEL_LOADING_PREFAB_GO, null);
          loadingPnl.SetActive(false);
     }

     public void toogleLoadingAnim() {
          loadingPnl.SetActive(!loadingPnl.activeSelf);
     }

     public void notifyUserLogged(User u) {

          if (u != null) {
               btnStartGame.interactable = true;
               txtUserLbl.text = u.username;
          } else {
               btnStartGame.interactable = false;
               txtUserLbl.text = "-";
          }

     }

     public void startGame(){

          SceneManager.LoadScene("Game");

     }

     public void quitGame(){

          Application.Quit();
       
          #if UNITY_EDITOR
          EditorApplication.ExitPlaymode();
          #endif
          
     }

     public void settingsOption() {

          toogleImgTitle();
          GameObject settings = Instantiate(panelSettingsPrefabGO, gameObject.transform);

     }

     public void toogleImgTitle() {
          imgTitle.SetActive(!imgTitle.activeSelf);
     }

     public void openLogin() {

          toogleImgTitle();
          if (UserManager.instance.isUserSignedIn) {
               UserManager.instance.logout();
          }
          GameObject pnlLogin = Instantiate(panelLoginPrefabGO, gameObject.transform);

     }

     public static MainMenuManager instance {
          get {
               return _instance;
          }
     }

}
