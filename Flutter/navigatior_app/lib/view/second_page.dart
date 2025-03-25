import 'package:flutter/material.dart';
import 'package:navigatior_app/view/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(270, 30)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ThirdPage();
                    },
                  ),
                );
              },
              child: Text('Go to the third page'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(270, 30)),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Back to the first page'),
            ),
          ],
        ),
      ),
    );
  }
}
