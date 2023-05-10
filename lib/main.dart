import 'package:cycle_bike_mfu/cycle_bike_mfu_app.dart';
import 'package:cycle_bike_mfu/functions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(const CycleBikeMFU_App());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
