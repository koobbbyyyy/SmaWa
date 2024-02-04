import 'package:flutter/material.dart';

class FancyPulsatingButton extends StatefulWidget {
  final VoidCallback onPressed;

  const FancyPulsatingButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _FancyPulsatingButtonState createState() => _FancyPulsatingButtonState();
}

class _FancyPulsatingButtonState extends State<FancyPulsatingButton>
    with SingleTickerProviderStateMixin {
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
          scale: 1.0 + _animation.value * 0.3, // Scale up to 1.3
          child: Transform.rotate(
            angle: _animation.value * 0.2, // Rotate slightly
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24), // Adjust the padding to control button size
                elevation: 10,
                primary: Colors.transparent, // Transparent background
                onPrimary: Colors.blue, // Color when pressed
                shadowColor: Colors.blueAccent, // Shadow color
              ),
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.lightBlue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.camera,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
