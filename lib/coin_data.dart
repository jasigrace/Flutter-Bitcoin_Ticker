import 'package:http/http.dart' as http;
import 'dart:convert';

const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'FB2770A0-8B68-4C94-8A71-D360DD0E27E7';

class CoinData{
  Future getCoinData(String selectedCurrency) async{
    Map<String, String> cryptoPrices = {};
    for(String crypto in cryptoList){
      String url = '$coinApiUrl/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(url);
      String data = response.body;
      if(response.statusCode == 200){
        var decodedData = jsonDecode(data);
        double lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      }else{
        print(response.statusCode);
      }
    }
    return cryptoPrices;
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
