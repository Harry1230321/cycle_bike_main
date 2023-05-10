import 'package:flutter/material.dart';
import 'functions.dart';

class BookingConfirmationPage extends StatelessWidget {
  final Bicycle bicycle; // the selected bicycle object

  BookingConfirmationPage({required this.bicycle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),
      body: Column(
        children: [
          Image.asset(bicycle.getImageAssetPath),
          Text(
              'BookingId ${bicycle.bookingId}'), // generate a unique booking ID
          Text('Type of Bike: ${bicycle.getTypeOfBike}'),
          ElevatedButton(
            onPressed: () {
              // save booking details to storage
              // set isBookingConfirmed to true
              bookbicycle.add(bicycle);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Booking confirmed!'),
                ),
              );
            },
            child: Text('Confirm Booking'),
          ),
          ElevatedButton(
            onPressed: () {
              // set isBookingConfirmed to false

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Booking cancelled.'),
                ),
              );
            },
            child: Text('Cancel Booking'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigate back to the home screen and pass the booking confirmation status
          Navigator.pushNamed(context, '/home');
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
