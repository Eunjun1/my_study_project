import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchValue;
  late String images;
  late String imagesName;

  @override
  void initState() {
    super.initState();
    switchValue = true;
    images = 'pikachu-2.jpg';
    imagesName = 'Pikachu';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(imagesName)),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('images/$images'),
            ),
            Switch(
              value: switchValue,
              onChanged: (value) => {switchValue = value, _changeImage()},
            ),
          ],
        ),
      ),
    );
  }

  _changeImage() {
    (switchValue == true)
        ? (images = 'smile.png', imagesName = 'Smile')
        : (images = 'pikachu-2.jpg', imagesName = 'Pikachu');
    setState(() {});
  }
}
