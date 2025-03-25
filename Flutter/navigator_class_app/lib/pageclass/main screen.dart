import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/1st'),
                  child: Text('Go to Screen 1st'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/2nd'),
                  child: Text('Go to Screen 2nd'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
