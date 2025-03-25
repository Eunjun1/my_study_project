import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen 1st'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/pika'),
              child: Text('Go to Screen Pikachu'),
            ),
          ],
        ),
      ),
    );
  }
}
