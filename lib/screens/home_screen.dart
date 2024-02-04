import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:smawa/routing/AppRouter.dart';
import 'package:smawa/services/aws.dart';
import 'package:smawa/widgets/pulsating_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
 // instance of the aws service
 final AwsService awsService = AwsService(); 

  // Detect Faces function
  Future<void> detectFaces() async {
    
    try {
      final imageBytes = await _loadImageBytes('image1.jpg'); // get the image
      // Detect Faces function of the aws service
      final response = await awsService.detectFaces(imageBytes); // get the data from aws
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
          decoration: const BoxDecoration(
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
