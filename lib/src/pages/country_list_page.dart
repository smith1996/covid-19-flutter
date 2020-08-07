import 'package:covid19/src/providers/country_provider.dart';
import 'package:covid19/src/utils/util.dart';
import 'package:covid19/src/widgets/country_list.dart';
import 'package:covid19/src/widgets/search/search_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryListPage extends StatelessWidget {
  final countryProvider = new CountryProvider();
  List<String> data = new List();

  // MARK: - Build main screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(context),
      body: _countryListView(),
    );
    /*CupertinoPageScaffold(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Covid-19: Países'),
            ),
          ];
        },
        body: _countryListView(),
      ),
    );*/

    /**/
  }

  // MARK: - Build custom app bar
  PreferredSizeWidget _customAppBar(BuildContext context) {
    return AppBar(
      brightness: Brightness.light,
      title: Text(
        'Covid-19: Países',
        style: TextStyle(color: Util.lettersColor),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Util.primaryColor,
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
        showSearch(
            context: context, delegate: DataSearch(countries: data), query: '');
        print('Presiono boton Buscar');
      },
    );
  }

  // MARK: - Build country list view
  Widget _countryListView() {
    return FutureBuilder(
      future: countryProvider.getCountries(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          this.data = snapshot.data;
          return CountryList(countries: data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  /*ListView _countryListView() {
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
  }*/

}
