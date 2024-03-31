import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class MaleThirtyToFiftyNine extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const MaleThirtyToFiftyNine({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/m30591.png', // Path to the ninth image
      'assets/m30592.png', // Path to the tenth image
      'assets/m30593.png', // Path to the eleventh image
      'assets/m30594.png', // Path to the twelfth image
      'assets/m30595.png', // Path to the thirteenth image
      'assets/m30596.png', // Path to the fourteenth image
      'assets/m30597.png', // Path to the fifteenth image
      'assets/m30598.png', // Path to the sixteenth image
      'assets/m30599.png', // Path to the seventeenth image
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              // Navigate back to the home screen
              AppRouter.router.go('/');
            },
            child: const Text('Go Back to Home'),
          ),
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
