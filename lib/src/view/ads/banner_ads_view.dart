import 'dart:io';

import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:prank/src/models/ads_model.dart';
import 'package:prank/src/services/ads/ads_service.dart';

class BannerAdsView extends StatelessWidget {
  final AdsModel adsModel;

  const BannerAdsView({Key key, this.adsModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (adsModel.company) {
      case 'google':
        if (Platform.isIOS)
          AdsService.admob.loadBanner(adsModel.iosToken);
        else
          AdsService.admob.loadBanner(adsModel.androidToken);
        return AdWidget(
          ad: AdsService.admob.banner,
        );
      case 'facebook':
        return FacebookBannerAd(
          placementId:
              Platform.isAndroid ? adsModel.androidToken : adsModel.iosToken,
          bannerSize: BannerSize.STANDARD,
        );
      default:
        return SizedBox();
    }
  }
}
