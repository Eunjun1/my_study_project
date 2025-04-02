import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Swipepage extends StatefulWidget {
  const Swipepage({super.key});

  @override
  State<Swipepage> createState() => _SwipepageState();
}

class _SwipepageState extends State<Swipepage> {
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
      body: SimpleGestureDetector(
        onHorizontalSwipe:
            (direction) => onHorizontalSwipe(direction), // direction이 스왑핑 방향 저장

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
}
