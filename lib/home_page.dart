import 'package:cycle_bike_mfu/booking_page.dart';
import 'package:cycle_bike_mfu/history_page.dart';
import 'package:cycle_bike_mfu/qrcode_page.dart';
import 'package:flutter/material.dart';
import 'package:cycle_bike_mfu/bike_info_page.dart';
import 'package:cycle_bike_mfu/functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryPage(),
    qrcode_page(),
    BookingPage(
      bookBicycle: [],
    )
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation to the corresponding screen based on the index of the tapped item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bicycles.length,
        itemBuilder: (context, index) {
          final bicycle = bicycles[index];
          return ListTile(
            leading: Image.asset(
              bicycle.getImageAssetPath,
              width: 50,
              height: 50,
            ),
            title: Text(bicycle.getTypeOfBike),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BikeInfoPage(bicycle: bicycle),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
