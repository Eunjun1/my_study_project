import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> imageFilses;
  late int currentPage;

  @override
  void initState() {
    super.initState();
    imageFilses = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentPage = 0;

    // Timer 설치

    Timer.periodic(Duration(milliseconds: 3000), (timer) {
      changerImage();
    });
  }

  changerImage() {
    currentPage++;
    if (currentPage >= imageFilses.length) {
      currentPage = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('3초마다 이미지 무한 반복')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageFilses[currentPage],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('images/${imageFilses[currentPage]}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
