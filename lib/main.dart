import 'dart:io';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prank/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:unity_ads_plugin/unity_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  await FacebookAudienceNetwork.init(
      testingId: '5e4a5298-1e7e-4db2-a821-595ded9d4ae0');
  if (Platform.isAndroid)
    UnityAds.init(gameId: '4043833');
  else if (Platform.isIOS) UnityAds.init(gameId: '4043832');
  setup();
  runApp(MyApp());
}
