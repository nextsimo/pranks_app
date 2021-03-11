import 'dart:io';

import 'package:facebook_audience_network/ad/ad_banner.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/models/ads_model.dart';
import 'package:prank/src/services/ads/ads_service.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/view/ads/banner_ads_model.dart';
import 'package:provider/provider.dart';

class BannerAdsView extends StatefulWidget {
  final AdsModel adsModel;
  final bool buildnewAdsWidget;

  const BannerAdsView({Key key, this.adsModel, this.buildnewAdsWidget = false})
      : super(key: key);

  @override
  _BannerAdsViewState createState() => _BannerAdsViewState();
}

class _BannerAdsViewState extends State<BannerAdsView> {
  @override
  Widget build(_) {
    return Container(
      height: 100,
      color: Colors.red,
      width: Device.width,
      child: ChangeNotifierProvider<BannerAdsViewModel>(
        create: (_) => BannerAdsViewModel(),
        builder: (BuildContext context, __) {
          BannerAdsViewModel model = Provider.of(context, listen: false);
          switch (widget.adsModel.company) {
            case 'google':
              if (Platform.isIOS)
                model.loadBanner(
                    widget.adsModel.iosToken, widget.buildnewAdsWidget);
              else
                model.loadBanner(
                  widget.adsModel.androidToken,
                  widget.buildnewAdsWidget,
                );
              return Selector<BannerAdsViewModel, bool>(
                selector: (_, m) => m.bannerLoaded,
                builder: (_, bool loaded, __) {
                  if (!loaded) return SizedBox();
                  return AdsService.admob.adWidget;
                },
              );
            case 'facebook':
              return FacebookBannerAd(
                placementId: Platform.isAndroid
                    ? widget.adsModel.androidToken
                    : widget.adsModel.iosToken,
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
