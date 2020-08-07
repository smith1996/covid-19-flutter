import 'package:covid19/src/pages/country_list_page.dart';
import 'package:covid19/src/pages/infected_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.black),
      title: 'Covid-19',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => CountryListPage(),
        'infected': (BuildContext context) => InfectedListPage(),
      },
    );
    /*CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => CountryListPage(),
        'infected': (BuildContext context) => InfectedListPage(),
      },
    );*/
  }
}
