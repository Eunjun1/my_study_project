import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String buttonString;
  late Color buttonColor;
  late double imagesWidtho;
  late double imagesWidtht;
  late String imagespika;
  List<String> pika = [
    'images/pikachu-1.jpg',
    'images/pikachu-2.jpg',
    'images/pikachu-3.jpg',
    'images/apple.jpeg',
    'images/banana.jpeg',
    'images/peach.jpeg',
    'images/pineapple.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    buttonString = "Hello";
    buttonColor = Colors.blue;
    imagesWidtho = 100;
    imagesWidtht = 100;
    imagespika = pika[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Change button color & text',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('images/smile.png', width: imagesWidtho),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(imagespika, width: imagesWidtht),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () => _onClick_minus(),
                    child: Text('축소', style: TextStyle(color: Colors.black)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                  onPressed: () => _onClickbefore(),
                  child: Text(
                    buttonString,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                  onPressed: () => _onClicknext(),
                  child: Text(
                    buttonString,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () => _onClick_plus(),
                    child: Text('확대', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onClicknext() {
    int i = pika.indexOf(imagespika);
    (i == (pika.length - 1))
        ? {imagespika = pika[0]}
        : {
          (buttonString == 'Hello')
              ? (
                buttonString = 'Flutter',
                buttonColor = Colors.amber,
                imagespika = pika[i + 1],
              )
              : (
                buttonString = 'Hello',
                buttonColor = Colors.blue,
                imagespika = pika[i + 1],
              ),
        };

    setState(() {});
  }

  _onClickbefore() {
    int i = pika.indexOf(imagespika);
    (i == 0)
        ? {imagespika = pika[(pika.length - 1)]}
        : {
          (buttonString == 'Hello')
              ? (
                buttonString = 'Flutter',
                buttonColor = Colors.amber,
                imagespika = pika[i - 1],
              )
              : (
                buttonString = 'Hello',
                buttonColor = Colors.blue,
                imagespika = pika[i - 1],
              ),
        };

    setState(() {});
  }

  _onClick_plus() {
    imagesWidtho += 10;
    imagesWidtht -= 10;
    setState(() {});
  }

  _onClick_minus() {
    imagesWidtht += 10;
    imagesWidtho -= 10;
    setState(() {});
  }
}
