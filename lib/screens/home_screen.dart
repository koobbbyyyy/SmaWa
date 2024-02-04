import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart' as rekognitionlibary;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smawa/routing/AppRouter.dart';
import 'package:smawa/widgets/pulsating_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  // Detect Faces function
  Future<void> detectFaces() async {
    // AWS KEYS
    final credentials = rekognitionlibary.AwsClientCredentials(
      accessKey: dotenv.env['ACCESS_KEY']!,
      secretKey: dotenv.env['SECRET_KEY']!,
    );
    final rekognition = rekognitionlibary.Rekognition(
      region: 'eu-central-1',
      credentials: credentials,
    );

    // get the image
    try {
      final imageBytes = await _loadImageBytes('image1.jpg'); // Your image path
      final response = await rekognition.detectFaces(
        image: rekognitionlibary.Image(bytes: imageBytes),
        attributes: [rekognitionlibary.Attribute.all],
      );

      // get the data from aws
      if (response.faceDetails != null && response.faceDetails!.isNotEmpty) {
        final faceDetail = response.faceDetails!.first;
        final ageLow = faceDetail.ageRange?.low ?? 0;
        final ageHigh = faceDetail.ageRange?.high ?? 0;
        final estimatedAge = (ageLow + ageHigh) ~/ 2;
        final gender = faceDetail.gender?.value;
        print(estimatedAge);
        print(gender);

        // call function to navigate baed on age and gender
        AppRouter.navigateBasedOnAgeAndGender(context, estimatedAge, gender!); 
      } else {
        print("No faces detected.");
      }
      // error handling
    } catch (e) {
      print(e);
    }
  }

  Future<Uint8List> _loadImageBytes(String imageName) async {
    final byteData = await rootBundle.load('assets/$imageName');
    return byteData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Stack( // Wrap the Scaffold in a Stack
      children: [
        // Animated background
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Scaffold(
  backgroundColor: Colors.transparent, // Make the Scaffold background transparent
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
     PulsatingButton(onPressed: detectFaces)
      ],
    ),
  ),
),

      ],
    );
  }
}
