import 'package:cycle_bike_mfu/booking_confirm_page.dart';
import 'package:cycle_bike_mfu/booking_page.dart';
import 'package:cycle_bike_mfu/functions.dart';
import 'package:cycle_bike_mfu/history_page.dart';
import 'package:cycle_bike_mfu/home_page.dart';
import 'package:cycle_bike_mfu/qrcode_page.dart';
import 'package:flutter/material.dart';
import 'Profile_page.dart';

class Home_main extends StatefulWidget {
  const Home_main({super.key});

  @override
  State<Home_main> createState() => _Home_mainState();
}

class _Home_mainState extends State<Home_main> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const HistoryPage(),
    const qrcode_page(),
    BookingPage(bookBicycle: const [])
  ];
  static const List<String> _appBarTitles = <String>[
    'Home',
    'History',
    'QR-Code',
    'Booking',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
        backgroundColor: Color.fromARGB(255, 156, 40, 32),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Add your navigation code here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage()), //change
                  );
                },
                child: Icon(
                  Icons.person,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 156, 40, 32),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.qr_code),
            label: "QR-Code",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.book),
            label: "booking",
          ),
        ],
      ),
    );
  }
}
