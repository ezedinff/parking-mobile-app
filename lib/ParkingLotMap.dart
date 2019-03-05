import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingLotMap extends StatefulWidget {
  ParkingLotMap({this.lat, this.lon, this.title});
  String title;
  double lat, lon;
  @override
  State<StatefulWidget> createState() {
    return new ParkingLotMapState(lat: this.lat, lon: this.lon, title: this.title);
  }
}

class ParkingLotMapState extends State<ParkingLotMap> {
  Completer<GoogleMapController> _controller = Completer();
  ParkingLotMapState({this.lat, this.lon, this.title});
  double lat, lon;
  String title;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(8.989722, 38.7839967),
    zoom: 18.4746,
  );

  void initState() {
    _goToTheLake();
  }
  addm() async {
    final GoogleMapController controller = await _controller.future;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        trackCameraPosition: true,
        markers: Set<Marker>.of(
          <Marker>[
            Marker(
              markerId: MarkerId("test_marker_id"),
              position: LatLng(this.lat, this.lon),
              infoWindow: InfoWindow(
                title: this.title,
                snippet: '2 slots left',
              ),
            )
          ],
        ),
      )
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(this.lat, this.lon),
            tilt: 59.440717697143555,
            zoom: 24.151926040649414
        )
    ));
  }
}
