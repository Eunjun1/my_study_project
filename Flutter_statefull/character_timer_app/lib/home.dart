import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> koreaText;
  late List<String> imageFilses;
  late int currentText;
  late String viewText;

  @override
  void initState() {
    super.initState();
    koreaText = ['대', '한', '민', '국'];
    imageFilses = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
    ];
    viewText = koreaText[0];
    currentText = 0;

    Timer.periodic(Duration(milliseconds: 500), (timer) {
      changeText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey, title: Text('LED 광고')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'images/${imageFilses[currentText]}',
                  width: 300,
                ),
              ),
            ),
            Text(
              viewText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }

  changeText() {
    currentText++;
    (currentText >= koreaText.length)
        ? (currentText = 0, viewText = koreaText[currentText])
        : viewText = viewText + koreaText[currentText];

    setState(() {});
  }
}
