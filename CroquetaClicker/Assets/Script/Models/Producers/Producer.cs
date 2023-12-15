using System;
using UnityEngine.UI;
using UnityEngine;

/// <summary>
/// Class that represents the constant values of a kind of producer. This class is meant to be displayed and edited from the unity editor to change the properties of the producers that will be used in game.
/// </summary>
[Serializable]
public class Producer {

    public int idProd;
    public string prodName;
    public string description;
    public string imgHex; // the hex value of the icon.
    public Sprite icon;
    public double prodQuantity; // the base production of the producer.
    public double price; // the base price of the producer.

    /// <summary>
    /// Constructs a Producer instance. This object will contain the constant values of a kind of producer.
    /// </summary>
    /// <param name=other> The producer from which to take the params </param>
    public Producer(Producer other) {
        prodName = other.prodName;
        description = other.description;
        icon = other.icon;
        prodQuantity = other.prodQuantity;
        price = other.price;
    }

    /// <summary>
    /// Parses the img received from the api in a hexadecimal format to a Sprite icon format.
    /// </summary>
    public void parseImgToIcon() {

        Texture2D t2d = new Texture2D(1,1);
        if (t2d.LoadImage(StringToByteArray(imgHex))) {
            icon = Sprite.Create(t2d, new Rect(0, 0, t2d.width, t2d.height), Vector2.zero, 100.0f);
        }

    }

    /// <summary>
    /// Converts a string in hexadecimal formar to a byte array.
    /// </summary>
    /// <param name="hex"> the input string. </param>
    /// <returns> a byte array with the parsed content. </returns>
    public static byte[] StringToByteArray(string hex) {

        int NumberChars = hex.Length;
        byte[] bytes = new byte[NumberChars / 2];
        for (int i = 0; i < NumberChars; i += 2)
            bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
        return bytes;

    }

    /// <summary>
    /// Calculates the production of this kind of producer.
    /// </summary>
    /// <returns> The production of this kind of producer. </returns>
    public virtual long calculateProduction() {
        return (long) Math.Round(prodQuantity);
    }

}
