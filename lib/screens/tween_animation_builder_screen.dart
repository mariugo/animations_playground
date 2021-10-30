import 'package:flutter/material.dart';

class TweenAnimationBuilderScreen extends StatelessWidget {
  const TweenAnimationBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tween Animation Builder',
          ),
        ),
        body: Center(
          child: HSLColorSelector(),
        ),
      ),
    );
  }
}

class HSLColorSelector extends StatefulWidget {
  const HSLColorSelector({Key? key}) : super(key: key);

  @override
  State<HSLColorSelector> createState() => _HSLColorSelectorState();
}

class _HSLColorSelectorState extends State<HSLColorSelector> {
  double _hsl = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: _hsl),
          duration: const Duration(milliseconds: 1500),
          builder: (context, hsl, child) {
            final hslColor = HSVColor.fromAHSV(1, hsl, 1, 1);
            return Container(
              width: 200,
              height: 200,
              color: hslColor.toColor(),
            );
          },
        ),
        const SizedBox(
          height: 48,
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                for (var i = 0; i <= 360; i++)
                  HSVColor.fromAHSV(1, i.toDouble(), 1, 1).toColor(),
              ],
              stops: [
                for (var i = 0; i <= 360; i++) i.toDouble() / 360,
              ],
            ),
          ),
        ),
        Slider.adaptive(
          value: _hsl,
          min: 0,
          max: 360,
          onChanged: (value) => setState(
            () {
              _hsl = value;
            },
          ),
        ),
      ],
    );
  }
}
