import 'package:covid19/src/blocs/country_bloc.dart';
import 'package:covid19/src/models/country.dart';
import 'package:covid19/src/network/response.dart';
//import 'package:covid19/src/models/country.dart';
//import 'package:covid19/src/repositories/country_repository.dart';
import 'package:covid19/src/utilities/app.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  //final countryRepository = CountryRespository();
  CountryBloc _bloc;

  @override
  void initState() {
    print('initState');
    _bloc = CountryBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
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
    return StreamBuilder<Response<Country>>(
      stream: _bloc.countryStream,
      //initialData: initialData ,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
              break;
            case Status.SUCCESS:
              print(snapshot.data.data.items);
              return Container();
              break;
            default:
              return Container(child: Text(snapshot.data.message));
              break;
          }
        }
        return Container();
      },
    );
    /*FutureBuilder(
      future: countryRepository.getCountries(),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<Country> snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.items);
          return Container();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );*/

    /*ListView(
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
    );*/
  }
}
