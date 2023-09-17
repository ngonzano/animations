import 'package:flutter/material.dart';

import 'doc_flutter/home.dart';
import 'package/card_swiper.dart';

class MyMenuPage extends StatelessWidget {
  const MyMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones'),
        backgroundColor: Colors.deepPurple.shade700,
        foregroundColor: Colors.deepPurple.shade50,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Animacion Inplicita'),
            trailing: const Icon(Icons.arrow_circle_right),
            leading: const Icon(Icons.animation),
            onTap: () {
              Navigator.of(context).pushNamed('animacion/implicita');
            },
          ),
          const Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          ListTile(
            title: const Text('ValueListenableBuilderPage'),
            trailing: const Icon(Icons.arrow_circle_right),
            onTap: () {
              Navigator.of(context).pushNamed('widget/valueListenableBuilder');
            },
          ),
          const Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          ListTile(
            title: const Text('Boton animado 1'),
            trailing: const Icon(Icons.arrow_circle_right),
            onTap: () {
              Navigator.of(context).pushNamed('util/boton');
            },
          ),
          const Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          //animacion/tips
          ListTile(
            title: const Text('BorderRadius'),
            trailing: const Icon(Icons.arrow_circle_right),
            onTap: () {
              Navigator.of(context).pushNamed('animacion/tips');
            },
          ),
          const Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          ListTile(
            title: const Text('Fondo degradado'),
            trailing: const Icon(Icons.arrow_circle_right),
            onTap: () {
              Navigator.of(context).pushNamed('util/fondo');
            },
          ),
          const Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          ListTile(
            title: const Text('Animacion Doc Flutter'),
            trailing: const Icon(Icons.arrow_circle_right),
            onTap: () {
              Future(() {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) {
                      return FadeTransition(
                        opacity: animation1,
                        child: const HomePage(),
                      );
                    },
                  ),
                );
              });
            },
          ),
          const Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          ListTile(
            title: const Text('Packages'),
            trailing: const Icon(Icons.arrow_circle_right),
            onTap: () {
              Future(() {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) {
                      return FadeTransition(
                        opacity: animation1,
                        child: const CardSwiper(),
                      );
                    },
                  ),
                );
              });
            },
          ),
          const Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
        ],
      ),
    );
  }
}
