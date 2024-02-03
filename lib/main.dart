import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smawa/routing/AppRouter.dart'; // Ensure this import path matches the location of your AppRouter class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the GoRouter instance from AppRouter
    final goRouter = AppRouter.router;

    return MaterialApp.router(
      title: 'SmaWa',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routerDelegate: goRouter.routerDelegate, // Use GoRouter's router delegate
      routeInformationParser: goRouter.routeInformationParser, // Use GoRouter's route information parser
      routeInformationProvider: goRouter.routeInformationProvider, // This is optional, for deep linking
    );
  }
}
