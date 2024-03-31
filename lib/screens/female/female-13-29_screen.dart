import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class FemaleThirteenToTwentyNine extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const FemaleThirteenToTwentyNine({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$gender $ageGroup Werbung'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Werbung für Frauen $gender im Alter von 13-29 $ageGroup'),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10, // Spacing between columns
                mainAxisSpacing: 10, // Spacing between rows
              ),
              itemCount: 9, // Total number of images
              itemBuilder: (BuildContext context, int index) {
                // Define a list of image paths
                List<String> imagePaths = [
                  'assets/w15291.png', // Path to the first image
                  'assets/w15292.png', // Path to the second image
                  'assets/w15293.png', // Path to the third image
                  'assets/w15294.png', // Path to the fourth image
                  'assets/w15295.png', // Path to the fifth image
                  'assets/w15296.png', // Path to the sixth image
                  'assets/w15297.png', // Path to the seventh image
                  'assets/w15298.png', // Path to the eighth image
                  'assets/w15299.png', // Path to the ninth image
                ];

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
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home screen
                AppRouter.router.go('/');
              },
              child: const Text('Go Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
