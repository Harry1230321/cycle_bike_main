import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

class BikeInfoPage extends StatefulWidget {
  final DocumentSnapshot bicycle;
  const BikeInfoPage({super.key, required this.bicycle});
  @override
  State<BikeInfoPage> createState() => _BikeInfoPageState();
}

class _BikeInfoPageState extends State<BikeInfoPage> {
  String generateBookingId() {
    int length = 8;
    final random = Random();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890';

    String result = '';
    for (var i = 0; i < length; i++) {
      final randomIndex = random.nextInt(chars.length);
      result += chars[randomIndex];
    }

    return result;
  }

  void _bookBike() {
    // Generate a randomized booking ID
    final String bookingId = generateBookingId();
    //final bool confirmed = false;

    // Add the selected bike's information along with the booking ID to the bookingBicycles collection in Firestore
    FirebaseFirestore.instance.collection('bookedBicycles').doc(bookingId).set({
      //'confirmed'
      'bookingId': bookingId,
      'cycleName': widget.bicycle['cycleName'],
      'imageAssetPath': widget.bicycle['imageAssetPath'],
      // Add other relevant fields
    });

    // Navigate back to the home page
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 16,
              child: SizedBox(
                height: 48,
                width: 48,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
            const Positioned(
              right: 16,
              top: 16,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: Text('MFU'),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              top: 100,
              child: Image.asset(
                widget.bicycle['imageAssetPath'],
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              top: 350,
              left: 24,
              right: 24,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'MFU',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                widget.bicycle['cycleName'], //cycleName
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        //'Available'
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                        'This bicycle is authorized for MFU students only. If we found that the user is not our students. We will enforce our terms and restrictions. The student must be required to return the equipment on time. Please be careful with your possessions . If they are broken or lost. We have the right to terminate your rental status.',
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(
                      height: 24,
                    ),
                  ]),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    child: ElevatedButton(
                      onPressed: _bookBike,
                      child: const Text(
                        'Book',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
