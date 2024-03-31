import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class FemaleZeroToSix extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const FemaleZeroToSix({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('class is w0-6');

    Future.delayed(Duration(seconds: 20), () {
      AppRouter.router.go('/');
    });

    List<String> imagePaths = [
       'assets/w061.png', // Path to the first image
                  'assets/w062.png', // Path to the second image
                  'assets/w063.png', // Path to the third image
                  'assets/w064.png', // Path to the fourth image
                  'assets/w065.png', // Path to the fifth image
                  'assets/w066.png', // Path to the sixth image
                  'assets/w067.png', // Path to the seventh image
                  'assets/w068.png', // Path to the eighth image
                  'assets/w069.png', // Path to the ninth image
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
