import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/services/camera_service.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/locator.dart';

class CameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CameraService cameraService = locator<CameraService>();

    return Container(
      width: Device.height * 0.10,
      height: 122,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(
            image: AssetImage("assets/profil.jpg"), fit: BoxFit.cover),
        border: Border.all(
          color: Color(0xff313036),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: CameraPreview(
          cameraService.controller,
        ),
      ),
    );
  }
}
