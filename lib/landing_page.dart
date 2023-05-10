import 'package:flutter/material.dart';
import 'Login_Page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Landing.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 1.0),
            const Text(
              'Cycle Bike MFU ',
              style: TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'This mobile app is for MFU university students. It allows them to easily rent and return bikes on campus. The app features a user-friendly interface. With this app, students can save time and reduce carbon footprint by using a sustainable mode of transportation.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            title: '',
                          )),
                );
              },
              child: const Text(
                "Let's Go",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
