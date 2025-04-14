import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/lamp.dart';

class LampStatus extends StatefulWidget {
  const LampStatus({super.key});

  @override
  State<LampStatus> createState() => _LampStatusState();
}

class _LampStatusState extends State<LampStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('수정화면')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: Text(
                      Lamp.lampColor =
                          Lamp.lightValue
                              ? Lamp.lamp == 'images/lamp_red.png'
                                  ? 'Red'
                                  : 'Yellow'
                              : 'Lamp가 꺼져있습니다.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Switch(
                    value: Lamp.colorValue,
                    onChanged: (value) {
                      if (Lamp.lightValue) {
                        if (Lamp.colorValue) {
                          Lamp.lamp = 'images/lamp_red.png';
                        } else {
                          Lamp.lamp = 'images/lamp_on.png';
                        }
                      }
                      setState(() {
                        Lamp.colorValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 150,
                  child: Text(Lamp.lampLight, textAlign: TextAlign.center),
                ),
                Switch(
                  value: Lamp.lightValue,
                  onChanged: (value) {
                    if (Lamp.lightValue) {
                      Lamp.lampLight = 'Off';
                      Lamp.lamp = 'images/lamp_off.png';
                    } else {
                      Lamp.lampLight = 'On';
                      if (Lamp.colorValue) {
                        Lamp.lamp = 'images/lamp_on.png';
                      } else {
                        Lamp.lamp = 'images/lamp_red.png';
                      }
                    }
                    setState(() {
                      Lamp.lightValue = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
