import 'package:covid19/src/screens/country/widgets/country_list.dart';
import 'package:covid19/src/utilities/app.dart';
import 'package:covid19/src/widgets/error_manager.dart';
import 'package:covid19/src/widgets/loader_manager.dart';
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
      body: _getCountry(),
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

  Widget _getCountry() {
    return StreamBuilder<Response<Country>>(
      stream: _bloc.countryStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final getData = snapshot.data;
          switch (getData.status) {
            case Status.LOADING:
              return LoaderManager(message: getData.message);
              break;
            case Status.SUCCESS:
              return CountryList(countries: getData.data.items);
              break;
            case Status.ERROR:
              return ErrorManager(
                message: 'Revise su conexión a internet y vuelve a intentar.',
                onRetryPressed: () => _bloc.fetchCountryList(),
              );
              break;
          }
        }
        return Container();
      },
    );
  }
}
