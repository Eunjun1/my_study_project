import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(270, 30)),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Back to the first page'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(270, 30)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to the second page'),
            ),
          ],
        ),
      ),
    );
  }
}
