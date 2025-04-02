import 'dart:async';
import 'package:flutter/material.dart';

class Timerpage extends StatefulWidget {
  const Timerpage({super.key});

  @override
  State<Timerpage> createState() => _TimerpageState();
}

class _TimerpageState extends State<Timerpage> {
  late List<String> imageFilses;
  late int currentPage;
  late Timer timer;

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

    timer = Timer.periodic(Duration(milliseconds: 3000), (timer) {
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
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
