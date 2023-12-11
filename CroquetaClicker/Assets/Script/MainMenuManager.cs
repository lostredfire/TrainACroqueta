
#if UNITY_EDITOR
using UnityEditor;
#endif

using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenuManager : MonoBehaviour
{

     public GameObject panelSettingsPrefabGO;
     public GameObject panelLoginPrefabGO;

     public void Start() {
          FileInfo fileSettings = new FileInfo(Application.persistentDataPath + "/Settings/settings.dat");
          using (StreamReader sr = fileSettings.OpenText()) {
               SoundManager.instance.changeVolume(float.Parse(sr.ReadLine()));
               SoundManager.instance.changeEffectsVolume(float.Parse(sr.ReadLine()));
          }
     }

     public void startGame(){

          SceneManager.LoadScene("Game");

     }

     public void showLogin(){

          SceneManager.LoadScene("LoginSignup");

     }

     public void quitGame(){

          Application.Quit();
       
          #if UNITY_EDITOR
          EditorApplication.ExitPlaymode();
          #endif
          
     }

     public void settingsOption() {

          GameObject settings = Instantiate(panelSettingsPrefabGO, gameObject.transform);

     }

     public void openLogin() {

          GameObject loginPnl = Instantiate(panelLoginPrefabGO, gameObject.transform);

     }

}
