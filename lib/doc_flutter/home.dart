import 'package:animacion/doc_flutter/implicit_animations.dart';
import 'package:animacion/doc_flutter/shaders.dart';
import 'package:animacion/doc_flutter/transform.dart';
import 'package:animacion/doc_flutter/tutorial.dart';
import 'package:flutter/material.dart';

import 'animate_page_route_transition.dart';
import 'animated_container.dart';
import 'staggered_animations.dart';
import 'staggered_menu_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final TextStyle style = const TextStyle(
    color: Colors.white,
    fontSize: 15,
    letterSpacing: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ButtonDemo(
                text: 'Tutorial Fluter Doc',
                child: AnimacionesDemo(),
              ),
              const ButtonDemo(
                text: 'Implicit Animations',
                child: ImplicitAnimations(),
              ),
              const ButtonDemo(
                text: 'Animated Container',
                child: AnimatedContainerDemo(),
              ),
              const ButtonDemo(
                text: 'Hero Animation',
                child: AnimatedContainerDemo(),
              ),
              const ButtonDemo(
                text: 'Animate a page route transition',
                child: AnimatePageRouteTransitionDemo(),
              ),
              const ButtonDemo(
                text: 'Animate using a physics simulation',
                child: AnimatePageRouteTransitionDemo(),
              ),
              const ButtonDemo(
                text: 'Staggered animations',
                child: StaggeredAnimations(),
              ),
              const ButtonDemo(
                text: 'staggered menu animation',
                child: StaggeredMenuAnimation(),
              ),
              const ButtonDemo(
                text: 'Shaders',
                child: ShadersDemo(),
              ),
              const ButtonDemo(
                text: 'Transform',
                child: TransformDemo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    super.key,
    required this.child,
    required this.text,
  });

  final Widget child;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: () {
            Future(() {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) {
                    return FadeTransition(opacity: animation1, child: child);
                  },
                ),
              );
            });
          },
          minWidth: size.width * 0.5,
          height: 50,
          color: Colors.deepPurple,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}
