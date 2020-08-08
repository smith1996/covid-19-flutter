import 'package:covid19/src/utilities/app.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryListTitle),
      ),
    );
  }
}
