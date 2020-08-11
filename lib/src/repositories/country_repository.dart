import 'package:covid19/src/models/country.dart';
import 'package:covid19/src/network/api_client.dart';

class CountryRespository {
  var _apiClient = APIClient();

  Future<Country> getCountries() async {
    final response = await _apiClient.get('/countries');
    return Country.fromJson(response);
  }
}
