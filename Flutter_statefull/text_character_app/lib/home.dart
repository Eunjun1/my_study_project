import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textinputController;
  late List<String> textOutput;
  late int currentText;
  late String showText;

  @override
  void initState() {
    super.initState();
    currentText = 0;
    textinputController = TextEditingController();
    textOutput = [];
    showText = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('LED 광고')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              showText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      ),

      drawer: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 215, 102, 102),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Center(child: Text('광고 문구를 입력하시오.')),
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: textinputController,
                      decoration: InputDecoration(labelText: '내용을 입력해주세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () => inputText(),
                      child: Text('광고 문구 생성'),
                    ),
                  ),
                  ElevatedButton(onPressed: () => delet(), child: Text('지우기')),
                  Text(textinputController.text),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  inputText() {
    if (textinputController.text.trim().isEmpty) {
      errorSnackBar();
      setState(() {});
    } else {
      textOutput = textinputController.text.split('');
      showText = textOutput[currentText];

      Timer.periodic(Duration(seconds: 1), (timer) {
        currentText++;
        if (currentText >= textOutput.length) {
          currentText = 0;
          showText = textOutput[currentText];
        } else {
          showText += textOutput[currentText];
        }
        setState(() {});
      });
    }
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("다시 입력해 주세요."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  delet() {
    textinputController.text = '';
    setState(() {});
  }
}
