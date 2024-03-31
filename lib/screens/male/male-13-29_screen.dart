import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class MaleThirteenToTwentyNine extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const MaleThirteenToTwentyNine({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

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
            Text('Werbung für Männer $gender im Alter von 7-13 $ageGroup'),
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
                        'assets/m15291.png', // Path to the first image
                        'assets/m15292.png', // Path to the second image
                        'assets/m15293.png', // Path to the third image
                        'assets/m15294.png', // Path to the fourth image
                        'assets/m15295.png', // Path to the fifth image
                        'assets/m15296.png', // Path to the sixth image
                        'assets/m15297.png', // Path to the seventh image
                        'assets/m15298.png', // Path to the eighth image
                        'assets/m15299.png', // Path to the ninth image
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