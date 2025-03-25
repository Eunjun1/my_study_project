import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen 2st'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/smile'),
              child: Text('Go to Screen Smile'),
            ),
          ],
        ),
      ),
    );
  }
}
