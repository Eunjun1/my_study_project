import 'package:flutter/material.dart';

class Pikachupage extends StatelessWidget {
  const Pikachupage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pikachu Screen')),

      body: Center(
        child: Column(
          children: [
            Image.asset('images/pikachu-1.jpg'),

            ElevatedButton(
              onPressed:
                  () => Navigator.popUntil(context, (route) => route.isFirst),
              child: Text('Go to main'),
            ),
          ],
        ),
      ),
    );
  }
}
