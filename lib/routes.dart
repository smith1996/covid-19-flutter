import 'package:flutter/material.dart';
import 'package:covid19/src/screens/country_list_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => CountryListScreen(),
};
