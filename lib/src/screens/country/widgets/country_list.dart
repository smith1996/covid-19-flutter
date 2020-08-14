import 'package:covid19/src/screens/history/infected_history_screen.dart';
import 'package:flutter/material.dart';

class CountryList extends StatelessWidget {
  final List<String> countries;

  CountryList({@required this.countries});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: countries.length,
      separatorBuilder: (context, index) => Divider(
        height: 1.0,
        color: Colors.black12,
      ),
      itemBuilder: (context, index) {
        return _countryItem(context, countries[index]);
      },
    );
  }

  Widget _countryItem(BuildContext context, String country) {
    return ListTile(
      title: Text(
        country.replaceAll(new RegExp(r'-'), ' '),
      ),
      onTap: () {
        print('Selecciono el pais: $country');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                InfectedHistoryScreen(countrySelected: country)));
        //Navigator.pushNamed(context, 'history', arguments: country);
      },
    );
  }
}
