import 'dart:math';

import 'package:camera/camera.dart';

class CameraService {
  late CameraController _cameraController;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    print(cameras);
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium); // kamera inter [0] extern [1]
    await _cameraController.initialize();
  }

  Future<XFile> capturePhoto() async {
    return await _cameraController.takePicture();
  }

  void disposeCamera() {
    _cameraController.dispose();
  }
}
