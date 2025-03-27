import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String buttonText;
  late bool buttonCheck; // Hello: true,Flutter:false
  late Color buttonBackColor;
  late Color backGroundColor;
  late int buttonClickTime;

  @override
  void initState() {
    super.initState();
    buttonText = "Hello";
    buttonCheck = true;
    buttonBackColor = Colors.blue;
    backGroundColor = Colors.white;
    buttonClickTime = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change button color & Text")),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            onClick();
          },
          child: Text(buttonText),
          style: ElevatedButton.styleFrom(backgroundColor: buttonBackColor),
        ),
      ),
      backgroundColor: backGroundColor,
    );
  }

  // ---------function-------------

  onClick() {
    print(
      "현재 상태 : $buttonText, $buttonCheck, ${buttonBackColor == Colors.blue ? "Blue" : "Amber"}",
    );

    buttonClickTime++;
    (buttonCheck == true)
        ? (
          buttonText = "flutter",
          buttonCheck = false,
          buttonBackColor = Colors.amber,
        )
        : (
          buttonText = "Hello",
          buttonCheck = true,
          buttonBackColor = Colors.blue,
        );
    if (buttonClickTime % 10 == 0) {
      if (backGroundColor == Colors.white) {
        backGroundColor = Colors.amber;
      } else {
        (backGroundColor = Colors.white);
      }
      if (buttonClickTime % 10 == 5) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('너무 많이 눌렀습니다.')));
      }
    }
    print("바뀐 상태 : $buttonText, $buttonCheck, $buttonBackColor");
    print(buttonClickTime);
    setState(() {});
  }
}
