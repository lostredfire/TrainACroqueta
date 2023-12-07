using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundBar : MonoBehaviour {

    public bool masterVolume;

    public void Start() {
        if (masterVolume) {
            GetComponent<UnityEngine.UI.Slider>().value = SoundManager.instance.musicSource.volume;
        } else {
            GetComponent<UnityEngine.UI.Slider>().value = SoundManager.instance.sfxSource.volume;
        }
        
    }

    public void changeVolume(float volume) {
        if (masterVolume) {
            SoundManager.instance.changeVolume(volume);
        } else {
            SoundManager.instance.changeEffectsVolume(volume);
        }
        
    }

}
