import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';

class TransformDemo extends StatefulWidget {
  const TransformDemo({super.key});

  @override
  State<TransformDemo> createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo>
    with TickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  late AnimationController _controllerAnimation2;
  late Animation<double> _animation;
  late Animation<double> _animation2;
  @override
  void initState() {
    super.initState();
    _controllerAnimation = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _controllerAnimation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _controllerAnimation.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controllerAnimation.forward(from: 0.0);
        }
      },
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controllerAnimation);

    _controllerAnimation.forward();

    _controllerAnimation2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controllerAnimation2);
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    _controllerAnimation2.dispose();
    super.dispose();
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controllerAnimation2.forward(from: 0.0);
          count++;
          _controllerAnimation2.forward();
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          builder: (BuildContext context, Widget? child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Transform.rotate'),
                      const SizedBox(width: 20),
                      Transform.rotate(
                        angle: _animation.value * 2.0 * math.pi,
                        child: const Icon(
                          Icons.flutter_dash_sharp,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Transform.scale'),
                      const SizedBox(width: 20),
                      Transform.scale(
                        scale: 1.5 * _animation.value.clamp(0.1, 1.5),
                        child: const Icon(
                          Icons.flutter_dash_sharp,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Transform.translate'),
                      const SizedBox(width: 20),
                      Transform.translate(
                        offset: Offset(
                            20 * _animation.value, 10 * _animation.value),
                        child: const Icon(
                          Icons.flutter_dash_sharp,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Transform with Matrix4.skew'),
                      const SizedBox(width: 20),
                      Transform(
                        transform: Matrix4.skew(
                            0.3 * _animation.value, 0.1 * _animation.value)
                        // ..rotateZ(-math.pi * _animation.value / 12.0)
                        ,
                        child: const Icon(
                          Icons.flutter_dash_sharp,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Transform with Matrix4.identity'),
                      const SizedBox(width: 20),
                      Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.01)
                          ..rotateX(pi / 2 * _animation.value),
                        alignment: FractionalOffset.center,
                        child: const Icon(
                          Icons.flutter_dash_sharp,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 100,
                        height: 110,
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '$count',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 80,
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, -0.005)
                          ..rotateX(pi * _animation2.value) //_animation2.value
                          ..rotateY(pi),
                        alignment: Alignment.topCenter,
                        origin: const Offset(0, 0),
                        child: Container(
                          width: 100,
                          height: 55,
                          // alignment: Alignment.bottomCenter,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Transform.rotate(
                            angle: pi,
                            child: Text(
                              '${count}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 80,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          animation: _animation,
        ),
      ),
    );
  }
}
