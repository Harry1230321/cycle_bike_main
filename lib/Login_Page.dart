import 'package:flutter/material.dart';
import 'main.dart';
import 'SignUp_Page.dart';
import 'functions.dart';
import 'Home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            ), //<<<<<<<<<<<<<<<<<<<Logo
            const Text(
              'Log In Now',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                  fontSize: 42),
            ),
            const Text(
              'Please login to continue',
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: PasswordTextField(),
            ),
            Container(
              alignment: Alignment.center,
              height: 80.0,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: AnimatedButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    "Dont have an account",
                    style: TextStyle(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              ' Or connect with ',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            Container(
                height: 80.0,
                width: 80.0,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: const Image(
                    image: NetworkImage(
                        'https://img.icons8.com/color/512/google-logo.png'))),
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}