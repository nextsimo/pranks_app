import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prank/src/models/ads_model.dart';

import 'admob_service.dart';
import 'facebook_ads_service.dart';

class AdsService {
  static final AdmobService admob = AdmobService();
  static final FacebookAdsService facebook = FacebookAdsService();

  List<AdsModel> banners = [];

  AdsService() {
    fetchbanners();
  }
  Future<void> fetchbanners() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('ads')
        .where('type', isEqualTo: 'banner')
        .get();

    banners = adsModelFromDocuments(query.docs);
  }
}
