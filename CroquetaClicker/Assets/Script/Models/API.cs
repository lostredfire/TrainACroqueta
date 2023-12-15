using System.Net.Http;
using System;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using System.Threading;

public class API
{

    private static readonly string baseUrl = "http://trainacroqueta.ignorelist.com:1109/api/";
    //private static readonly string baseUrl = "http://192.168.1.22:1109/api/";
    private static readonly HttpClient _client = new HttpClient();
    private static Mutex mut;
    public delegate void msgReceivedCallback(int respCode, string jsonStr);

    /// <summary>
    /// Constructor.
    /// </summary>
    public API() {
        mut = new Mutex();
    }

    /// <summary>
    /// Sends a post request to the api at the specified resource with a json content and calls the callback when the response is received.
    /// </summary>
    /// <param name="apiResource"> The resource of the api to request at. </param>
    /// <param name="jsonStr"> The json to include in the content. </param>
    /// <param name="callback"> The callback to call when the response is received. </param>
    public async void sendPostToApi(string apiResource, string jsonStr, msgReceivedCallback callback) {

        mut.WaitOne();
        //Debug.Log("Sending post to api: " + jsonStr);
        HttpResponseMessage resp = await _client.PostAsync(baseUrl + apiResource, new StringContent(content: jsonStr, Encoding.UTF8, "application/json"));
        string respStr = await resp.Content.ReadAsStringAsync();
        callback((int)resp.StatusCode, respStr);
        mut.ReleaseMutex();
        return;

    }

    /// <summary>
    /// Sends a put request to the api at the specified resource with a json content and calls the callback when the response is received.
    /// </summary>
    /// <param name="apiResource"> The resource of the api to request at. </param>
    /// <param name="jsonStr"> The json to include in the content. </param>
    /// <param name="callback"> The callback to call when the response is received. </param>
    public async void sendPutToApi(string apiResource, string jsonStr, msgReceivedCallback callback) {

        mut.WaitOne();
        //Debug.Log("Sending put to api: " + jsonStr);
        HttpResponseMessage resp = await _client.PutAsync(baseUrl + apiResource, new StringContent(content: jsonStr, Encoding.UTF8, "application/json"));
        string respStr = await resp.Content.ReadAsStringAsync();
        callback((int)resp.StatusCode, respStr);
        mut.ReleaseMutex();
        return;

    }

    /// <summary>
    /// Sends a get request to the api at the specified resource and calls the callback when the response is received.
    /// </summary>
    /// <param name="apiResource"> The resource of the api to request at. </param>
    /// <param name="callback"> The callback to call when the response is received. </param>
    public async void sendGetToApi(string apiResource, msgReceivedCallback callback) {

        mut.WaitOne();
        //Debug.Log("Sending get to api (without json)");
        HttpResponseMessage resp = await _client.GetAsync(baseUrl + apiResource);
        string respStr = await resp.Content.ReadAsStringAsync();
        callback((int)resp.StatusCode, respStr);
        mut.ReleaseMutex();
        return;

    }

    /// <summary>
    /// Sends a get request to the api at the specified resource with a json content and calls the callback when the response is received.
    /// </summary>
    /// <param name="apiResource"> The resource of the api to request at. </param>
    /// <param name="jsonStr"> The json to include in the content. </param>
    /// <param name="callback"> The callback to call when the response is received. </param>
    public async void sendGetJsonToApi(string apiResource, string jsonStr, msgReceivedCallback callback) {

        HttpRequestMessage req = new HttpRequestMessage {
            Method = HttpMethod.Get,
            RequestUri = new Uri(baseUrl + apiResource),
            Content = new StringContent(jsonStr, Encoding.UTF8, "application/json"),
        };

        mut.WaitOne();
        //Debug.Log("Sending get to api: " + jsonStr);
        HttpResponseMessage resp = await _client.SendAsync(req);
        string respStr = await resp.Content.ReadAsStringAsync();
        callback((int)resp.StatusCode, respStr);
        mut.ReleaseMutex();
        return;

    }

}
