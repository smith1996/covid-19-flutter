import 'package:flutter/material.dart';

class Util {
  static Color primaryColor = Color.fromRGBO(248, 248, 248, 1.0);
  static Color lettersColor = Colors.black;
  static Map<int, Widget> segmentsTitles = const <int, Widget>{
    0: Text('Actual'),
    1: Text('Historial'),
  };
}
