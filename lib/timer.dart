import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TimerState();
  }
}

class TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 300,
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Card(
            elevation: 4,
            child: Center(
              child: Text(
                "00:25:00",
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
        ),
        SizedBox(height: 150),
        Container(
          child: Center(
            child: FloatingActionButton(
                onPressed: null, backgroundColor: Colors.redAccent, child: Icon(Icons.stop, color: Colors.white,), ),
          ),
        )
      ],
    );
  }
}
