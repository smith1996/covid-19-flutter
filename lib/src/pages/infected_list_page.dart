import 'package:covid19/src/models/infected_model.dart';
import 'package:covid19/src/providers/country_provider.dart';
import 'package:covid19/src/utils/util.dart';
import 'package:covid19/src/widgets/infected_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfectedListPage extends StatefulWidget {
  @override
  _InfectedListPage createState() => _InfectedListPage();
}

class _InfectedListPage extends State<InfectedListPage> {
  final countryProvider = new CountryProvider();
  List<History> listHistory = new List();
  int selectedIndex = 0;
  bool showOnlyTime = true;
  List<Widget> screens = [];

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context).settings.arguments;
    //countryProvider.getInfectedHistory(name);
    final country = name.replaceAll(new RegExp(r'-'), ' ');

    return Scaffold(
      appBar: _customAppBar(country),
      body: (showOnlyTime ? _infectedList(country) : screens[selectedIndex]),
    );
  }

  // MARK: - Build custom app bar
  PreferredSizeWidget _customAppBar(String country) {
    return AppBar(
      brightness: Brightness.light,
      title: Text(
        'Reporte de $country',
        style: TextStyle(color: Util.lettersColor),
      ),
      backgroundColor: Util.primaryColor,
      iconTheme: IconThemeData(color: Colors.black),
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
              borderColor: Colors.grey[300],
              selectedColor: Colors.black87,
              pressedColor: Colors.grey[100],
              children: Util.segmentsTitles,
              groupValue: selectedIndex,
              onValueChanged: (int value) {
                setState(() {
                  showOnlyTime = false;
                  selectedIndex = value;
                });
                print(selectedIndex);
              }),
        ),
      ),
    );
  }

  //SegmentedControl(infectedsHistory: listHistory)
  /*
  Container(
          width: 250.0,
          child: CupertinoSegmentedControl<int>(
              selectedColor: Colors.black,
              pressedColor: Colors.amber,
              groupValue: selectedIndex,
              children: {
                0: Text('Actual'),
                1: Text('Historial'),
              },
              onValueChanged: (int value) {
                print(value);
              }),
        )
   */

  // List<Widget> bodies = [
  //   Center(
  //     child: Text('Screen first'),
  //   ),
  //   Center(
  //     child: Text('Screen second'),
  //   ),
  // ];

  Widget _historyScreen() {
    return InfectedList(infected: listHistory);
  }

  Widget _currentScreen() {
    return InfectedList(infected: [listHistory.first]);
  }

  // MARK: - Build infected list
  Widget _infectedList(String country) {
    return FutureBuilder(
      future: countryProvider.getInfectedHistory(country),
      //initialData: [History()],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          listHistory = snapshot.data;
          screens.add(_currentScreen());
          screens.add(_historyScreen());
          return InfectedList(infected: [snapshot.data.first]);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    /*return ListView(
      children: <Widget>[
        _infectedCard(),
      ],
    );*/
  }
}
