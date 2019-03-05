import 'package:flutter/material.dart';
import './services/auth.dart';
import './my_navigator.dart';
import 'dart:convert' as j;
import 'package:http/http.dart' as http;

class LandingPage extends StatelessWidget {
  final auth = new Auth();
  @override
  Widget build(BuildContext context) {
    auth.getToken().then((token) async {
      http.Response response = await http.get(Uri.encodeFull(Auth.meUrl), headers: {
        "Accept": "application/json",
        "x-access-token": token
      });
      if (j.json.decode(response.body)['auth']) {
        MyNavigator.goToHome(context);
      }
      else {
        MyNavigator.goToLogin(context);
      }
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }
}