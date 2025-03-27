import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> imageFilses;

  late int currentPage;
  late int nextPage;

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
    nextPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(title: Text('무한 이미지 반복')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageFilses[currentPage],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 5),
                  ),
                  child: Image.asset(
                    'images/${imageFilses[currentPage]}',
                    fit: BoxFit.fill,
                    width: 300,
                    height: 400,
                  ),
                ),
                Positioned(
                  left: screenWidth - 155,
                  top: screenHeight - 533,
                  child: Opacity(
                    opacity: 0.6,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 3),
                      ),
                      child: Image.asset(
                        'images/${imageFilses[nextPage]}',
                        fit: BoxFit.fill,
                        width: 60,
                        height: 80,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => prevButton(),
                  child: Text('<< 이전'),
                ),
                ElevatedButton(
                  onPressed: () {
                    nextButton();
                  },
                  child: Text('다음 >>'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // -------- function --------

  prevButton() {
    currentPage--;
    if (currentPage < 0) {
      currentPage = imageFilses.length - 1;
    }
    nextPage--;
    if (nextPage < 0) {
      nextPage = imageFilses.length - 1;
    }
    setState(() {});
  }

  nextButton() {
    currentPage++;
    if (currentPage >= imageFilses.length) {
      currentPage = 0;
    }
    nextPage++;
    if (nextPage >= imageFilses.length) {
      nextPage = 0;
    }
    setState(() {});
  }
}
