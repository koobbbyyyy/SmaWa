import 'package:flutter/material.dart';

class PulsatingButton extends StatefulWidget {
  final VoidCallback onPressed;

  PulsatingButton({required this.onPressed});

  @override
  _PulsatingButtonState createState() => _PulsatingButtonState();
}

class _PulsatingButtonState extends State<PulsatingButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000), // Duration of the pulsating animation
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward(); // Start the animation when opening the page
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(), // Make the button circular
          padding: EdgeInsets.all(80), // Adjust the padding to control button size
          backgroundColor: Colors.white, // Button background color
          elevation: 10, // Add shadow
        ),
        child: SizedBox(), // Empty SizedBox to create a round button without text
      ),
    );
  }
}
