using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SettingsManager : MonoBehaviour
{

   private float originalMasterVolume;
   private float originalEffectsVolume;

   void Start() {

      originalMasterVolume = SoundManager.instance.musicSource.volume;
      originalEffectsVolume = SoundManager.instance.sfxSource.volume;

   }

   private void closeSettings() {

      if (MainMenuManager.instance != null)
         MainMenuManager.instance.toogleImgTitle();
      Destroy(gameObject);

   }

   public void saveChanges() {

      FileInfo fileSettings = new FileInfo(Application.persistentDataPath + "/Settings/settings.dat");
      fileSettings.Directory.Create();
      using (StreamWriter sw = fileSettings.CreateText())
        {
            sw.WriteLine(SoundManager.instance.musicSource.volume.ToString("0.00"));
            sw.WriteLine(SoundManager.instance.sfxSource.volume.ToString("0.00"));
        }
      closeSettings();

   }

   public void revertChanges() {

      SoundManager.instance.changeVolume(originalMasterVolume);
      SoundManager.instance.changeEffectsVolume(originalEffectsVolume);
      closeSettings();

   }

}
