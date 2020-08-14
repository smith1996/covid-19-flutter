import 'package:flutter/material.dart';
import 'package:covid19/src/models/history.dart';
import 'package:intl/intl.dart';

class InfectedHistoryList extends StatelessWidget {
  final List<Infected> infected;
  final nf = NumberFormat('#,###');

  InfectedHistoryList({@required this.infected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: infected.length,
      itemBuilder: (context, i) => _infectedItem(infected[i]),
    );
  }

  Widget _infectedItem(Infected data) {
    return Card(
      margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0), //all(13.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 10.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          padding: EdgeInsets.all(13.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Total de casos confirmados',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.85),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '🗓 ${data.day}',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.85),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    '${nf.format(data.cases.total)}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '⏰ 04:00 AM',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.85),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    '🟡 Casos activos',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.85),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${nf.format(data.cases.active)}',
                    style: TextStyle(
                      color: Color.fromRGBO(118, 118, 118, 1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    '🟢 Casos recuperados',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.85),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${nf.format(data.cases.recovered)}',
                    style: TextStyle(
                      color: Color.fromRGBO(118, 118, 118, 1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    '⚪️ Casos fatales',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.85),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${nf.format(data.deaths.total)}',
                    style: TextStyle(
                      color: Color.fromRGBO(118, 118, 118, 1.0),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
