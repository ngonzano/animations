import 'package:flutter/material.dart';
import '../animacion/implicita.dart';

class AnimacionesDemo extends StatelessWidget {
  AnimacionesDemo({super.key});
  final ValueNotifier<bool> isTouch = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pag. 19'),
                  SizedBox(height: 10),
                  Text('AnimatedPadding'),
                  SizedBox(height: 20),
                  AnimacionPadding(),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pag. 18'),
                  SizedBox(height: 10),
                  Text('AnimatedRotation'),
                  SizedBox(height: 20),
                  AnimacionRotation(),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pag. 17'),
                  SizedBox(height: 10),
                  Text('AnimatedSize'),
                  SizedBox(height: 20),
                  AnimacionSize(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 16'),
                  const SizedBox(height: 10),
                  const Text('AnimatedPhysicalModel'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                    child: const AnimacionPhysicalModel(),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 15'),
                  const SizedBox(height: 10),
                  const Text('AnimatedDefaultTextStyle'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                    child: const AnimacionDefaultTextStyle(),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 14'),
                  const SizedBox(height: 10),
                  const Text('SlideTransition'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                    child: const AnimacionSizeTransition(),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 13'),
                  const SizedBox(height: 10),
                  const Text('ScaleTransition'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                    child: const AnimacionScaleTransition(),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 12'),
                  const SizedBox(height: 10),
                  const Text('RotationTransition'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                    child: const AnimacionRotationTransition(),
                  ),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pag. 11'),
                  SizedBox(height: 10),
                  Text('FadeTransition'),
                  SizedBox(height: 20),
                  AnimacionFadeTransition(),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pag. 10'),
                  SizedBox(height: 10),
                  Text('DecorationTween, DecoratedBoxTransition'),
                  SizedBox(height: 20),
                  AnimacionDecoratedBoxTransition(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 9'),
                  const SizedBox(height: 10),
                  const Text(
                      'Widget:AnimationController,Transform.rotate, AnimatedBuilder: recontruye solo lo que se encuentra dentro del child'),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: isTouch,
                    builder: (_, value, child) {
                      return GestureDetector(
                        onTap: () {
                          isTouch.value = !isTouch.value;
                        },
                        child: AnimacionBuilder(
                          isFullSize: value,
                          size: size,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 8'),
                  const SizedBox(height: 10),
                  const Text('Widget: AnimatedContainer'),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: isTouch,
                    builder: (_, value, child) {
                      return GestureDetector(
                        onTap: () {
                          isTouch.value = !isTouch.value;
                        },
                        child: AnimacionContainer(
                          isFullSize: value,
                          size: size,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 7'),
                  const SizedBox(height: 10),
                  const Text('Widget: AnimatedCrossFade'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.8,
                    child: ValueListenableBuilder(
                      valueListenable: isTouch,
                      builder: (_, value, child) {
                        return GestureDetector(
                          onTap: () {
                            isTouch.value = !isTouch.value;
                          },
                          child: AnimacionCrossFade(
                            isFullSize: value,
                            size: size,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 6'),
                  const SizedBox(height: 10),
                  const Text('Widget: AnimatedAlign, AnimatedContainer'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.8,
                    child: ValueListenableBuilder(
                      valueListenable: isTouch,
                      builder: (_, value, child) {
                        return GestureDetector(
                          onTap: () {
                            isTouch.value = !isTouch.value;
                          },
                          child: AnimacionAlign(
                            isFullSize: value,
                            size: size,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 5'),
                  const SizedBox(height: 10),
                  const Text('Widget: AnimatedPositioned'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.8,
                    child: ValueListenableBuilder(
                      valueListenable: isTouch,
                      builder: (BuildContext context, value, Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            isTouch.value = !isTouch.value;
                          },
                          child: AnimacionPositioned(
                            isFullSize: value,
                            size: size,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Pag. 4'),
                  const SizedBox(height: 10),
                  const Text('Widget: AnimatedList, SizeTransition'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.5,
                    child: const AnimacionList(),
                  ),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pag. 3'),
                  SizedBox(height: 10),
                  Text('Widget: AnimacionSwitcher, AnimatedOpacity'),
                  SizedBox(height: 20),
                  AnimacionSwitcher(),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pag. 2'),
                  SizedBox(height: 10),
                  Text('Widget: AspectRatio'),
                  SizedBox(height: 20),
                  WidgetNuevos(),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pag. 1'),
                  SizedBox(height: 10),
                  Text('Opcacity, CurvedAnimation, AnimatedWidget, Tween'),
                  SizedBox(height: 20),
                  LogoApp(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Pag. 2
///

///Pag. 1
class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  // Haga que los Tweens sean estáticos porque no cambian.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 100);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
///
