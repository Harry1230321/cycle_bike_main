import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class qrcode_page extends StatefulWidget {
  const qrcode_page({super.key});

  @override
  State<qrcode_page> createState() => _qrcode_pageState();
}

class _qrcode_pageState extends State<qrcode_page> {

  final String data ="6431503129";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Text("Your Student ID : $data", 
            style: const TextStyle(fontSize: 24,),
            ),
            const SizedBox(height: 16,),
            QrImage(data:
               data,
               gapless: true,
               errorCorrectionLevel: QrErrorCorrectLevel.Q,)

           ],
          )
        ),


    );
  }
}