import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService {
  AdWithView _banner;
  InterstitialAd _interstitial;
  RewardedAd _rewarded;
  AdWidget adWidget;

  void _inititRewarded(String rewardedId) {
    _rewarded = RewardedAd(
      adUnitId: rewardedId,
      request: AdRequest(),
      listener: AdListener(),
    );
  }

  AdWithView get banner => _banner;

  void _initInterstitial(String interstitialId) {
    _interstitial = InterstitialAd(
      adUnitId: interstitialId,
      request: AdRequest(),
      listener: AdListener(),
    );
  }

  void _initBanner(String bannerid) {
    _banner = BannerAd(
      adUnitId: bannerid,
      size: AdSize.banner,
      request: AdRequest(),
      listener: AdListener(),
    );
  }

  Future<void> loadBanner(String bannerid) async {
    if (_banner == null) _initBanner(bannerid);
    bool isloaded = await _banner.isLoaded();
    if (!isloaded) await _banner.load();
  }

  Future<void> showIterstitial(String interstitialId) async {
    if (_interstitial == null) _initInterstitial(interstitialId);
    await _interstitial.load();
    await _interstitial.show();
    _interstitial.dispose();
    _interstitial = null;
  }

  Future<void> showRewarded(String rewardedId) async {
    if (_rewarded == null) _inititRewarded(rewardedId);
    await _rewarded.load();
    await _rewarded.show();
    _rewarded.dispose();
    _rewarded = null;
  }
}
