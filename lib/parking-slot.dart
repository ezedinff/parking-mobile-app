import 'package:flutter/material.dart';

import './parking-slot-item.dart';
class ParkingSlot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ParkingSlotState();
  }
}

class ParkingSlotState extends State<ParkingSlot> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: ListView(
            padding: EdgeInsets.all(8.0),
            children: <Widget>[
              ParkingSlotItem(
                "Friendship Mall",
                "2 ETB/hr",
                "3",
                "5"
              ),
              ParkingSlotItem(
                  "Friendship Mall",
                  "2 ETB/hr",
                  "3",
                  "5"
              ),
              ParkingSlotItem(
                  "Friendship Mall",
                  "2 ETB/hr",
                  "3",
                  "5"
              ),
              ParkingSlotItem(
                  "Friendship Mall",
                  "2 ETB/hr",
                  "3",
                  "5"
              ),
              ParkingSlotItem(
                  "Friendship Mall",
                  "2 ETB/hr",
                  "3",
                  "5"
              ),
            ]
        )
    );
  }
}
