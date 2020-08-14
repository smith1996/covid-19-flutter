import 'package:covid19/src/screens/country/widgets/country_list.dart';
import 'package:flutter/material.dart';

class CountrySearch extends SearchDelegate {
  final List<String> countries;
  CountrySearch({@required this.countries});

  @override
  List<Widget> buildActions(BuildContext context) {
    //Crear los iconos para el App Bar. Icono limpiar y cancelar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();
    final filterdList = filterByCounty(countries, query);
    return CountryList(countries: filterdList);
  }

  List<String> filterByCounty(List<String> list, String name) {
    final listFiltered = new List<String>();
    list.forEach((country) {
      if (country.toLowerCase().contains(name.toLowerCase())) {
        listFiltered.add(country);
      }
    });
    return listFiltered;
  }
}
