import 'package:flutkart/services/auth.dart';
import 'package:flutkart/services/parking-lot.service.dart';
import 'package:flutter/material.dart';

class ParkingSlotItem extends StatelessWidget {
  final String title;
  final String rate;
  final height;
  final number;
  final Auth auth = new  Auth();
  final parkingLots = new ParkingLotService();
  ParkingSlotItem(this.title, this.rate, this.height, this.number);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Center(
                      child: new CircleAvatar(child: new Text(number), minRadius: 25,),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Parking Area: " + title, textAlign: TextAlign.left,),
                        Text("Rate: " + rate + "", textAlign: TextAlign.left),
                        Text("Height: " + height + "meter"),
                        ButtonBar(
                          children: <Widget>[
                            MaterialButton(
                              child: Text("Book", style: TextStyle(color: Colors.white),),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: (()  {
                                parkingLots.getParkingLots().then((onValue) => print(onValue));
                              }),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Text("VIP"),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
