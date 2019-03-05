import 'package:flutter/material.dart';

import 'services/auth.dart';

import './my_navigator.dart';
import 'dart:convert' as j;
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }

}

class LoginState extends State<Login>  with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  String username, password;
  final Auth auth = new Auth();
  String errorMessage = "";
  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
    // TODO check if the user is authenticated


  }
  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                Image.asset("assets/banner.jpg", height: 200,),
                SizedBox(height: 10.0), // used for creating space between text fields
                Text(errorMessage, style: TextStyle(color: Colors.red)),
                SizedBox(height: 10.0), // used for creating space between text fields
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
                  ),
                  onChanged: (String str) { username = str; },
                ),
                SizedBox(height: 10.0), // used for creating space between text fields
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
                  ),
                  onChanged: (String str) { password = str; },
                ),
                SizedBox(height: 10.0), // used for creating space between text fields
                new MaterialButton(
                  height: 50.0,
                  minWidth: 150.0,
                  color: Colors.blue,
                  splashColor: Colors.teal,
                  textColor: Colors.white,
                  child: Text("Login", style: TextStyle(fontSize: 24),),
                  onPressed: authenticate,
                )
              ],
            ),
          )
      ),
    );
  }
  void authenticate() {
    auth.login(username, password).then((res) {
      if (res) {
        MyNavigator.goToHome(context);
        print(res);
      } else { errorMessage = "Username or password is incorrect"; }
    });
  }

}