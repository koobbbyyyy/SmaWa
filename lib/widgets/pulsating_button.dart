import 'package:flutter/material.dart';

class JarvisButton extends StatefulWidget {
  final VoidCallback onPressed;

  const JarvisButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _JarvisButtonState createState() => _JarvisButtonState();
}

class _JarvisButtonState extends State<JarvisButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
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

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + _animation.value * 0.3,
          child: Transform.rotate(
            angle: _animation.value * 0.2,
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
                elevation: 10,
                primary: Colors.black, // Background color (can be changed to the Jarvis theme color)
                onPrimary: Colors.blue, // Text color (can be changed)
                shadowColor: Colors.blueAccent, // Shadow color (can be changed)
              ),
              child: Container(
                width: 270,
                height: 270,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
              ),
            ),
          ),
        ));
      },
    );
  }
}
