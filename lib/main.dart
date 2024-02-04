import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smawa/routing/AppRouter.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'secrets.env');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final goRouter = AppRouter.router;

    return MaterialApp.router(
      title: 'SmaWa',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser, 
      routeInformationProvider: goRouter.routeInformationProvider, 
    );
  }
}
