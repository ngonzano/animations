import 'package:flutter/material.dart';

// This shader was taken from ShaderToy
// Origin of Shader: https://www.shadertoy.com/view/tsXBzS
class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('modificar'),
    );
  }
}
