import 'package:get_it/get_it.dart';
import 'package:prank/src/services/camera_service.dart';
import 'package:prank/src/services/video_service.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<CameraService>(CameraService());
  locator.registerSingleton<VideoPlayerService>(VideoPlayerService());
}
