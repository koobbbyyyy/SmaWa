import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:camera/camera.dart'; // Import the camera package
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:smawa/routing/AppRouter.dart';
import 'package:smawa/services/aws.dart';
import 'package:smawa/widgets/pulsating_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final AwsService awsService = AwsService();
  late CameraController _cameraController;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
  }

  Future<void> _capturePhoto() async {
    try {
      final XFile picture = await _cameraController.takePicture();
      late final File imageFile = File(picture.path);
      final imageBytes = await _loadImageBytes(picture.path);
      print('path');
      print(picture.path);
      // Now you can use imageBytes for your AWS service
      // Call your detectFaces function with imageBytes
      detectFaces(imageBytes);
    } catch (e) {
      print('hallo');
      print(e);
    }
  }

  Future<void> detectFaces(Uint8List imageBytes) async {
    try {
      // Detect Faces function of the aws service
      final response = await awsService.detectFaces(imageBytes);
      if (response.faceDetails != null && response.faceDetails!.isNotEmpty) {
        final faceDetail = response.faceDetails!.first;
        final ageLow = faceDetail.ageRange?.low ?? 0;
        final ageHigh = faceDetail.ageRange?.high ?? 0;
        final estimatedAge = (ageLow + ageHigh) ~/ 2;
        final gender = faceDetail.gender?.value;
        print(estimatedAge);
        print(gender);

        // Call function to navigate based on age and gender
        AppRouter.navigateBasedOnAgeAndGender(context, estimatedAge, gender!);
      } else {
        print("No faces detected.");
      }
    } catch (e) {
      print(e);
    }
  }

Future<Uint8List> _loadImageBytes(String imagePath) async {
  try {
    final file = File(imagePath);
    if (await file.exists()) {
      final Uint8List imageBytes = await file.readAsBytes();
      return imageBytes;
    } else {
      print('File does not exist at path: $imagePath');
      return Uint8List(0); // Return an empty Uint8List or handle the error accordingly.
    }
  } catch (e) {
    print('Error loading image: $e');
    return Uint8List(0); // Return an empty Uint8List or handle the error accordingly.
  }
}
  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PulsatingButton(onPressed: _capturePhoto),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
