import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class MaleTwentyOneToThirty extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const MaleTwentyOneToThirty({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

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
            Text('Werbung für Männer $gender im Alter von 21-30 $ageGroup'),
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
