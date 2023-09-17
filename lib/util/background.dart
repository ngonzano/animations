import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Fondo extends StatelessWidget {
  const Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.pink,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.red,
                    offset: Offset(0, 6),
                    blurRadius: 12,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: CustomPaint(
                size: const Size(100, 170),
                painter: CustomPainterBoxShape(
                  endColor: Colors.red,
                  radius: 24,
                  startColor: Colors.pink,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget background() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.purpleAccent.shade100,
          Colors.blue.shade50,
        ], end: Alignment.topLeft, begin: Alignment.bottomRight),
      ),
    );
  }
}

class CustomPainterBoxShape extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomPainterBoxShape(
      {required this.radius, required this.startColor, required this.endColor});
  @override
  void paint(Canvas canvas, Size size) {
    // final double radius;
    final Paint paint = Paint();

    paint.shader = ui.Gradient.linear(
      const Offset(0, 0),
      Offset(size.width, size.height),
      [
        HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
        endColor,
      ],
    );
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
        size.width,
        size.height,
        size.width,
        size.height - radius,
      )
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint

    return true;
    // throw UnimplementedError();
  }
}
