import 'package:covid19/src/blocs/history_bloc.dart';
import 'package:covid19/src/models/history.dart';
import 'package:covid19/src/network/response.dart';
import 'package:covid19/src/screens/history/widgets/infected_history_list.dart';
//import 'package:covid19/src/repositories/history_respository.dart';
import 'package:covid19/src/utilities/app.dart';
import 'package:covid19/src/widgets/error_manager.dart';
import 'package:covid19/src/widgets/loader_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfectedHistoryScreen extends StatefulWidget {
  String countrySelected;

  InfectedHistoryScreen({this.countrySelected});

  @override
  _InfectedHistoryScreenState createState() => _InfectedHistoryScreenState();
}

class _InfectedHistoryScreenState extends State<InfectedHistoryScreen> {
  //final repository = HistoryRespository();
  HistoryBloc _bloc;
  int selectedIndex = 0;
  List<Infected> infectedList = new List();
  List<Widget> screens = [];
  bool showOnlyTime = true;

  @override
  void initState() {
    _bloc = HistoryBloc(widget.countrySelected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    //final String name = ModalRoute.of(context).settings.arguments;
    //repository.getInfectedHistory(name);
    final country = widget.countrySelected;
    return Scaffold(
      appBar: _customAppBar(country),
      body: (showOnlyTime ? _getInfectedHistory(country) : screensChoose()),
    );
  }

  Widget screensChoose() {
    if (screens.length == 0) return Container();
    return screens[selectedIndex];
  }

  @override
  void dispose() {
    print('dispose screen');
    _bloc.dispose();
    super.dispose();
  }

  // MARK: - Build custom app bar
  PreferredSizeWidget _customAppBar(String name) {
    final title = name.replaceAll(new RegExp(r'-'), ' ');
    return AppBar(
      title: Text(infectedHistoryTitle + title),
      bottom: _customSegmentsControl(),
    );
  }

  // MARK: - Build custom segments control
  PreferredSize _customSegmentsControl() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 40.0),
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Container(
          width: 250.0,
          child: CupertinoSegmentedControl<int>(
              borderColor: Colors.black87,
              selectedColor: Colors.black87,
              pressedColor: Colors.grey[200],
              children: segmentsTitles,
              groupValue: selectedIndex,
              onValueChanged: (int value) {
                if (infectedList.length != 0) {
                  setState(() {
                    showOnlyTime = false;
                    selectedIndex = value;
                  });
                }
                print(selectedIndex);
              }),
        ),
      ),
    );
  }

  // MARK: - Build infected list
  Widget _getInfectedHistory(String country) {
    return StreamBuilder<Response<History>>(
      stream: _bloc.historyStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final getData = snapshot.data;
          switch (getData.status) {
            case Status.LOADING:
              return LoaderManager(message: getData.message);
              break;
            case Status.SUCCESS:
              addList(getData.data);
              return InfectedHistoryList(infected: [infectedList.first]);
              break;
            case Status.ERROR:
              return ErrorManager(
                message: 'Revise su conexión a internet y vuelve a intentar.',
                onRetryPressed: () =>
                    _bloc.fetchInfectedHistory(widget.countrySelected),
              );
              break;
          }
        }
        return Container();
      },
    );
  }

  void addList(History data) {
    infectedList = data.items;
    screens.add(_currentScreen());
    screens.add(_historyScreen());
  }

  Widget _historyScreen() {
    return InfectedHistoryList(infected: infectedList);
  }

  Widget _currentScreen() {
    return InfectedHistoryList(infected: [infectedList.first]);
  }
}
