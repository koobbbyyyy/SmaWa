import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:smawa/routing/AppRouter.dart';
import 'package:smawa/services/aws.dart';
import 'package:smawa/services/camera.dart';
import 'package:smawa/widgets/homescreen_texts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final AwsService awsService = AwsService();
  late CameraService cameraService;
  int ageLow = 0;
  int ageHigh = 0;
  bool isTextVisible = false;

  @override
  void initState() {
    super.initState();
    cameraService = CameraService();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    await cameraService.initializeCamera();
  }

  Future<void> _capturePhoto() async {
    try {
      final XFile picture = await cameraService.capturePhoto();
      final imageBytes = await _loadImageBytes(picture.path);
      print('path');
      print(picture.path);
      detectFaces(imageBytes);
    } catch (e) {
      print('Fehler Bild konnte nicht geladen oder gefunden werden');
      print(e);
    }
  }

  Future<void> detectFaces(Uint8List imageBytes) async {
    try {
      final response = await awsService.detectFaces(imageBytes);
      if (response.faceDetails != null && response.faceDetails!.isNotEmpty) {
        final faceDetail = response.faceDetails!.first;
        final ageLow = faceDetail.ageRange?.low ?? 0;
        final ageHigh = faceDetail.ageRange?.high ?? 0;
        final estimatedAge = (ageLow + ageHigh) ~/ 2;
        final gender = faceDetail.gender?.value;
        this.ageHigh = ageHigh;
        this.ageLow = ageLow;
        print(estimatedAge);
        print(gender);
        print(response);

        // Set isTextVisible to true and refresh ui
        setState(() {
          isTextVisible = true;
        });

        // Call function to navigate based on age and gender with delay to have time to show the text
        Future.delayed(Duration(seconds: 2), () {
          AppRouter.navigateBasedOnAgeAndGender(context, estimatedAge, gender!);
        });
      } else {
        print("No faces detected.");
      }
    } catch (e) {
      print(e);
    }
  }

  // load the image 
  Future<Uint8List> _loadImageBytes(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        final Uint8List imageBytes = await file.readAsBytes();
        return imageBytes;
      } else {
        print('File does not exist at path: $imagePath');
        return Uint8List(0);
      }
    } catch (e) {
      print('Error loading image: $e');
      return Uint8List(0);
    }
  }

  // end cameraservice
  @override
  void dispose() {
    cameraService.disposeCamera();
    super.dispose();
  }

  // ui
  @override
Widget build(BuildContext context) {
  return Stack(
    children: [
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _capturePhoto,
                child: Image.asset(
                  'assets/home.png',
                  width: 600,
                  height: 600,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // Positioned widget to place HomeTextWidget on top of the image
      Positioned(
        top: 285,
        left: 0,
        right: 0,
        bottom: 0,
        child: Visibility(
          visible: isTextVisible,
          child: Center(
            child: HomeTextWidget(ageLow: ageLow, ageHigh: ageHigh),
          ),
        ),
      ),
    ],
  );
}
}