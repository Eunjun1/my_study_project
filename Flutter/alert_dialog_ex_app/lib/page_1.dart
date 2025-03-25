import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Alert and push'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text('Move the 2nd page.'),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Page 이동'),
          content: Text('아래 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('cancle'),
            ),
            TextButton(
              onPressed: () => Navigator.popAndPushNamed(context, '/P2'),
              child: Text('Page 이동'),
            ),
          ],
        );
      },
    );
  }
}
