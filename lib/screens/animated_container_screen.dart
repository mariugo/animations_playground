import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.red;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Animated Container',
          ),
        ),
        body: Center(
          child: Container(
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(color: _color, borderRadius: _borderRadius),
          ),
        ),
      ),
    );
  }
}
