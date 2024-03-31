import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class FemaleSevenToTwelve extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const FemaleSevenToTwelve({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 20), () {
      AppRouter.router.go('/');
    });
    
    return Scaffold(
      appBar: AppBar(
        title: Text('$gender $ageGroup Werbung'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Werbung für Frauen $gender im Alter von 0-12 $ageGroup'),
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
                  'assets/w7131.png', // Path to the first image
                  'assets/w7132.png', // Path to the second image
                  'assets/w7133.png', // Path to the third image
                  'assets/w7134.png', // Path to the fourth image
                  'assets/w7135.png', // Path to the fifth image
                  'assets/w7136.png', // Path to the sixth image
                  'assets/w7137.png', // Path to the seventh image
                  'assets/w7138.png', // Path to the eighth image
                  'assets/w7139.png', // Path to the ninth image
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
        
          ],
        ),
      ),
    );
  }
}
