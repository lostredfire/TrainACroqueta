using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundManager : MonoBehaviour {

    public static SoundManager instance;
    public AudioSource musicSource;
    public AudioSource sfxSource;

    public void Awake() {
        if (instance == null) {
            instance = this;
            DontDestroyOnLoad(this.gameObject);
        } else {
            Destroy(this.gameObject);
        }
    }

    public void PlayMusic() {
        musicSource.Play();
    }

    public void StopMusic() {
        musicSource.Stop();
    }

    public void PlaySFX() {
        sfxSource.Play();
    }

    public void changeVolume(float volume) {
        musicSource.volume = volume;
    }

    public void changeEffectsVolume(float volume) {
        sfxSource.volume = volume;
    }

}
