import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property

  late List imageName;
  late int selectedItem;

  @override
  void initState() {
    super.initState();
    imageName = [
      'images/w1.jpg',
      'images/w2.jpg',
      'images/w3.jpg',
      'images/w4.jpg',
      'images/w5.jpg',
      'images/w6.jpg',
      'images/w7.jpg',
      'images/w8.jpg',
      'images/w9.jpg',
      'images/w10.jpg',
    ];
    selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Picker View')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Picker View로 이미지 선택',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: CupertinoPicker(
                itemExtent: 100,
                scrollController: FixedExtentScrollController(initialItem: 0),
                onSelectedItemChanged: (value) {
                  selectedItem = value;
                  setState(() {});
                },
                children:
                // Center(child: Image.asset(imageName[0], width: 50)),
                // Center(child: Image.asset(imageName[1], width: 50)),
                // Center(child: Image.asset(imageName[2], width: 50)),
                // Center(child: Image.asset(imageName[3], width: 50)),
                // Center(child: Image.asset(imageName[4], width: 50)),
                // Center(child: Image.asset(imageName[5], width: 50)),
                // Center(child: Image.asset(imageName[6], width: 50)),
                // Center(child: Image.asset(imageName[7], width: 50)),
                // Center(child: Image.asset(imageName[8], width: 50)),
                // Center(child: Image.asset(imageName[9], width: 50)),
                List.generate(
                  imageName.length,
                  (index) => Center(child: Image.asset(imageName[index])),
                ),
              ),
            ),
            Text('Selected Item : ${imageName[selectedItem]}'),
            SizedBox(
              width: 200,
              height: 250,
              child: Image.asset(imageName[selectedItem]),
            ),
          ],
        ),
      ),
    );
  }
}
