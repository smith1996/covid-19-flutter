import 'package:covid19/routes.dart';
import 'package:covid19/src/utilities/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: appTheme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
