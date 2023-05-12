import 'package:flutter/material.dart';
import 'functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key, required this.title});
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _error;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48,
                  width: 48,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ],
            ),

            Container(
              alignment: Alignment.center,
              height: 130.0,
              width: 130.0,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Image.asset('assets/images/mfu_logo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 32,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    'Please Enter Your Credential',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            CustomTextField(
              hintText: 'Full Name',
              controller: TextEditingController(),
            ), //Full Name
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ), //Email
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ), //PassWord
            CustomTextField(
              hintText: 'Confirm Password',
              controller: TextEditingController(),
            ), //Confirm Password
            CustomTextField(
              hintText: 'Phone Number',
              controller: TextEditingController(),
            ), //Phone Number
            Container(
              alignment: Alignment.center,
              height: 70.0,
              width: 300.0,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: AnimatedButton(
                text: "Sign Up",
                onPressed: () {
                  _register();
                  Navigator.pushNamed(context, '/login');
                },
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

  const CustomTextField(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}
