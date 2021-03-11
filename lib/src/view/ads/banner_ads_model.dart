import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prank/src/services/ads/ads_service.dart';

class BannerAdsViewModel with ChangeNotifier {
  bool _bannerLoaded = false;
  AdWidget newAddWidget;
  AdWithView adWithView;
  bool get bannerLoaded => _bannerLoaded;

  set bannerLoaded(bool bannerLoaded) {
    _bannerLoaded = bannerLoaded;
    notifyListeners();
  }

  void loadBanner(String token, bool newAdsWidget) async {
    if (_bannerLoaded) return;
    if (newAdsWidget) {
      adWithView = BannerAd(
          adUnitId: token,
          size: AdSize.mediumRectangle,
          listener: AdListener(),
          request: AdRequest());
      newAddWidget = AdWidget(ad: adWithView);
      return;
    }
    await AdsService.admob.loadBanner(token);
    AdsService.admob.adWidget = AdWidget(ad: AdsService.admob.banner);
    bannerLoaded = true;
  }
}
