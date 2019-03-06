import 'package:flutter/material.dart';

import './parking-slot-item.dart';
import './my_navigator.dart';
class ParkingSlot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ParkingSlotState();
  }
}

class ParkingSlotState extends State<ParkingSlot> {
  static final imu = "https://lh3.googleusercontent.com/-mH4Px-gjBrM/AAAAAAAAAAI/AAAAAAAAADk/zqiNzJ-KY6w/photo.jpg";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.power_settings_new, color: Colors.white,),
              onPressed: () { MyNavigator.goToLogin(context); },
            )
          ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 24.0,),
          ProfileImage(imageUrl: imu, name: "Ezedin Fedlu",),
          SizedBox(height: 24.0),
          ProfileCard()
        ],
      )
    );
  }
}

class ProfileImage extends StatelessWidget {
  ProfileImage({this.imageUrl, this.name});
  final imageUrl;
  final name;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 190.0,
          height: 190.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(this.imageUrl),
              )
          ),
        ),
        SizedBox(height: 16.0,),
        Center(
          child: Text(this.name, style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
        )
      ],
    );
  }

}


class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return           Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      height: 50.0,
      decoration: BoxDecoration(
        border: Border(),
        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
        color: Colors.white70,
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.local_parking),
          SizedBox(width: 24.0,),
          Text("25446")
        ],
      ),
    );
  }
}
