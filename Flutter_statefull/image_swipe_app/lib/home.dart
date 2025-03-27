import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> imagName; // 이미지 리스트
  late int currentImage; // [currentImage]

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
      appBar: AppBar(title: Text('Image Swiping')),

      body: SimpleGestureDetector(
        onHorizontalSwipe:
            (direction) => onHorizontalSwipe(direction), // direction이 스왑핑 방향 저장

        onVerticalSwipe: (direction) => onVerticalSwipe(direction),

        onDoubleTap: () => onDoubleTap(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(imagName[currentImage]),
              Image.asset('images/${imagName[currentImage]}', width: 300),
            ],
          ),
        ),
      ),
    );
  }

  onHorizontalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.left) {
      // right ==> left
      currentImage += 1;
      if (currentImage >= imagName.length) {
        currentImage = 0;
      }
    } else {
      // left ==> right
      currentImage -= 1;
      if (currentImage < 0) {
        currentImage = (imagName.length - 1);
      }
    }
    setState(() {});
  }

  onVerticalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.up) {
      // down ==> up
      currentImage += 1;
      if (currentImage >= imagName.length) {
        currentImage = 0;
      }
    } else {
      // up ==> down
      currentImage -= 1;
      if (currentImage < 0) {
        currentImage = (imagName.length - 1);
      }
    }
    setState(() {});
  }

  onDoubleTap() {
    currentImage -= 1;
    if (currentImage < 0) {
      currentImage = (imagName.length - 1);
    }

    setState(() {});
  }
}
