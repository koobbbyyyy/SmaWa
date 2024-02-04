import 'package:camera/camera.dart';

class CameraService {
  late CameraController _cameraController;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
  }

  Future<XFile> capturePhoto() async {
    return await _cameraController.takePicture();
  }

  void disposeCamera() {
    _cameraController.dispose();
  }
}
