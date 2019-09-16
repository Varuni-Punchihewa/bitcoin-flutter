import 'dart:convert';
import 'package:flutter/cupertino.dart';
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
];

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  //TODO: Create your getCoinData() method here.
  Future getCoinData({@required String currency}) async {
    http.Response response;
    List lastPrice = [];
    try {
      for (int i = 0; i < cryptoList.length; i++) {
        response =
            await http.get('$bitcoinAverageURL/${cryptoList[i]}$currency');
        if (response.statusCode == 200) {
          var decodedData = jsonDecode(response.body);
          double last = decodedData['last'];
          lastPrice.add(last);
        }
      }
      return lastPrice;
    } catch (e) {
      print(e);
      print(response.statusCode);
    }
  }
}
