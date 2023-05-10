import 'package:flutter/material.dart';
import 'functions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            CustomTextField(
              hintText: 'Email',
              controller: TextEditingController(),
            ), //Email
            CustomTextField(
              hintText: 'PassWord',
              controller: TextEditingController(),
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