import 'package:animations_playground/screens/animated_container_screen.dart';
import 'package:animations_playground/screens/animated_opacity_screen.dart';
import 'package:animations_playground/screens/tween_animation_builder_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AnimationExample {
  animatedContainer,
  animatedOpacity,
  tweenAnimationBuilder,
}

extension on AnimationExample {
  String capitalizeFirstCharacter() {
    final name = describeEnum(this);
    return name.replaceRange(0, 1, name.characters.first.toUpperCase());
  }
}

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animations Playground",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Animations Playground",
            ),
          ),
          body: const AnimationExampleList(),
        ),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'animatedContainer':
            return MaterialPageRoute(
                builder: (_) => const AnimatedContainerScreen());
          case 'animatedOpacity':
            return MaterialPageRoute(
                builder: (_) => const AnimatedOpacityScreen());
          case 'tweenAnimationBuilder':
            return MaterialPageRoute(
                builder: (_) => const TweenAnimationBuilderScreen());
          default:
            throw UnimplementedError('Route ${settings.name} not found');
        }
      },
    );
  }
}

class AnimationExampleList extends StatelessWidget {
  const AnimationExampleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final example = AnimationExample.values[index];
        final routeName = describeEnum(example);
        return ListTile(
          title: Text(example.capitalizeFirstCharacter()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.of(context).pushNamed(routeName),
        );
      },
      itemCount: AnimationExample.values.length,
    );
  }
}
