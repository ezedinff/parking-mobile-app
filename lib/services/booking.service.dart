import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as j;

import 'auth.dart';
import '../flutkart.dart';

class BookingService {
  static String routePath = routePath + '/parking-slot-reservations';
  final auth = new Auth();
  book(customerId, hours) {
    auth.getToken().then((token) async {
      http.Response response = await http.post(
          Uri.encodeFull(routePath), headers: {
        "Accept": "application/json",
        "x-access-token": token
      }, body: {"customer_id": customerId, "duration_in_minutes": 60});
      return j.json.decode(response.body);
    });
  }
}