import 'dart:developer';
import 'dart:io';

import 'package:applovin/applovin.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/models/ads_model.dart';
import 'package:prank/src/services/ads/ads_service.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:unity_ads_plugin/unity_ads.dart';

Future<dynamic> navigateTo(BuildContext context, Widget page) async {
  return await Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => page));
}

void back(BuildContext context) {
  Navigator.of(context).pop();
}

customShwoBottomSheet(Widget widget, BuildContext context) {
  showBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

String getImagePath(String name) {
  return "https://firebasestorage.googleapis.com/v0/b/wallpaper-prank.appspot.com/o/papers%2F$name?alt=media";
}

Future<bool> rateMyApp(BuildContext context) async {
  bool res = false;
  RateMyApp rateMyApp = RateMyApp();
  await rateMyApp.showRateDialog(context,
      listener: (RateMyAppDialogButton rate) {
    if (rate == RateMyAppDialogButton.rate) {
      // unlock
      res = true;
      return true;
    }
    res = false;
    return false;
  });
  rateMyApp.reset();
  rateMyApp = null;
  return res;
}

Future<bool> buildIntertitialAtIndex(int index) async {
  try {
    await loadIntertitial(adsService.interstials.elementAt(index));
    return true;
  } catch (e) {
    log(e);
    return false;
  }
}

Future<void> loadIntertitial(AdsModel adsModel) async {
  switch (adsModel.company) {
    case 'google':
      await showGoogleIntertitial(adsModel);
      break;
    case 'facebook':
      await showFacebookIntertitial(adsModel);
      break;
    case 'unity':
      await showUnityIntertitial(adsModel);
      break;
    case 'applovin':
      await showApplovinIntertitial(adsModel);
  }
}

Future<void> showGoogleIntertitial(AdsModel adsModel) async {
  if (Platform.isAndroid) {
    await AdsService.admob.showIterstitial(adsModel.androidToken);
  } else if (Platform.isIOS) {
    await AdsService.admob.showIterstitial(adsModel.iosToken);
  }
}

Future<void> showFacebookIntertitial(AdsModel adsModel) async {
  if (Platform.isAndroid) {
    await FacebookAudienceNetwork.loadInterstitialAd(
        placementId: adsModel.androidToken);
    await FacebookAudienceNetwork.showInterstitialAd();
  } else if (Platform.isIOS) {
    await FacebookAudienceNetwork.loadInterstitialAd(
        placementId: adsModel.androidToken);
    await FacebookAudienceNetwork.showInterstitialAd();
  }
}

Future<void> showUnityIntertitial(AdsModel adsModel) async {
  await UnityAds.isReady(placementId: adsModel.token);
  await UnityAds.showVideoAd(placementId: adsModel.token);
}

Future<void> showApplovinIntertitial(AdsModel adsModel) async {
  await AppLovin.requestInterstitial((listener) {});
  await AppLovin.showInterstitial();
}
