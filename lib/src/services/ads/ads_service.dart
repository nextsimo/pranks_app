import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/models/ads_model.dart';

import 'admob_service.dart';
import 'facebook_ads_service.dart';

class AdsService with ChangeNotifier {
  static final AdmobService admob = AdmobService();
  static final FacebookAdsService facebook = FacebookAdsService();

  List<AdsModel> _banners = [];
  List<AdsModel> interstials = [];

  List<AdsModel> get banners => _banners;

  set banners(List<AdsModel> banners) {
    _banners = banners;
    notifyListeners();
  }

  AdsService() {
    fetchbanners();
    fetchInterstials();
  }

  loadInterstial(int index) {
    try {
      AdsModel ad1 = interstials.first;
      AdsModel ad2 = interstials.elementAt(1);
      AdsModel ad3 = interstials.elementAt(2);
      switch (index) {
        case 1:
          switch (ad1.company) {
            case 'google':
              if (Platform.isAndroid)
                admob.showIterstitial(ad1.androidToken);
              else if (Platform.isIOS) admob.showIterstitial(ad1.iosToken);
              break;
            case 'facebook':
              if (Platform.isAndroid)
                FacebookInterstitialAd.loadInterstitialAd(
                  placementId: ad1.androidToken,
                );
              else if (Platform.isIOS) admob.showIterstitial(ad1.iosToken);

              FacebookInterstitialAd.loadInterstitialAd(
                placementId: ad1.androidToken,
              );
              break;
            case 'unity':

            default:
          }
          break;
        case 2:
          break;
        case 3:
          break;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> fetchInterstials() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('ads')
        .where('type', isEqualTo: 'interstitial')
        .get();

    interstials = adsModelFromDocuments(query.docs);
  }

  Future<void> fetchbanners() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('ads')
        .where('type', isEqualTo: 'banner')
        .get();

    banners = adsModelFromDocuments(query.docs);
  }
}
