import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

// This shader was taken from ShaderToy
// Origin of Shader: https://www.shadertoy.com/view/tsXBzS
class ShadersDemo extends StatefulWidget {
  const ShadersDemo({Key? key}) : super(key: key);

  @override
  State<ShadersDemo> createState() => _ShadersDemoState();
}

class _ShadersDemoState extends State<ShadersDemo>
    with SingleTickerProviderStateMixin {
  double time = 0;

  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      time += 0.035;
      setState(() {});
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Center(
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Colors.white, Colors.purple],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: const Text('Fractal Pyramid Shader'),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ShaderBuilder(
        assetKey: 'shaders/pyramid.glsl',
        child: SizedBox(width: size.width, height: size.height),
        (context, shader, child) {
          return AnimatedSampler(
            child: child!,
            (ui.Image image, Size size, Canvas canvas) {
              shader
                ..setFloat(0, time)
                ..setFloat(1, size.width)
                ..setFloat(2, size.height);
              canvas.drawPaint(Paint()..shader = shader);
            },
          );
        },
      ),
    );
  }
}
