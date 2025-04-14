import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property

  late String _lampImage; // Image File name
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late String _buttonName; // Button title
  late bool _switch; // Switch 켜짐 상태
  late bool _lampSizeStatus; // 현재 화면의 Lamp크기
  late double _rotation; // 회전 각도

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = 'Image 확대';
    _switch = true;
    _lampSizeStatus = false;
    _rotation = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image확대 및 축소')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 550,
              child: Column(
                children: [
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(_rotation / 360),
                    child: Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    dicisionLampSize();
                  },
                  child: Text(_buttonName),
                ),
                Column(
                  children: [
                    Text('전구 스위치', style: TextStyle(fontSize: 10)),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        dicisionOnOff();
                        setState(() {
                          _switch = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 250,
              child: Slider(
                min: 0,
                max: 360,
                value: _rotation,
                onChanged: (value) {
                  _rotation = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Functions

  dicisionLampSize() {
    if (_lampSizeStatus) {
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = 'Image 확대';
      _lampSizeStatus = false;
    } else {
      _lampWidth = 250;
      _lampHeight = 500;
      _buttonName = 'Image 축소';
      _lampSizeStatus = true;
    }
    setState(() {});
  }

  dicisionOnOff() {
    _lampImage = _switch ? 'images/lamp_on.png' : 'images/lamp_off.png';

    setState(() {});
  }
}
