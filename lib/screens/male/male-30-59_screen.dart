import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smawa/routing/AppRouter.dart';

class maleThirtyToFiftyNine extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const maleThirtyToFiftyNine({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 500), // Space between text and list
                // List of images
                Expanded(
                  child: ListView.builder(
                    itemCount: 3, // Number of images
                    itemBuilder: (BuildContext context, int index) {
                      // Define a list of image paths
                      List<String> imagePaths = [
                        'assets/shoe1.png', // Path to the first real image
                        'assets/shoe1.png', // Path to the second real image
                        'assets/show1.png', // Path to the third real image
                      ];

                      // Load image from the list based on the current index
                      String imagePath = imagePaths[index];

                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10), // Vertical spacing between images
                        child: SizedBox(
                          width: 400, // Limiting the width
                          height: 300, // Limiting the height
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
