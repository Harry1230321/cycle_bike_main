import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';

//Animated button
class AnimatedButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  const AnimatedButton({Key? key, required this.text, required this.onPressed})
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

//Complete and cancel button
class ToggleWidget extends StatefulWidget {
  const ToggleWidget({Key? key}) : super(key: key);

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool _isComplete = false;

  void _toggleStatus() {
    setState(() {
      _isComplete = !_isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 70.0,
          width: 200.0,
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black)),
          child: GestureDetector(
            onTap: () {
              _toggleStatus();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                _isComplete ? "Cancelled" : "Completed",
                style: const TextStyle(color: Colors.green, fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
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
        _bookingId = _generateBookingId();

  String get bookingId => _bookingId;

  String get getTypeOfBike => _typeOfBike;

  set typeOfBike(String typeOfBike) {
    _typeOfBike = typeOfBike;
  }

  String get getImageAssetPath => _imageAssetPath;

  set imageAssetPath(String imageAssetPath) {
    _imageAssetPath = imageAssetPath;
  }

  static String _generateBookingId() {
    final random = Random();
    final alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final digits = '0123456789';
    final alphaNumeric = alphabet + digits;
    String bookingNumber = '';

    // Generate 3 random uppercase letters
    for (int i = 0; i < 3; i++) {
      int randomIndex = random.nextInt(alphabet.length);
      bookingNumber += alphabet[randomIndex];
    }

    // Generate 3 random digits
    for (int i = 0; i < 3; i++) {
      int randomIndex = random.nextInt(digits.length);
      bookingNumber += digits[randomIndex];
    }

    // Generate 2 random alphanumeric characters
    for (int i = 0; i < 2; i++) {
      int randomIndex = random.nextInt(alphaNumeric.length);
      bookingNumber += alphaNumeric[randomIndex];
    }

    return bookingNumber;
  }

  Map<String, dynamic> toJson() {
    return {
      "bookingId": bookingId,
      "type": getTypeOfBike,
      "image": getImageAssetPath,
    };
  }
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
bicycles.forEach((bicycle) {
  database.reference().child("bicycles").push().set(bicycle.toJson()).then((value) {
    print("Bicycle added successfully!");
  }).catchError((error) {
    print("Failed to add bicycle: $error");
  });
});
