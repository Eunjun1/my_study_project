import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool switchValue;
  late double lampSize;
  late int rotation;

  @override
  void initState() {
    super.initState();
    switchValue = false;
    lampSize = 150;
    rotation = 0;

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (lampSize == 300) {
        rotation = 0;
      } else {
        if (switchValue == true) {
          rotation += 10;
          if (rotation >= 360) {
            rotation = 0;
          }
        } else {
          rotation -= 10;
          if (rotation <= 0) {
            rotation = 360;
          }
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('images 확대 및 축소', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 400,
                height: 500,
                child: Center(
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(rotation / 360),
                    child:
                        switchValue == false
                            ? Image.asset(
                              'images/lamp_off.png',
                              width: lampSize,
                            )
                            : Image.asset(
                              'images/lamp_on.png',
                              width: lampSize,
                            ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 100,
                    child: TextButton(
                      onPressed: () => sizeChange(),
                      child: Text(
                        lampSize == 300 ? 'Zoom Out' : 'Zoom In',
                        style: TextStyle(
                          color: lampSize == 300 ? Colors.red : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Switch(
                    activeTrackColor: const Color.fromARGB(255, 247, 217, 128),
                    value: switchValue,
                    onChanged: (value) {
                      value = switchValue;
                      switchChange();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor:
          switchValue == true
              ? const Color.fromARGB(255, 251, 237, 196)
              : Colors.white,
    );
  }

  sizeChange() {
    if (lampSize == 150) {
      lampSize = 300;
    } else {
      lampSize = 150;
    }
    setState(() {});
  }

  switchChange() {
    if (switchValue == false) {
      switchValue = true;
    } else {
      switchValue = false;
    }

    setState(() {});
  }
}
