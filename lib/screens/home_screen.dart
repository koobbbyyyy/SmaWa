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
      print('________________________________');
      print('Path where the Picture is stored');
      print(picture.path);
      print('________________________________');
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
        // save properties for routing
        final faceDetail = response.faceDetails!.first;
        final ageLow = faceDetail.ageRange?.low ?? 0;
        final ageHigh = faceDetail.ageRange?.high ?? 0;
        final estimatedAge = (ageLow + ageHigh) ~/ 2;
        final gender = faceDetail.gender?.value;
        final smile = faceDetail.smile?.value;
        this.ageHigh = ageHigh;
        this.ageLow = ageLow;      
        double? emotionHappyConfidence;
        double? emotionAngryConfidence;

      // save emotions for routing  
      if (faceDetail.emotions != null) {
        for (int i = 0; i < 8; i++) {
          if (i < faceDetail.emotions!.length) {
            if(faceDetail.emotions![i].type.toString() == 'EmotionName.happy' ) {
              print('Hier sehen sie wie das Schaufenster die Emotion happy einschätzt');
               final emotionHappyConfidence = faceDetail.emotions![i].confidence;
               print('happy Confidence in Prozent: _____________________________');
               print(emotionHappyConfidence);
            }
            if(faceDetail.emotions![i].type.toString() == 'EmotionName.angry' ) {
              print('Hier sehen sie wie das Schaufenster die Emotion angry einschätzt');
               final emotionAngryConfidence = faceDetail.emotions![i].confidence;
               print('angry_____________________________');
               print(emotionAngryConfidence);
            }
          } else {
            print("Emotion $i: No data available");
          }
        }
      } else {
        print("No emotions data available");
      }
     
        // Set isTextVisible to true and refresh ui to show loading animation
        setState(() {
          isTextVisible = true;
        });

        // Call function to navigate based on age and gender with delay to have time to show the text
        Future.delayed(Duration(seconds: 4), () {
          AppRouter.navigateBasedOnAgeAndGender(context, estimatedAge, gender!, smile!, emotionHappyConfidence?? 0.0, emotionAngryConfidence?? 0.0);
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
    return GestureDetector(
      onTap: _capturePhoto,
      child: Stack(
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  Image.asset('assets/logo.png'),
                  const SizedBox(height: 50),
                  const Text(
                    'Ich bin ein',
                    style: TextStyle(
                      fontSize: 42,
                    ),
                  ),
                  const SizedBox(height: 25),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 2.0, color: Colors.black),
                          left: BorderSide(width: 2.0, color: Colors.black),
                        ),
                      ),
                      child: const Text(
                        'Smartes Schaufenster',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Text(
                    'Stellen Sie sich davor',
                    style: TextStyle(
                      fontSize: 42,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'und entdecken Sie Ihre neuen',
                    style: TextStyle(
                      fontSize: 42,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Lieblingsschuhe',
                    style: TextStyle(
                      fontSize: 42,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                              'Besuchen Sie uns auch auf unserer Homepage unter: https://schuhhaus-jung.de',
                              style: TextStyle(
                              fontSize: 20,
                                     ),
                              ),
                              const SizedBox(height: 25),
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset('assets/qrcode.png'),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned widget to place HomeTextWidget on top of the image
          Positioned(
            top: 515,
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
      ),
    );
  }
}