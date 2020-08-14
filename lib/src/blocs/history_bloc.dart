import 'dart:async';

import 'package:covid19/src/models/history.dart';
import 'package:covid19/src/network/response.dart';
import 'package:covid19/src/repositories/history_respository.dart';

class HistoryBloc {
  HistoryRespository _historyRespository;
  StreamController _historyStreamController;

  StreamSink<Response<History>> get historySink =>
      _historyStreamController.sink;
  Stream<Response<History>> get historyStream =>
      _historyStreamController.stream;

  HistoryBloc(String country) {
    _historyStreamController = StreamController<Response<History>>();
    _historyRespository = HistoryRespository();
    fetchInfectedHistory(country);
  }

  void fetchInfectedHistory(String country) async {
    historySink.add(Response.loading('Buscando reporte de infectados'));
    try {
      History infecteds = await _historyRespository.getInfectedHistory(country);
      //print(countries.items);
      historySink.add(Response.successful(infecteds));
    } catch (error) {
      print(error.toString());
      historySink.add(Response.error(error.toString()));
    }
  }

  dispose() {
    _historyStreamController?.close();
  }
}
