import 'package:covid19/src/models/infected_model.dart';
import 'package:covid19/src/widgets/infected_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentedControl extends StatefulWidget {
  final List<History> infectedsHistory;

  SegmentedControl({this.infectedsHistory});

  @override
  _SegmentedControlState createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0, //250
      child: CupertinoSegmentedControl<int>(
          selectedColor: Colors.black,
          pressedColor: Colors.amber,
          children: {
            0: Text('Actual'),
            1: Text('Historial'),
          },
          onValueChanged: (int value) {
            print(value);
            setState(() {
              if (value != 0) {
                InfectedList(infected: widget.infectedsHistory);
              } else {
                InfectedList(infected: [widget.infectedsHistory.first]);
              }
            });
          }),
    );
  }

  /*_setStateSegmented() {
    setState(() {
      current = 0;
    });
  }*/
}
