//import 'package:covid19/src/models/country.dart';
//import 'package:covid19/src/repositories/country_repository.dart';
import 'package:covid19/src/screens/country/widgets/country_list.dart';
import 'package:covid19/src/utilities/app.dart';
import 'package:flutter/material.dart';
import 'package:covid19/src/blocs/country_bloc.dart';
import 'package:covid19/src/models/country.dart';
import 'package:covid19/src/network/response.dart';

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
      body: _countryBody(),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
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

  Widget _countryBody() {
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
              final countryList = snapshot.data.data.items;
              return CountryList(countries: countryList);
              break;
            default:
              //final message = snapshot.data.message;
              return _error(); //Center(child: Text(snapshot.data.message));
              break;
          }
        }
        return Container();
      },
    );
  }

  Widget _error() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Hubo un error en la conexion. Intentalo mas tarde.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              )),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.black87,
            child: Text('Reintentar', style: TextStyle(color: Colors.white)),
            onPressed: () => _bloc.fetchCountryList(),
          )
        ],
      ),
    );
  }
}
