import 'package:get_it/get_it.dart';
import 'package:prank/src/services/camera_service.dart';
import 'package:prank/src/services/video_service.dart';
import 'package:prank/src/services/wallpapers_service.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<VideoPlayerService>(VideoPlayerService());
  locator.registerSingleton<CameraService>(CameraService());
  locator.registerSingleton<WallpapersService>(WallpapersService());
}

WallpapersService papersService = locator<WallpapersService>();
