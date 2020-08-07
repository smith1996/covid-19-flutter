import 'dart:convert';

import 'package:covid19/src/models/country_model.dart';
import 'package:covid19/src/models/infected_model.dart';
import 'package:http/http.dart' as http;

class CountryProvider {
  String _url = 'covid-193.p.rapidapi.com';
  String _apiHost = 'covid-193.p.rapidapi.com';
  String _apiKey = '932bf90d22mshb3b4f26c2b4a52dp1ddaedjsn40028c30987b';

  Future<List<String>> getCountries() async {
    final url = Uri.https(_url, '/countries');

    final response = await http.get(
      url,
      headers: {
        'Host': '<calculated when request is sent>',
        'x-rapidapi-host': _apiHost,
        'x-rapidapi-key': _apiKey
      },
    );
    final decodeData = json.decode(response.body);
    //print(decodeData);
    final countries = Countries.fromJsonList(decodeData['response']);
    //print(countries.items);
    return countries.items;
  }

  Future<List<History>> getInfectedHistory(String country) async {
    final url = Uri.https(_url, '/history', {
      'country': country,
    });

    final response = await http.get(
      url,
      headers: {
        'Host': '<calculated when request is sent>',
        'x-rapidapi-host': _apiHost,
        'x-rapidapi-key': _apiKey
      },
    );
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body);
      //print(decodeData);
      final infected = InfectedHistory.fromJsonList(decodeData['response']);
      //print(infected.items);
      return infected.items;
    } else {
      final errorlist = List<History>();
      //print(infected.items);
      return errorlist;
    }
  }
}
