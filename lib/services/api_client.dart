// first let's add the http package
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "e574fca3788d7ebe84c4"});

  // the first parameter of URI should be just the main url,without http
  // the second parameter of URI should be input of path
  //& 3rd parameter is a map for the different properties.

// now lets make the function to get the Currencies list
  Future<List<String>> getCurrencies() async {
    //http.Response res = await http.get(currencyURL);
    http.Response response = await http.get(currencyURL);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var list = body["results"];
      List<String> currencies = (list.keys).toList();
      if(currencies == null){
        print("Loading...");
      }else{
        return currencies;
      }
      //print(currencies);

    } else {
      throw Exception("Failed to connect to API");
    }
  }

  // getting exchange rate
  Future<double> getRate(String from, String to) async {
    final Uri rateUrl = Uri.https('free.currconv.com', '/api/v7/convert', {
      "apiKey": "e574fca3788d7ebe84c4",
      "q": "${from}_${to}",
      "compact": "ultra"
    });
    http.Response response = await http.get(rateUrl);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return body["${from}_${to}"];
    } else {
      throw Exception("Failed to connect to API");
    }
  }
}
