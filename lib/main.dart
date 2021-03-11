import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prank/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prank/src/utils/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  setup();
  runApp(MyApp());
}
