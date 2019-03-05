import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'services/parking-lot.service.dart';
import 'dart:async';
import './ParkingLotMap.dart';
import './booking.dart';


class ParkingLot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParkingLotState();
  }

}

class ParkingLotState extends State <ParkingLot> {
  final parkinglotservice = new ParkingLotService();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List parkingLots;
  int _nextItem; // The next item inserted when the user presses the '+' button.
  @override
  void initState() {
    this.getData();
  }
  getData() {
    parkinglotservice.getParkingLots().then((lots) {
       this.setState(() {
           this.parkingLots = lots;
       });
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text("Profile")),
          body: ListView.builder(
            itemCount: parkingLots == null ? 0 : parkingLots.length,
            itemBuilder: _buildItem,
          ),
        )
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return CardItem(
      item: parkingLots[index],
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailParkingLot(index: index)));
      },
    );
  }

}
class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    this.onTap,
    @required this.item,
    this.selected = false
  });
  final VoidCallback onTap;
  final item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          height: 128.0,
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.asset("assets/car 1.png"),
                  width: 100.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(this.item['operating_company_name'], style: TextStyle(color: Colors.blue)),
                      Text("2 slots available"),
                      Text("Addis Ababa, Ethiopia"),
                      Expanded(
                        child:                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.call, color: Colors.blue),
                              onPressed: () => launch("tel:" + this.item['phone']),
                            ),
                            IconButton(
                              icon: Icon(Icons.directions, color: Colors.blue),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingLotMap(lat: this.item['location'][0], lon: this.item['location'][1], title: this.item['operating_company_name'])));
                              },
                            ),
                            Text(
                                "0.8Km"
                            ),
                            SizedBox(width: 10),
                            MaterialButton(
                              color: Colors.blue,
                              child: Text("Book", style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Booking()));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
  _call() async {
    if (await canLaunch("tel:+251923275571")) {
      await launch("tel:+251923275571");
    } else {
      throw 'Could not launch "tel:+251923275571"';
    }
  }
}

class DetailParkingLot extends StatelessWidget {

  final int index;
  DetailParkingLot({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("detail page")),
      body: Container(
        child: Text(this.index.toString()),
      ),
    );
  }

}