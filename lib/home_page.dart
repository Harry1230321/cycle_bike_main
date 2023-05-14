import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cycle_bike_mfu/bike_info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _bicycles =
      FirebaseFirestore.instance.collection('bicycles');
  DocumentSnapshot? _selectedBicycle; // Store the selected bicycle document

  void onTappedBar(int index) {
    setState(() {});
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
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        documentSnapshot['imageAssetPath'],
                        width: 50,
                        height: 50,
                      ),
                    ),
                    title: Text(
                      documentSnapshot['cycleName'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 156, 40, 32),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 156, 40, 32),
                    ),
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
                  ),
                );
              },
            );
          }
          return const Center(
              child:
                  CircularProgressIndicator()); // Return a centered loading indicator while data is loading
        },
      ),
    );
  }
}
