import 'package:flutter/material.dart';
import 'package:smawa/widgets/pulsating_button.dart';

class MaleThirtyOneToFourty extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const MaleThirtyOneToFourty({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hier könnten Sie die Inhalte basierend auf ageGroup und gender anpassen
    return Scaffold(
      appBar: AppBar(
        title: Text('$gender $ageGroup Werbung'),
      ),
    body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('Werbung für Männer $gender im Alter von 31-40 $ageGroup'),
      // Button Test
    /*   PulsatingButton(
          onPressed: () {
            // Add your click logic here
            print('Button Pressed');
          },
        ), */
      // Add more Text widgets as needed
    ],
  ),
),

    );
  }
}
