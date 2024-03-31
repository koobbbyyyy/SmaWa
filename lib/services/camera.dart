import 'package:camera/camera.dart';

class CameraService {
  late CameraController _cameraController;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    // show avalable cams
/*     print(cameras);
    print(cameras[0]);
    print(cameras[1]); */
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium); // kamera intern [0] extern [1]
    await _cameraController.initialize();
  }

  Future<XFile> capturePhoto() async {
    return await _cameraController.takePicture();
  }

  void disposeCamera() {
    _cameraController.dispose();
  }
}
