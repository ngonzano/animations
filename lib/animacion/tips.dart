import 'package:flutter/material.dart';

class Bordes extends StatelessWidget {
  const Bordes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade900,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width * 2, 100),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.deepPurple.shade900,
                    blurRadius: 12,
                    offset: const Offset(0, 12))
              ]),
        ),
      ),
    );
  }
}
