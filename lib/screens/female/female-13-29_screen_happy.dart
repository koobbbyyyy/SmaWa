import 'package:flutter/material.dart';
import 'package:smawa/routing/AppRouter.dart';

class FemaleThirteenToTwentyNineHappy extends StatelessWidget {
  final String ageGroup;
  final String gender;

  const FemaleThirteenToTwentyNineHappy({Key? key, required this.ageGroup, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('class is w13-29');

    Future.delayed(Duration(seconds: 20), () {
      AppRouter.router.go('/');
    });

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
    Future.delayed(const Duration(seconds: 7), () {
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
