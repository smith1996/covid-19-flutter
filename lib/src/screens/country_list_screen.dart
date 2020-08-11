import 'package:covid19/src/utilities/app.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(context),
      body: _countryListView(),
    );
  }

  // MARK: - Build custom app bar
  PreferredSizeWidget _customAppBar(BuildContext context) {
    return AppBar(
      title: Text(countryListTitle),
      centerTitle: false,
      actions: <Widget>[
        _searchIconButton(context),
      ],
    );
  }

  // MARK: - Build search icon button
  IconButton _searchIconButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        //showSearch(
        //  context: context, delegate: DataSearch(countries: data), query: '');
        print('Presiono boton Buscar');
      },
    );
  }

  Widget _countryListView() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Item 1'),
          onTap: () {},
        ),
        Divider(),
        ListTile(title: Text('Item 2')),
        Divider(),
        ListTile(title: Text('Item 3')),
        Divider(),
      ],
    );
  }
}
