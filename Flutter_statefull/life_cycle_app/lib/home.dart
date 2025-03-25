import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property(Field,Attribute)

  late String buttonState;
  late Color buttonColor;
  late Color stringColor;

  @override
  void initState() {
    super.initState();
    buttonState = "OFF";
    buttonColor = const Color.fromARGB(255, 70, 70, 70);
    stringColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Cycle'),
        //
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              onPressed: () => onClick(),
              child: Text('버튼을 누르세요', style: TextStyle(color: stringColor)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('버튼상태 : '), Text(buttonState)],
            ),
          ],
        ),
      ),
    );
  }

  // ------function------

  onClick() {
    (buttonState == "OFF")
        ? (
          buttonState = "ON",
          buttonColor = Colors.amber,
          stringColor = Colors.black,
        )
        : (
          buttonState = "OFF",
          buttonColor = const Color.fromARGB(255, 70, 70, 70),
          stringColor = Colors.white,
        );
    setState(() {});
  }

  
}
