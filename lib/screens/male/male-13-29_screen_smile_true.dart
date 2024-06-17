import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class MaleThirteenToTwentyNineSmileTrue extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const MaleThirteenToTwentyNineSmileTrue({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('class is m13-29');

    Future.delayed(Duration(seconds: 20), () {
      AppRouter.router.go('/');
    });

    List<String> imagePaths = [
      'assets/m15291.png',
      'assets/m15292.png',
      'assets/m15293.png',
      'assets/m15294.png',
      'assets/m15295.png',
      'assets/m15296.png',
      'assets/m15297.png',
      'assets/m15298.png',
      'assets/m15299.png',
    ];

    // Funktion zum Anzeigen des Teilnahmedialogs
    void _showParticipationDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Teilnahme an der Umfrage'),
            content: Text('Wenn Sie uns bei der Forschung helfen möchten und an der Umfrage zur Akzeptanz von Bilderkennung mit künstlicher Intelligenz zum Schalten von Werbung teilnehmen möchten sprechen Sie uns gerne an'),
            actions: <Widget>[
             /*  TextButton(
                child: Text('Abbrechen'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dialog schließen
                },
              ),
              TextButton(
                child: Text('Teilnehmen'),
                onPressed: () {
                  // Logik zur Teilnahme hier behandeln
                  Navigator.of(context).pop(); // Dialog schließen
                },
              ), */
            ],
          );
        },
      );
    }

    // Teilnahmedialog nach 5 Sekunden anzeigen
    Future.delayed(Duration(seconds: 7), () {
      _showParticipationDialog(context);
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/presentation.png',
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 200),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: imagePaths.length,
                    itemBuilder: (BuildContext context, int index) {
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
