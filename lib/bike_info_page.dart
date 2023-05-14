import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

class BikeInfoPage extends StatefulWidget {
  final DocumentSnapshot bicycle;
  const BikeInfoPage({super.key, required this.bicycle});
  @override
  State<BikeInfoPage> createState() => _BikeInfoPageState();
}

class _BikeInfoPageState extends State<BikeInfoPage> {
  //GenerateRandomBookingID
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

    // Add the selected bike's information along with the booking ID to the bookingBicycles collection in Firestore
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('bookedBicycles')
        .doc(bookingId)
        .set({
      'bookingId': bookingId,
      'cycleName': widget.bicycle['cycleName'],
      'imageAssetPath': widget.bicycle['imageAssetPath'],
      'confirmed': false,
    });

    // Navigate back to the home page
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 16,
            top: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
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
              child: Text(
                'MFU',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                const Text(
                  'MFU',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.bicycle['cycleName'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'This bicycle is authorized for MFU students only. If we find that the user is not our student, we reserve the right to enforce our terms and restrictions. Students must return the equipment on time. Please take care of your possessions. If they are broken or lost, we have the right to terminate your rental status.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Container(
              height: 84,
              width: 84,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.green[600]!, Colors.green[400]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: ElevatedButton(
                    onPressed: _bookBike,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
