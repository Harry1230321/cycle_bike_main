import 'package:cycle_bike_mfu/Home_main.dart';
import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'Login_Page.dart';
import 'SignUp_Page.dart';
import 'BioGraph_page.dart';
import 'Contact_page.dart';
import 'Profile_page.dart';

// ignore_for_file: camel_case_types
class CycleBikeMFU_App extends StatelessWidget {
  const CycleBikeMFU_App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LandingPage(),
      routes: <String, WidgetBuilder>{
        '/profile': (context) => ProfilePage(),
        '/biography': (context) => const BiographyPage(),
        '/contact': (context) => const ContactPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/signup': (BuildContext context) => SignUpPage(title: 'SignUp'),
        '/home': ((context) => const Home_main()),
      },
    );
  }
}
