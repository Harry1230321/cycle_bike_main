import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/home');
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

  //Logo
  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      height: 130.0,
      width: 130.0,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Image.asset('assets/images/mfu_logo.png'),
    );
  }

  //heading
  Widget _buildHeading() {
    return Column(
      children: const <Widget>[
        Text(
          'Cycle Buddy MFU',
          style: TextStyle(
            color: Color.fromARGB(255, 156, 40, 32),
            fontWeight: FontWeight.normal,
            fontSize: 38,
          ),
        ),
        Text(
          'Log In Now',
          style: TextStyle(
            color: Color.fromARGB(255, 156, 40, 32),
            fontWeight: FontWeight.normal,
            fontSize: 32,
          ),
        ),
        Text(
          'Please login to continue',
          style:
              TextStyle(color: Color.fromARGB(255, 156, 40, 32), fontSize: 15),
        ),
      ],
    );
  }

  //emailField
  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(labelText: 'Email'),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
    );
  }

  Widget _buildErrorMessage() {
    return _error != null
        ? Text(
            _error!,
            style: const TextStyle(color: Color.fromARGB(255, 156, 40, 32)),
          )
        : Container();
  }

  Widget _buildLoginButton() {
    return Container(
      alignment: Alignment.center,
      height: 80.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedButton(
            text: "Log In",
            onPressed: _login,
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Don't have an account  ",
          style: TextStyle(),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/signup');
          },
          child: const Text(
            'Sign up',
            style: TextStyle(
              color: Color.fromARGB(255, 156, 40, 32),
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildLogo(),
            _buildHeading(),
            _buildEmailField(),
            _buildPasswordField(),
            _buildErrorMessage(),
            _buildLoginButton(),
            _buildSignUpLink(),
          ],
        ),
      ),
    );
  }
}
