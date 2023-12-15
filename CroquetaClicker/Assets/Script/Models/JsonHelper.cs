using System;
using UnityEngine;

public static class JsonHelperList
{
    public static T[] ListFromJson<T>(string json)
    {
        WrapperList<T> wrapper = JsonUtility.FromJson<WrapperList<T>>("{\"Items\":" + json + "}");
        return wrapper.Items;
    }

    public static string ListToJson<T>(T[] array, bool prettyPrint = false)
    {
        WrapperList<T> wrapper = new WrapperList<T>();
        wrapper.Items = array;
        return JsonUtility.ToJson(wrapper, prettyPrint);
    }

    [Serializable]
    private class WrapperList<T>
    {
        public T[] Items;
    }
}
