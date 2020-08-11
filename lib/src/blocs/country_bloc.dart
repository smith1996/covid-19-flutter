import 'dart:async';
import 'package:covid19/src/models/country.dart';
import 'package:covid19/src/network/response.dart';
import 'package:covid19/src/repositories/country_repository.dart';

class CountryBloc {
  CountryRespository _countryRespository;
  StreamController _countryStreamController;

  StreamSink<Response<Country>> get countrySink =>
      _countryStreamController.sink;
  Stream<Response<Country>> get countryStream =>
      _countryStreamController.stream;

  CountryBloc() {
    _countryStreamController = StreamController<Response<Country>>();
    _countryRespository = CountryRespository();
    fetchCountryList();
  }

  void fetchCountryList() async {
    countrySink.add(Response.loading('Fetching countries'));
    try {
      Country countries = await _countryRespository.getCountries();
      print(countries.items);
      countrySink.add(Response.successful(countries));
    } catch (error) {
      print(error.toString());
      countrySink.add(Response.error(error.toString()));
    }
  }

  dispose() {
    _countryStreamController?.close();
  }
}
