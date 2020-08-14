import 'package:covid19/src/screens/history/infected_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid19/src/screens/country/country_list_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => CountryListScreen(),
  'history': (context) => InfectedHistoryScreen(),
};
