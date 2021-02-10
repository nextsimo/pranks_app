import 'package:camera/camera.dart';

class CameraService {
  CameraController controller;
  List<CameraDescription> cameras;

  Future init() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    await controller.initialize();
  }
}
