import 'package:cycle_bike_mfu/booking_confirm_page.dart';
import 'package:cycle_bike_mfu/history_page.dart';
import 'package:cycle_bike_mfu/qrcode_page.dart';
import 'package:flutter/material.dart';
import 'package:cycle_bike_mfu/bike_info_page.dart';
import 'package:cycle_bike_mfu/functions.dart';

class BookingPage extends StatelessWidget {
  final List<Bicycle> bookBicycle;

  BookingPage({required this.bookBicycle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bookBicycle.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(bookBicycle[index].getTypeOfBike),
            subtitle: Text('Booking ID: ${bookBicycle[index].bookingId}'),
            leading: Image.asset(bookBicycle[index].getImageAssetPath),
          );
        },
      ),
    );
  }
}
