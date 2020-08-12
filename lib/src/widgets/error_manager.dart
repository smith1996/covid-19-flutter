import 'package:flutter/material.dart';

class ErrorManager extends StatelessWidget {
  final String message;
  final Function onRetryPressed;
  const ErrorManager({Key key, this.message, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(message, textAlign: TextAlign.center),
          SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.black87,
            child: Text('Reintentar', style: TextStyle(color: Colors.white)),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}
