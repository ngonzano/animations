import 'package:flutter/material.dart';

class ValueListenableBuilderPage extends StatelessWidget {
  ValueListenableBuilderPage({super.key});

  final ValueNotifier<int> number = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                number.value++;
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable: number,
                builder: (_, value, ___) {
                  return Text('$value');
                })
          ],
        ),
      ),
    );
  }
}
