import 'package:flutter/material.dart';

class Buttonpage extends StatefulWidget {
  const Buttonpage({super.key});

  @override
  State<Buttonpage> createState() => _ButtonpageState();
}

class _ButtonpageState extends State<Buttonpage> {
  late List<String> imgName;
  late int currentImg;

  @override
  void initState() {
    super.initState();
    imgName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];
    currentImg = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(imgName[currentImg]),

            Image.asset('images/${imgName[currentImg]}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => preImg(), child: Text('이전')),
                ElevatedButton(onPressed: () => nextImg(), child: Text('다음')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  nextImg() {
    currentImg++;
    if (currentImg >= imgName.length) {
      currentImg = 0;
    }
    setState(() {});
  }

  preImg() {
    currentImg--;
    if (currentImg <= 0) {
      currentImg = imgName.length - 1;
    }
    setState(() {});
  }
}
