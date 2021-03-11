import 'package:get_it/get_it.dart';
import 'package:prank/src/services/ads/ads_service.dart';
import 'package:prank/src/services/camera_service.dart';
import 'package:prank/src/services/video_service.dart';
import 'package:prank/src/services/wallpapers_service.dart';
import 'package:prank/src/view/base/base_view_model.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<VideoPlayerService>(VideoPlayerService());
  locator.registerSingleton<CameraService>(CameraService());
  locator.registerSingleton<WallpapersService>(WallpapersService());
  locator.registerSingleton<AdsService>(AdsService());
  locator.registerSingleton<BaseViewModel>(BaseViewModel());
}

WallpapersService papersService = locator<WallpapersService>();
AdsService adsService = locator<AdsService>();
