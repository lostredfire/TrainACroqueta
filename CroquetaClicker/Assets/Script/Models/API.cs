using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

public class API
{

    private static readonly string baseUrl = "http://trainacroqueta.ignorelist.com:1109/api/";
    //private static readonly string baseUrl = "http://192.168.1.22:1109/api/";
    private static readonly HttpClient _client = new HttpClient();
    public delegate void msgReceivedCallback(int respCode, string jsonStr);

    public API() {

    }

    public async void sendPostToApi(string apiResource, string jsonstr, msgReceivedCallback callback) {

        Debug.Log("sending post with json:" + jsonstr);
        HttpResponseMessage resp = await _client.PostAsync(baseUrl + apiResource, new StringContent(content: jsonstr, Encoding.UTF8, "application/json"));
        Debug.Log("response status code: " + (int)resp.StatusCode);
        string respStr = await resp.Content.ReadAsStringAsync();
        callback((int)resp.StatusCode, respStr);
        return;

    }

    public void sendGetJsonToApi(string apiResource, string jsonstr) {

        

    }

}
