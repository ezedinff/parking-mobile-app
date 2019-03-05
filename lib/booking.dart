import 'package:flutter/material.dart';

import './services/booking.service.dart';
class Booking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookingState();
  }
}

class BookingState extends State<Booking> {
  int rate = 5;
  final String c = "5c6447e0b6db21605ebf5b48";
  final bookingSerivce = BookingService();
  int hours;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book")),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                    hintText: "Hour",
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
                ),
                onChanged: (String str) { this.hours = int.parse(str); },
              ),
              Text(rate.toString()),
              MaterialButton(
                height: 50.0,
                minWidth: 150.0,
                color: Colors.blue,
                splashColor: Colors.teal,
                textColor: Colors.white,
                child: Text("Pay", style: TextStyle(fontSize: 24, color: Colors.white),),
                onPressed: book(this.hours),
              )
            ],
          )
      )
    );
  }

  book(hours) {
    this.bookingSerivce.book(this.c, hours);
  }
}
