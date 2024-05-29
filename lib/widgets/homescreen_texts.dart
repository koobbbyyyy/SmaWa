import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeTextWidget extends StatefulWidget {
  final int ageLow;
  final int ageHigh;

  const HomeTextWidget({
    Key? key,
    required this.ageLow,
    required this.ageHigh,

  }) : super(key: key);

  @override
  _HomeTextWidgetState createState() => _HomeTextWidgetState();
}

class _HomeTextWidgetState extends State<HomeTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      /*   TypewriterAnimatedTextKit(
          totalRepeatCount: 1, // Set the repeat count to 1 to type the text once
          speed: const Duration(milliseconds: 50), // Adjust typing speed as needed
          text: ['I think you are between ${widget.ageLow} and ${widget.ageHigh}'],
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          displayFullTextOnTap: true, // Display full text when tapped
        ),
        TypewriterAnimatedTextKit(
          totalRepeatCount: 1,
          speed: const Duration(milliseconds: 50),
          text: ['It looks like you like to wear ${widget.ageLow}'],
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          displayFullTextOnTap: true,
        ),
        */
                  LoadingAnimationWidget.prograssiveDots(
        color: const Color.fromARGB(255, 216, 216, 216),
        size: 100,
      ),
      TypewriterAnimatedTextKit(
          totalRepeatCount: 1,
          speed: const Duration(milliseconds: 50),
          text: ['Erstelle Vorschläge für Ihre neuen Lieblingsschuhe'],
          textStyle: const TextStyle(
            color:  const Color.fromARGB(255, 216, 216, 216),
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
          displayFullTextOnTap: true,
        ), 
      ],
    );
  }
}
