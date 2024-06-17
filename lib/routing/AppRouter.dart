import 'package:aws_rekognition_api/rekognition-2016-06-27.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smawa/screens/female/female-0-6%20_screen.dart';
import 'package:smawa/screens/female/female-13-29_screen.dart';
import 'package:smawa/screens/female/female-13-29_screen_angry.dart';
import 'package:smawa/screens/female/female-13-29_screen_happy.dart';
import 'package:smawa/screens/female/female-30-59_screen.dart';
import 'package:smawa/screens/female/female-60-100_screen.dart';
import 'package:smawa/screens/female/female-7-12_screen.dart';
import 'package:smawa/screens/male/male-0-6%20_screen.dart';
import 'package:smawa/screens/home_screen.dart';
import 'package:smawa/screens/male/male-13-29_screen_smile_true.dart';
import 'package:smawa/screens/male/male-13-29_screen_smile_false.dart';
/* import 'package:smawa/screens/male/male-13-29_screen.dart'; */
import 'package:smawa/screens/male/male-30-59_screen.dart';
import 'package:smawa/screens/male/male-60-100_screen.dart';
import 'package:smawa/screens/male/male-7-12_screen.dart';

class AppRouter {
  static const String ageGroup = '0-6';
  static const String gender = 'male';

  static void navigateBasedOnAgeAndGender(
      BuildContext context, int age, GenderType gender, bool smile, double happy, double angry) {
    String route = '/'; // Default route

    // Mapping age and gender to routes
    if (gender == GenderType.male) {
      route = _getMaleRoute(age, smile);
    } else if (gender == GenderType.female) {
      route = _getFemaleRoute(age, happy, angry);
    }

    // Navigate using GoRouter
    if (route != '/') {
      router.go(route);
    }
  }

  static String _getMaleRoute(int age, bool smile) {
    if (age <= 6) {
      return '/maleZeroToSix';
    } else if (age <= 12) return '/maleSevenToTwelve';
    /* else if (age <= 35) return '/maleThirteenToTwentyNine'; */
    else if ((age <= 35) && (smile == true)) return '/maleThirteenToTwentyNineSmileTrue';
    else if ((age <= 35) && (smile == false)) return '/maleThirteenToTwentyNineSmileFalse';
    else if (age <= 59) return '/maleThirtyToFiftyNine';
    else if (age <= 100) return '/maleSixtyToOneHundred';
    else return '/maleSixtyToOneHundred';
  }

  static String _getFemaleRoute(int age, double happy, double angry) {
    if (age <= 6) {
      return '/femaleZeroToSix';
    } else if (age <= 12) return '/femaleSevenToTwelve';
    /* else if (age <= 35) return '/femaleThirteenToTwentyNine'; */
    else if ((age <= 35) && (happy >= 90)) return '/femaleThirteenToTwentyNineHappy';
    else if ((age <= 35) && (angry >= 90)) return '/femaleThirteenToTwentyNineAngry';
    else if (age <= 59) return '/femaleThirtyToFiftyNine';
    else if (age <= 100) return '/femaleSixtyToOneHundred';
    else return '/maleSixtyToOneHundred';
  }


 static final router = GoRouter(
    routes: [
    GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/maleZeroToSix',
          builder: (context, state) => const MaleZeroToSix(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleSevenToTwelve',
          builder: (context, state) => const MaleSevenToTwelve(ageGroup: '', gender: '',),
        ),
       /*  GoRoute(
          path: '/maleThirteenToTwentyNine',
          builder: (context, state) => const MaleThirteenToTwentyNine(ageGroup: '', gender: '',),
        ), */
         GoRoute(
          path: '/maleThirteenToTwentyNineSmileTrue',
          builder: (context, state) => const MaleThirteenToTwentyNineSmileTrue(ageGroup: '', gender: '',),
        ),
         GoRoute(
          path: '/maleThirteenToTwentyNineSmileFalse',
          builder: (context, state) => const MaleThirteenToTwentyNineSmileFalse(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleThirtyToFiftyNine',
          builder: (context, state) => const MaleThirtyToFiftyNine(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/maleSixtyToOneHundred',
          builder: (context, state) => const MaleSixtyToOneHundred(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleZeroToSix',
          builder: (context, state) => const FemaleZeroToSix(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleSevenToTwelve',
          builder: (context, state) => const FemaleSevenToTwelve(ageGroup: '', gender: '',),
        ),
        /* GoRoute(
          path: '/femaleThirteenToTwentyNine',
          builder: (context, state) => const FemaleThirteenToTwentyNine(ageGroup: '', gender: '',),
        ), */
        GoRoute(
          path: '/femaleThirteenToTwentyNine',
          builder: (context, state) => const FemaleThirteenToTwentyNineHappy(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleThirteenToTwentyNine',
          builder: (context, state) => const FemaleThirteenToTwentyNineAngry(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleThirtyToFiftyNine',
          builder: (context, state) => const FemaleThirtyToFiftyNine(ageGroup: '', gender: '',),
        ),
        GoRoute(
          path: '/femaleSixtyToOneHundred',
          builder: (context, state) => const FemaleSixtyToOneHundred(ageGroup: '', gender: '',),
        ),
        // Add more routes for other age and gender screens as needed...
      ],
    );
  }

