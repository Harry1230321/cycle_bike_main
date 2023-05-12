import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Animated button
class AnimatedButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final database = FirebaseDatabase.instance;

  AnimatedButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (tapDownDetails) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (tapUpDetails) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: _isPressed ? Colors.red[700] : Colors.red,
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Bicycle {
  String _bookingId;
  String _typeOfBike;
  String _imageAssetPath;

  Bicycle({required String typeOfBike, required String imageAssetPath})
      : _typeOfBike = typeOfBike,
        _imageAssetPath = imageAssetPath,
        _bookingId = const Uuid().v4();

  String get bookingId => _bookingId;

  String get getTypeOfBike => _typeOfBike;

  set typeOfBike(String typeOfBike) {
    _typeOfBike = typeOfBike;
  }

  String get getImageAssetPath => _imageAssetPath;

  set imageAssetPath(String imageAssetPath) {
    _imageAssetPath = imageAssetPath;
  }

  Map<String, dynamic> toJson() {
    return {
      "bookingId": bookingId,
      "typeOfBike": getTypeOfBike,
      "imageAssetPath": getImageAssetPath,
    };
  }
}

void selectBicycle(String typeOfBike, String imageURL) {
  // Generate a random booking ID
  String bookingId = Uuid().v4();

  // Create a new document with the generated booking ID
  DocumentReference bikeRef =
      FirebaseFirestore.instance.collection('bicycles').doc(bookingId);

  // Add the bicycle details to the document
  bikeRef.set({
    'bookingId': bookingId,
    'typeOfBike': typeOfBike,
    'image': imageURL,
  }).then((value) {
    print('Bicycle added to the database with booking ID: $bookingId');
    // Perform any additional operations or navigate to the next screen
  }).catchError((error) {
    print('Failed to add bicycle to the database: $error');
    // Handle the error appropriately
  });
}

Bicycle bicycle1 = Bicycle(
    typeOfBike: 'Electric Bicycle', imageAssetPath: 'assets/images/Bike.png');
Bicycle bicycle2 = Bicycle(
    typeOfBike: 'Mountain Bicycle', imageAssetPath: 'assets/images/Bike1.jpg');
Bicycle bicycle3 = Bicycle(
    typeOfBike: 'Classic Bicycle', imageAssetPath: 'assets/images/Bike2.png');
Bicycle bicycle4 = Bicycle(
    typeOfBike: 'Classic Bicycle with Basket',
    imageAssetPath: 'assets/images/Bike3.png');

List<Bicycle> bicycles = [
//Bicyclesssss
  bicycle1,
  bicycle2,
  bicycle3,
  bicycle4,
];
// Get a reference to the Firebase Realtime Database
final DatabaseReference database = FirebaseDatabase.instance.reference();

// Add the bicycles to the "bicycles" node
void addBicyclesToDatabase(List<Bicycle> bicycles) {
  final databaseReference = FirebaseDatabase.instance.reference();

  bicycles.forEach((bicycle) {
    databaseReference
        .child("bicycles")
        .push()
        .set(bicycle.toJson())
        .then((value) {
      print("Bicycle added successfully!");
    }).catchError((error) {
      print("Failed to add bicycle: $error");
    });
  });
}
