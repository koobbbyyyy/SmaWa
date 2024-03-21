import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';
class MaleTwentyOneToThirty extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const MaleTwentyOneToThirty({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Werbung für Männer $gender im Alter von 21-30 $ageGroup'),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to the home screen
                    AppRouter.router.go('/');
                  },
                  child: const Text('Zurück zum Start'),
                ),
                SizedBox(height: 20), // Space between text and list
                // List of images
                Expanded(
                  child: ListView.builder(
                    itemCount: 3, // Number of images
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10), // Vertical spacing between images
                        child: SizedBox(
                          width: 200, // Limiting the width
                          height: 150, // Limiting the height
                          child: PlaceholderImage(), // Placeholder image widget
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


// Platzhalter-Bild-Widget
class PlaceholderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/shoe1.png', // Pfad zum Platzhalterbild
      fit: BoxFit.contain, // Anpassen der Bildgröße
    );
  }
}