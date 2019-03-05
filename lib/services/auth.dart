import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as j;

class Auth {
  static String baserUrl = 'http://10.5.59.142:3000/api/auth';
  static String loginUrl = baserUrl +'/sign-in';
  static String meUrl = baserUrl + '/me';
  final headers = {
    "Accept": "application/json"
  };

   Future<bool> login(username, password) async {
    http.Response response = await http.post(Uri.encodeFull(loginUrl), headers: headers, body: {"username": username, "password": password});
    setToken(j.json.decode(response.body)['token']);
    return j.json.decode(response.body)['auth'];
  }
  Future<bool> setToken(String accessToken) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.setString("token", accessToken);
  }
  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get("token") ?? '0';
  }
  getHeaderAuth() async {

     return {
       "Accept": "application/json",
       "x-access-token": await getToken()
     };
  }
   authenticated() async {
    getToken().then((onValue) async {
      http.Response response = await http.get(Uri.encodeFull(meUrl), headers: {
        "Accept": "application/json",
        "x-access-token": onValue
      });
      return j.json.decode(response.body)['auth'];
    });
  }
}