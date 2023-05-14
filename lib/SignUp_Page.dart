import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'functions.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //firebase
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _error;

  //firebase
  Future<void> _register() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _error = 'Please fill in all fields.';
      });
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Get the user ID
      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('bookedBicycles')
          .add({});
      // Navigate to the home page or perform other actions after registration
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          _error = 'The password provided is too weak.';
        });
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _error = 'The account already exists for that email.';
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 130.0,
              width: 130.0,
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: Image.asset('assets/images/mfu_logo.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 3, top: 3),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 3, top: 3),
              child: Text(
                'Please Enter Your Credentials',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            CustomTextField(
              hintText: 'Email',
              controller: _emailController,
            ),
            CustomTextField(
              hintText: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _error!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 24.0),
              child: AnimatedButton(
                text: "Sign Up",
                onPressed: _register, //firebase
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[400],
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AnimatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
