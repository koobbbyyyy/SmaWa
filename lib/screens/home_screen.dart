import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data'; // Import for Uint8List
import 'package:flutter/services.dart' show rootBundle;
import 'package:aws_rekognition_api/rekognition-2016-06-27.dart' as rekognitionlibary;
import 'package:smawa/routing/AppRouter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000), // Duration of the pulsating animation
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller!.forward();
        }
      });

    _controller!.forward(); // Start the animation when opening the page
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // Detect Faces function
  Future<void> detectFaces() async {
    // Replace with secure retrieval of credentials
    final credentials = rekognitionlibary.AwsClientCredentials(
      accessKey: 'AKIATCKANHU27L3LKV6H',
      secretKey: '5bJm+qKlJNuCTfWm52haNTpL/twTfj1wdkuNW1Qw',
    );
    final rekognition = rekognitionlibary.Rekognition(
      region: 'eu-central-1',
      credentials: credentials,
    );

    try {
      final imageBytes = await _loadImageBytes('image1.jpg'); // Your image path
      final response = await rekognition.detectFaces(
        image: rekognitionlibary.Image(bytes: imageBytes),
        attributes: [rekognitionlibary.Attribute.all],
      );

      if (response.faceDetails != null && response.faceDetails!.isNotEmpty) {
        final faceDetail = response.faceDetails!.first;
        final ageLow = faceDetail.ageRange?.low ?? 0;
        final ageHigh = faceDetail.ageRange?.high ?? 0;
        final estimatedAge = (ageLow + ageHigh) ~/ 2;
        final gender = faceDetail.gender?.value;
        print(estimatedAge);
        print(gender);

        _navigateBasedOnAgeAndGender(context, estimatedAge, gender); // Pass the context, estimatedAge, and gender
      } else {
        print("No faces detected.");
      }
    } catch (e) {
      print(e);
    }
  }

  void _navigateBasedOnAgeAndGender(BuildContext context, int age, gender) {
    final goRouter = AppRouter.router;
    String route = '/'; // Default route

    // Mapping age and gender to routes
    if (gender == GenderType.male) {
      route = _getMaleRoute(age);
    } else if (gender == GenderType.female) {
      route = _getFemaleRoute(age);
    }

    // Navigate using GoRouter
    if (route != '/') {
      goRouter.go('$route');
    }
  }

  String _getMaleRoute(int age) {
    // Add conditions for all male age groups
    if (age <= 6) return '/maleZeroToSix';
    else if (age <= 12) return '/maleSevenToTwelve';
    else if (age <= 20) return '/maleThirteenToTwenty';
    else if (age <= 30) return '/maleTwentyOneToThirty';
    else if (age <= 40) return '/maleThirtyOneToFourty';
    else if (age <= 50) return '/maleFourtyOneToFifty';
    else if (age <= 60) return '/maleFiftyOneToSixty';
    else return '/maleSixtyOneToOneHundredTwenty';
  }

  String _getFemaleRoute(int age) {
    // Add conditions for all female age groups
    if (age <= 6) return '/femaleZeroToSix';
    else if (age <= 12) return '/femaleSevenToTwelve';
    else if (age <= 20) return '/femaleThirteenToTwenty';
    else if (age <= 30) return '/femaleTwentyOneToThirty';
    else if (age <= 40) return '/femaleThirtyOneToFourty';
    else if (age <= 50) return '/femaleFourtyOneToFifty';
    else if (age <= 60) return '/femaleFiftyOneToSixty';
    else return '/femaleSixtyOneToOneHundredTwenty';
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
        ScaleTransition(
          scale: _animation!,
          child: ElevatedButton(
            onPressed: detectFaces,
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(), // Make the button circular
              padding: EdgeInsets.all(80), // Adjust the padding to control button size
              backgroundColor: Colors.white, // Button background color
              elevation: 10, // Add shadow
            ),
            child: SizedBox(), // Empty SizedBox to create a round button without text
          ),
        ),
      ],
    ),
  ),
),

      ],
    );
  }
}
