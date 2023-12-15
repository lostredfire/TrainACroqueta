using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CursorsPanelController : MonoBehaviour {

    public GameObject cursorPrefab;
    private int cursorsQtty;
    private float anglePerCursor;
    private int nCursorsPerCirc;

    void Start() {
        
        cursorsQtty = 0;
        nCursorsPerCirc = GameGlobals.MAX_CURSORS / GameGlobals.N_CIRC_CURSORS;
        anglePerCursor = 360 / nCursorsPerCirc;

    }

    void Update() {
        
        GetComponent<RectTransform>().rotation = Quaternion.Euler(0, 0, (GetComponent<RectTransform>().rotation.eulerAngles.z - GameGlobals.CURSORS_ROTATION_SPEED));

    }

    public void setQttyCursors(int qtty) {

        cursorsQtty = qtty;
        for (int i = 0; i < cursorsQtty || i < GameGlobals.MAX_CURSORS; i++) {
            addCursor();
        }

    }

    public void addCursor() {
            
        if (cursorsQtty < GameGlobals.MAX_CURSORS) {
            GameObject cursor = Instantiate(cursorPrefab, transform);
            int currentCirc = cursorsQtty/nCursorsPerCirc;
            cursor.GetComponent<Image>().color = new Color(1, 1, 1, 1 - ((float) currentCirc / GameGlobals.N_CIRC_CURSORS) );
            cursor.GetComponent<RectTransform>().localRotation = Quaternion.Euler(0, 0, -anglePerCursor*cursorsQtty + currentCirc*10);
            cursor.GetComponent<RectTransform>().localPosition = new Vector3((float) ((260 + 50 * (int)(currentCirc)) * Math.Sin((cursorsQtty*anglePerCursor + currentCirc*5)*(Math.PI/180) ) ), 
                                                                             (float) ((260 + 50 * (int)(currentCirc)) * Math.Cos((cursorsQtty*anglePerCursor + currentCirc*5) * (Math.PI/180))), 0);
            cursorsQtty++;
        }

    }

    public void delCursor() {

        Destroy(transform.GetChild(transform.childCount - 1).gameObject);
        cursorsQtty--;

    }

}
