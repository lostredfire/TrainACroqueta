
using System.Net.Http;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.Json.Nodes;

Console.WriteLine("Hello, World!");

//string baseUrl = "http://trainacroqueta.ignorelist.com:1109/api/";
string baseUrl = "http://192.168.1.22:1109/api/";

HttpClient client = new HttpClient();

JsonObject json = (dynamic)new JsonObject();
json.Add("username", "silviarc");
json.Add("passwd", "silviarc");

//FormUrlEncodedContent content = new FormUrlEncodedContent(val);
StringContent content = new StringContent(content: json.ToString(), Encoding.UTF8, "application/json");
HttpResponseMessage resp = await client.PostAsync(baseUrl + "login", content);
string respStr = await resp.Content.ReadAsStringAsync();

Console.WriteLine(respStr);

//sendGet
//var respStr = await client.GetStringAsync(baseUrl + "getproducers");
//Console.WriteLine(respStr);