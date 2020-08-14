import 'package:covid19/src/models/country.dart';
import 'package:covid19/src/models/history.dart';
import 'package:covid19/src/network/api_client.dart';

class HistoryRespository {
  var _apiClient = APIClient();

  Future<History> getInfectedHistory(String country) async {
    final response = await _apiClient.get('/history?country=$country');
    //print(response);
    return History.fromJson(response);
  }
}
