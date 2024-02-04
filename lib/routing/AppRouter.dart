import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smawa/screens/female/female-0-6%20_screen.dart';
import 'package:smawa/screens/female/female-13-20_screen.dart';
import 'package:smawa/screens/female/female-21-30_screen.dart';
import 'package:smawa/screens/female/female-31-40_screen.dart';
import 'package:smawa/screens/female/female-41-50_screen.dart';
import 'package:smawa/screens/female/female-51-60_screen.dart';
import 'package:smawa/screens/female/female-61-120_screen.dart';
import 'package:smawa/screens/female/female-7-12_screen.dart';
import 'package:smawa/screens/male/male-0-6%20_screen.dart';
import 'package:smawa/screens/home_screen.dart';
import 'package:smawa/screens/male/male-13-20_screen.dart';
import 'package:smawa/screens/male/male-21-30_screen.dart';
import 'package:smawa/screens/male/male-31-40_screen.dart';
import 'package:smawa/screens/male/male-41-50_screen.dart';
import 'package:smawa/screens/male/male-51-60_screen.dart';
import 'package:smawa/screens/male/male-61-120_screen.dart';
import 'package:smawa/screens/male/male-7-12_screen.dart';

class AppRouter {
  static const String ageGroup = '0-6';
  static const String gender = 'male';

  static void navigateBasedOnAgeAndGender(
      BuildContext context, int age, GenderType gender) {
    String route = '/'; // Default route

    // Mapping age and gender to routes
    if (gender == GenderType.male) {
      route = _getMaleRoute(age);
    } else if (gender == GenderType.female) {
      route = _getFemaleRoute(age);
    }

    // Navigate using GoRouter
    if (route != '/') {
      router.go(route);
    }
  }

  static String _getMaleRoute(int age) {
    if (age <= 6) {
      return '/maleZeroToSix';
    } else if (age <= 12) return '/maleSevenToTwelve';
    else if (age <= 20) return '/maleThirteenToTwenty';
    else if (age <= 30) return '/maleTwentyOneToThirty';
    else if (age <= 40) return '/maleThirtyOneToFourty';
    else if (age <= 50) return '/maleFourtyOneToFifty';
    else if (age <= 60) return '/maleFiftyOneToSixty';
    else return '/maleSixtyOneToOneHundredTwenty';
  }

  static String _getFemaleRoute(int age) {
    if (age <= 6) {
      return '/femaleZeroToSix';
    } else if (age <= 12) return '/femaleSevenToTwelve';
    else if (age <= 20) return '/femaleThirteenToTwenty';
    else if (age <= 30) return '/femaleTwentyOneToThirty';
    else if (age <= 40) return '/femaleThirtyOneToFourty';
    else if (age <= 50) return '/femaleFourtyOneToFifty';
    else if (age <= 60) return '/femaleFiftyOneToSixty';
    else return '/femaleSixtyOneToOneHundredTwenty';
  }


 static final router = GoRouter(
    routes: [
    GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/maleZeroToSix',
          builder: (context, state) => const MaleZeroToSix(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleSevenToTwelve',
          builder: (context, state) => const MaleSevenToTwelve(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleThirteenToTwenty',
          builder: (context, state) => const MaleThirteenToTwenty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleTwentyOneToThirty',
          builder: (context, state) => const MaleTwentyOneToThirty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleThirtyOneToFourty',
          builder: (context, state) => const MaleThirtyOneToFourty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleFourtyOneToFifty',
          builder: (context, state) => const MaleFourtyOneToFifty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleFiftyOneToSixty',
          builder: (context, state) => const MaleFiftyOneToSixty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleSixtyOneToOneHundredTwenty',
          builder: (context, state) => const MaleSixtyOneToOneHundredTwenty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleZeroToSix',
          builder: (context, state) => const FemaleZeroToSix(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleSevenToTwelve',
          builder: (context, state) => const FemaleSevenToTwelve(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleThirteenToTwenty',
          builder: (context, state) => const FemaleThirteenToTwenty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleTwentyOneToThirty',
          builder: (context, state) => const FemaleTwentyOneToThirty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleThirtyOneToFourty',
          builder: (context, state) => const FemaleThirtyOneToFourty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleFourtyOneToFifty',
          builder: (context, state) => const FemaleFourtyOneToFifty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleFiftyOneToSixty',
          builder: (context, state) => const FemaleFiftyOneToSixty(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleSixtyOneToOneHundredTwenty',
          builder: (context, state) => const FemaleSixtyOneToOneHundredTwenty(ageGroup: '', gender: '',),
        ),
        // Add more routes for other age and gender screens as needed...
      ],
    );
  }

