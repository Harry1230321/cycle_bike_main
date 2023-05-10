import 'package:cycle_bike_mfu/Home_main.dart';
import 'package:cycle_bike_mfu/booking_confirm_page.dart';
import 'package:flutter/material.dart';
import 'package:cycle_bike_mfu/functions.dart';

class BikeInfoPage extends StatefulWidget {
  final Bicycle bicycle;

  BikeInfoPage({required this.bicycle});
  @override
  State<BikeInfoPage> createState() => _BikeInfoPageState();
}

class _BikeInfoPageState extends State<BikeInfoPage> {
  bool isBooked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 16,
              child: SizedBox(
                height: 48,
                width: 48,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
            const Positioned(
              right: 16,
              top: 16,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: Text('MFU'),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              top: 100,
              child: Image.asset(
                widget.bicycle.getImageAssetPath,
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              top: 350,
              left: 24,
              right: 24,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'MFU',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                widget.bicycle.getTypeOfBike,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          'Available',
                          style: TextStyle(
                              color: Color.fromARGB(255, 64, 221, 69),
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                        'This bicycle is authorized for MFU students only. If we found that the user is not our students. We will enforce our terms and restrictions. The student must be required to return the equipment on time. Please be careful with your possessions . If they are broken or lost. We have the right to terminate your rental status.',
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Range",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "50mil",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Speed",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "75kmh",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Power",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "387wh",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    child: ElevatedButton(
                      onPressed: () {
                        bookbicycle.add(widget.bicycle);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingConfirmationPage(
                              bicycle: widget.bicycle,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Book',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
