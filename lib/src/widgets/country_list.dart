import 'package:flutter/material.dart';

class CountryList extends StatelessWidget {
  final List<String> countries;

  CountryList({@required this.countries});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: countries.map((country) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(
                country.replaceAll(new RegExp(r'-'), ' '),
              ),
              onTap: () {
                print('Selecciono el pais: $country');
                Navigator.pushNamed(context, 'infected', arguments: country);
              },
            ),
            Divider(height: 1.0),
          ],
        );
      }).toList(),
    );
  }
}
