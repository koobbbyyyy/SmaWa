import 'package:flutter/material.dart';

class MaleTwentyOneToThirty extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const MaleTwentyOneToThirty({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hier könnten Sie die Inhalte basierend auf ageGroup und gender anpassen
    return Scaffold(
      appBar: AppBar(
        title: Text('$gender $ageGroup Werbung'),
      ),
      body: Center(
        child: Text('Werbung für Männer $gender im Alter von 21-30 $ageGroup'),
      ),
    );
  }
}
