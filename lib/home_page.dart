import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_bike_mfu/booking_page.dart';
import 'package:cycle_bike_mfu/history_page.dart';
import 'package:cycle_bike_mfu/qrcode_page.dart';
import 'package:flutter/material.dart';
import 'package:cycle_bike_mfu/bike_info_page.dart';
import 'package:cycle_bike_mfu/functions.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _bicycles =
      FirebaseFirestore.instance.collection('bicycles');
  DocumentSnapshot? _selectedBicycle; // Store the selected bicycle document

  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryPage(),
    qrcode_page(),
    BookingPage()
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
      body: StreamBuilder(
        stream: _bicycles.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return ListTile(
                  leading: Image.asset(
                    documentSnapshot['imageAssetPath'],
                    width: 50,
                    height: 50,
                  ),
                  title: Text(documentSnapshot['cycleName']),
                  onTap: () {
                    setState(() {
                      _selectedBicycle =
                          documentSnapshot; // Store the selected bicycle document
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BikeInfoPage(bicycle: _selectedBicycle!),
                      ),
                    );
                  },
                );
              },
            );
          }
          return CircularProgressIndicator(); // Return a loading indicator while data is loading
        },
      ),
    );
  }
}
