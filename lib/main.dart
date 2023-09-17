import 'package:animacion/animacion/implicita.dart';
import 'package:flutter/material.dart';

import 'MyMenuPage.dart';
import 'animacion/tips.dart';
import 'util/background.dart';
import 'util/boton.dart';
import 'widget/valueListenableBuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Animaciones Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyMenuPage(),
        initialRoute: 'menu', //validar
        routes: {
          'animacion/tips': (_) => const Bordes(),
          'util/fondo': (_) => const Fondo(),
          'util/boton': (_) => BotonAnimado(),
          'widget/valueListenableBuilder': (_) => ValueListenableBuilderPage(),
          'menu': (_) => const MyMenuPage(),
          'animacion/implicita': (_) => const Implicita(),
        });
  }
}
