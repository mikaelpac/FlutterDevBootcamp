//TODO: Add your imports here.
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  'NANO',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/NANO/USD';
const apiKey = '?apikey=C8F185B6-FBD0-4EFF-B9D6-F7530E10A196';

class CoinData {
  //TODO: Create your getCoinData() method here.
  Future getCoinData() async {
    http.Response response = await http.get('$coinAPIURL$apiKey');

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
    }
  }
}
