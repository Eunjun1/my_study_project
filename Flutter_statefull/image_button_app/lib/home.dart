import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> imagName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imagName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('무한 이미지 반복'), backgroundColor: Colors.red),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(imagName[currentImage]),
            Image.asset('images/${imagName[currentImage]}', width: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _onClick('-'),
                  child: Text('<< 이전'),
                ),
                ElevatedButton(
                  onPressed: () => _onClick('+'),
                  child: Text('다음 >>'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onClick(String i) {
    if (i == '+') {
      currentImage += 1;
      if (currentImage >= imagName.length) {
        currentImage = 0;
      }
    } else if (i == '-') {
      currentImage -= 1;
      if (currentImage < 0) {
        currentImage = (imagName.length - 1);
      }
    }
    setState(() {});
  }
}
