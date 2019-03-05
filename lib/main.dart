import 'package:flutter/material.dart';
import './parking-lot.page.dart';
import './intro_screen.dart';
import './splash_screen.dart';
import './login.dart';
import './register.dart';
import './landingpage.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => ParkingLotPage(),
  "/intro": (BuildContext context) => IntroScreen(),
  "/login": (BuildContext context) => Login(),
  "/welcome" : (BuildContext context) => LandingPage(),
  "/register": (BuildContext context) => Register(),
};

void main() {
  runApp(new MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.blue, accentColor: Colors.black),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes)
  );
}