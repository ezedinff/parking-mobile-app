import 'package:flutter/material.dart';

import './timer.dart';
import './parking-slot.dart';
import 'parkingLot.page.dart';
class ParkingLotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParkingLotPageState();
  }
}

class ParkingLotPageState extends State<ParkingLotPage> {
  int _currentIndex = 0;
  final List<Widget> _childred = [
    ParkingLot(),
    Timer(),
    ParkingSlot(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Parkit",
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: _childred[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text("Home")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.timer), title: Text("Timer")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text("Person")),
                ]),
          ),
      )
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
