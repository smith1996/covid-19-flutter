import 'package:covid19/src/widgets/country_list.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  //final provider = new CountryProvider();
  String selection = '';
  final List<String> countries;
  DataSearch({@required this.countries});

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
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(selection),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();
    final listFiltered = filterByCounty(countries, query);
    return CountryList(countries: listFiltered);

    /*FutureBuilder(
      future: provider.getCountries(),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          final countries = snapshot.data;
          final filteredList = filterByCounty(countries, query);
          return ListView(
            children: filteredList.map((country) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      country.replaceAll(new RegExp(r'-'), ' '),
                    ),
                    onTap: () {
                      print('Selecciono el pais: $country');
                      Navigator.pushNamed(context, 'infected',
                          arguments: country);
                    },
                  ),
                  Divider(height: 1.0),
                ],
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );*/
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
