import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/services/camera_service.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/locator.dart';

class CameraView extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraService cameraService;
  @override
  void initState() {
    super.initState();

    cameraService = locator<CameraService>();
    init();
  }

  init() async {
    await cameraService.init();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Device.height * 0.10,
      height: 122,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.black54,
        border: Border.all(
          color: Color(0xff313036),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: cameraService.controller == null
            ? SizedBox()
            : CameraPreview(
                cameraService.controller,
              ),
      ),
    );
  }
}
