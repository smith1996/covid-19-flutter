import 'package:http/http.dart' as http;
import 'package:covid19/src/network/Exception.dart';
import 'dart:convert';
import 'dart:io';

class APIClient {
  final String _baseUrl = 'https://covid-193.p.rapidapi.com';
  final Map<String, String> _headers = {
    'Host': '<calculated when request is sent>',
    'x-rapidapi-host': 'covid-193.p.rapidapi.com',
    'x-rapidapi-key': '932bf90d22mshb3b4f26c2b4a52dp1ddaedjsn40028c30987b',
  };

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url, headers: _headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw Exception('401 by Smith');
      case 403:
        throw UnauthorizedException('401 by Smith');
      case 500:
        throw Exception('500 by Smith');
      default:
        throw FetchDataException(
            'Error ocurred while communication with Server with Status Code: ${response.statusCode}');
    }
  }
}
