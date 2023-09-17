import 'package:flutter/material.dart';

class BotonAnimado extends StatelessWidget {
  BotonAnimado({super.key});
  final ValueNotifier<bool> isTouch = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BotonAnimado1(
                isTouch: isTouch,
                size: size,
                textPrimario: 'PAGAR',
                textSecundario: 'CARGANDO',
                colorPrimario: Colors.green,
                colorSecundario: Colors.green.shade400,
                duracion: const Duration(milliseconds: 300),
                colorText: Colors.white70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BotonAnimado1 extends StatelessWidget {
  const BotonAnimado1({
    super.key,
    required this.isTouch,
    required this.size,
    required this.textPrimario,
    required this.textSecundario,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.duracion,
    required this.colorText,
  });

  final ValueNotifier<bool> isTouch;
  final Size size;
  final String textPrimario;
  final String textSecundario;
  final Color colorPrimario;
  final Color colorSecundario;
  final Duration duracion;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isTouch.value = !isTouch.value;
      },
      child: ValueListenableBuilder(
        builder: (context, value, child) {
          return AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorPrimario,
              boxShadow: [
                BoxShadow(
                  spreadRadius: value ? 0 : 1,
                  color: colorText,
                  blurRadius: value ? 0 : 10,
                  blurStyle: BlurStyle.normal,
                ),
                BoxShadow(
                  spreadRadius: value ? 0 : 5,
                  color: colorSecundario,
                  blurRadius: value ? 5 : 50,
                  blurStyle: BlurStyle.normal,
                ),
                BoxShadow(
                  spreadRadius: value ? 0 : 5,
                  color: colorSecundario,
                  blurRadius: value ? 10 : 50,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            alignment: Alignment.center,
            width: size.width * 0.8,
            height: 55,
            duration: duracion,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: duracion,
                  top: value ? 17.5 : -20,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Text(
                    textPrimario,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        color: colorText),
                  ),
                ),
                AnimatedPositioned(
                  duration: duracion,
                  top: value ? 57.5 : 5,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'CARGANDO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                          color: colorText,
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircularProgressIndicator(
                        backgroundColor: colorText,
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation(colorSecundario),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        valueListenable: isTouch,
      ),
    );
  }
}
