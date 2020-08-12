import 'package:flutter/material.dart';

class LoaderManager extends StatelessWidget {
  final String message;
  const LoaderManager({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(message),
          SizedBox(height: 15.0),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
