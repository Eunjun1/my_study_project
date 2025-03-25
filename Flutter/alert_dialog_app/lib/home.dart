import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Dialog with Gesture')),

      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text('Hello World!'),
        ),
      ),
    );
  }

  // -------function-----------
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert Title'),
          content: Text('Hello World를 Touch했습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('종료'),
            ),
          ],
        );
      },
    );
  }
}
