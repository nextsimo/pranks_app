import 'dart:io';

import 'package:applovin/applovin.dart';
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
  await FacebookAudienceNetwork.init();
  AppLovin.init();
  await MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
      testDeviceIds: ['A6C34EE153CB1B4FD1C61C489D082642']));
  if (Platform.isAndroid)
    UnityAds.init(gameId: '4043833', testMode: true);
  else if (Platform.isIOS) UnityAds.init(gameId: '4043832', testMode: true);

  setup();
  runApp(MyApp());
}
