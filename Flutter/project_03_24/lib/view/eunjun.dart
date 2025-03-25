import 'package:flutter/material.dart';

class EjScreen extends StatelessWidget {
  const EjScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '조장이란',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
      ),

      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Image.asset("images/EJdog.jpg", height: 300, width: 200),
                SizedBox(width: 50, height: 30),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '이름 : 김은준',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '나이 : 25살 (01)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '사는 곳 : 의정부',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '학과 : 컴퓨터 정보보안',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '강아지이름 : 바닐라 (포메)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30, height: 30),
                ElevatedButton(
                  onPressed:
                      () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                  child: Text('메인으로'),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 248, 195, 213),
    );
  }
}
