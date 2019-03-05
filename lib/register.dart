import 'package:flutter/material.dart';
// ignore: must_be_immutable
class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RegisterState();
  }
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                Image.asset("assets/banner.jpg", height: 200,),
                Form(
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0), // used for creating space between text fields
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Full Name",
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
                        ),
                      ),
                      SizedBox(height: 10.0), // used for creating space between text fields
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
                        ),
                      ),
                      SizedBox(height: 10.0), // used for creating space between text fields
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
                        ),
                      ),
                      SizedBox(height: 10.0), // used for creating space between text fields
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Plate Number",
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
                        ),
                      ),
                      SizedBox(height: 10.0), // used for creating space between text fields
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.blue,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: Text("Register", style: TextStyle(fontSize: 24),),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
