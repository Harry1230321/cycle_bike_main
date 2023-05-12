import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String bookingId = '';

  void _confirmBooking() {
    FirebaseFirestore.instance
        .collection('bookedBicycles')
        .doc(bookingId)
        .get()
        .then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        final bool confirmed = data['confirmed'] ?? false;
        final String imageAssetPath = data['imageAssetPath'];
        final String cycleName = data['cycleName'];

        if (!confirmed) {
          FirebaseFirestore.instance
              .collection('bookedBicycles')
              .doc(bookingId)
              .update({'confirmed': true}).then((_) {
            _showSnackBar('Booking confirmed successfully!');
            // Navigate to the success screen or perform any other necessary actions
          });
        } else {
          _showSnackBar('Booking already confirmed!');
        }

        // Display the imageAssetPath and cycleName
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Booking Details'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    imageAssetPath,
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 16),
                  Text('Cycle Name: $cycleName'),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        _showSnackBar('Invalid booking ID!');
        // Show an error message or handle the case accordingly
      }
    });
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(''),
            TextField(
              onChanged: (value) {
                setState(() {
                  bookingId = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter Booking ID',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _confirmBooking,
              child: Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
