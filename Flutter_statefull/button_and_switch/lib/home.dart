import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Color buttonColor;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    buttonColor = Colors.blue;
    switchValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Changed Button color on Switch')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              onPressed: () {
                _colorChange();
              },
              child: Text('Flutter'),
            ),
            SizedBox(height: 50),
            Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
                _colorChange();
              },
            ),
          ],
        ),
      ),
    );
  }

  _colorChange() {
    if (switchValue = false) {
      buttonColor = Colors.red;
      switchValue = true;
    }
    if (switchValue = true) {
      buttonColor = Colors.blue;
      switchValue = false;
    }
    setState(() {});
  }
}
