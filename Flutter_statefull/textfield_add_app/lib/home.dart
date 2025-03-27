import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String calcResult;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    calcResult = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('덧셈 구하기')),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: num1Controller,
                  decoration: InputDecoration(
                    labelText: '첫번째 숫자를 입력하세요.',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: num2Controller,
                  decoration: InputDecoration(
                    labelText: '두번째 숫자를 입력하세요.',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    calcCheck();
                  },
                  child: Text('덧셈 계산'),
                ),
              ),
              Text(
                calcResult,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ------ Function -------

  calcCheck() {
    if (num1Controller.text.trim().isEmpty ||
        num2Controller.text.trim().isEmpty) {
      errorSnackBar();
    } else {
      int num1 = int.parse(num1Controller.text);
      int num2 = int.parse(num2Controller.text);

      int sum = num1 + num2;

      calcResult = "입력하신 숫자의 합은 $sum입니다.";
    }
    setState(() {});
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("숫자를 다시 입력해 주세요."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
