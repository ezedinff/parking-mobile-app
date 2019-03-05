import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as j;
import '../flutkart.dart';
import './auth.dart';

class ParkingLotService {
  static String parking_lots = "/parking-lots";
  final Auth auth = new Auth();

   getParkingLots() async {
    return auth.getToken().then((token) async {
      http.Response response = await http.get(
          Uri.encodeFull(Flutkart.baserUrl + parking_lots), headers: {
        "Accept": "application/json",
        "x-access-token": token
      });
      return j.json.decode(response.body);
    });
  }
}