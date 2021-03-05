import 'package:flutter/material.dart';
import 'package:prank/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prank/src/utils/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(MyApp());
}
