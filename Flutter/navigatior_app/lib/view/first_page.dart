import 'package:flutter/material.dart';
import 'package:navigatior_app/view/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: Size(270, 30)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SecondPage();
                },
              ),
            );
          },
          child: Text('Go to the second page'),
        ),
      ),
    );
  }
}
