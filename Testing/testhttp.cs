using System.Net;

var url = "http:trainacroqueta.ignorelist.com:1109/getproducers";

var request = WebRequest.Create(url);
request.Method = "GET";

using var webResponse = request.GetResponse();
using var webStream = webResponse.GetResponseStream();

using var reader = new StreamReader(webStream);
var data = reader.ReadToEnd();

Console.WriteLine(data);