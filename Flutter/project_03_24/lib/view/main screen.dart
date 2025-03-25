import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3팀 자기소개')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 30)),
                  onPressed: () => Navigator.pushNamed(context, '/EJ'),
                  child: Text('조장 소개 : 김은준'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 30)),
                  onPressed: () => Navigator.pushNamed(context, '/JW'),
                  child: Text('1번남 : 김재원'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 30)),
                  onPressed: () => Navigator.pushNamed(context, '/TM'),
                  child: Text('2번남 : 김태민'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 30)),
                  onPressed: () => Navigator.pushNamed(context, '/JH'),
                  child: Text('3번남 : 남정현'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: Size(150, 30)),
                  onPressed: () => Navigator.pushNamed(context, '/SB'),
                  child: Text('4번남 : 위성배'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
