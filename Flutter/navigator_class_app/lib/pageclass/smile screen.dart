import 'package:flutter/material.dart';

class Smilepage extends StatelessWidget {
  const Smilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smile Screen')),

      body: Center(
        child: Column(
          children: [
            Image.asset('images/smile.png'),

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
