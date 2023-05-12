import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _error;

  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _error = 'Please fill in all fields.';
      });
      return;
    }
    Navigator.pushReplacementNamed(context, '/home');
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _error = 'No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _error = 'Wrong password provided for that user.';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 130.0,
              width: 130.0,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Image.asset('assets/images/mfu_logo.png'),
            ), //<<<<<<<<<<<<<<<<<<<Logo
            const Text(
              'Log In Now',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                  fontSize: 38),
            ),
            const Text(
              'Please login to continue',
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 80.0,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedButton(
                    text: "Log In",
                    onPressed: () {
                      _login();
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
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
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                child: const Image(
                    image: NetworkImage(
                        'https://img.icons8.com/color/512/google-logo.png'))),
          ],
        ),
      ),
    );
  }
}
