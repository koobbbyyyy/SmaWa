import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class MaleThirteenToTwentyNine extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const MaleThirteenToTwentyNine({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        print('class is m13-29');
     
    Future.delayed(Duration(seconds: 20), () {
      AppRouter.router.go('/');
    });

    List<String> imagePaths = [
      'assets/m15291.png', // Path to the ninth image
      'assets/m15292.png', // Path to the tenth image
      'assets/m15293.png', // Path to the eleventh image
      'assets/m15294.png', // Path to the twelfth image
      'assets/m15295.png', // Path to the thirteenth image
      'assets/m15296.png', // Path to the fourteenth image
      'assets/m15297.png', // Path to the fifteenth image
      'assets/m15298.png', // Path to the sixteenth image
      'assets/m15299.png', // Path to the seventeenth image
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background Image
          Image.asset(
            'assets/presentation.png', // Path to the background image file
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 200), // Space between text and list
                  // List of images
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                      crossAxisSpacing: 10, // Spacing between columns
                      mainAxisSpacing: 10, // Spacing between rows
                    ),
                    itemCount: imagePaths.length, // Total number of images
                    itemBuilder: (BuildContext context, int index) {
                      // Load image from the list based on the current index
                      String imagePath = imagePaths[index];

                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
