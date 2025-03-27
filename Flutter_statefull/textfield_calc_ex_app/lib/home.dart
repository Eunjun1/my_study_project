import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late TextEditingController calcResult;
  late bool show;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    calcResult = TextEditingController();

    show = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Simple Calculater',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("* 첫번째 숫자"),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 260,
                        child: TextField(
                          controller: num1Controller,
                          decoration: InputDecoration(
                            labelText: '숫자를 입력하세요.',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {
                          deletNumber(1);
                        },
                        child: Text(
                          '지우기',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('* 두번째 숫자'),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 260,
                        child: TextField(
                          controller: num2Controller,
                          decoration: InputDecoration(
                            labelText: '숫자를 입력하세요.',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {
                          deletNumber(2);
                        },
                        child: Text(
                          '지우기',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(20, 20),
                                ),
                                onPressed: () {
                                  calcCheck('+');
                                },
                                child: Text('+'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(20, 20),
                                ),
                                onPressed: () {
                                  calcCheck('-');
                                },
                                child: Text('-'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(20, 20),
                                ),
                                onPressed: () {
                                  calcCheck('x');
                                },
                                child: Text('x'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(20, 20),
                                ),
                                onPressed: () {
                                  calcCheck('%');
                                },
                                child: Text('÷'),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(120, 20),
                              backgroundColor: const Color.fromARGB(
                                255,
                                209,
                                62,
                                52,
                              ),
                            ),
                            onPressed: () {
                              delet();
                            },
                            child: Text(
                              '전체 지우기',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: show,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: calcResult,
                      decoration: InputDecoration(labelText: '결과'),
                      keyboardType: TextInputType.number,
                      readOnly: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------ Function -------

  calcCheck(String i) {
    if (num1Controller.text.trim().isEmpty ||
        num2Controller.text.trim().isEmpty) {
      errorSnackBar();
      show = false;
    } else {
      show = true;
      int num1 = int.parse(num1Controller.text);
      int num2 = int.parse(num2Controller.text);
      if (i == '+') {
        int sum = num1 + num2;
        calcResult.text = sum.toString();
      }
      if (i == '-') {
        int sum = num1 - num2;
        calcResult.text = sum.toString();
      }
      if (i == 'x') {
        int sum = num1 * num2;
        calcResult.text = sum.toString();
      }
      if (i == '%') {
        double sum = num1 / num2;
        calcResult.text = sum.toString();
      }
    }
    setState(() {});
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
    num1Controller.text = "";
    num2Controller.text = "";
    calcResult.text = "";
    show = false;
    FocusScope.of(context).unfocus();
  }

  deletNumber(int a) {
    (a == 1) ? num1Controller.text = "" : num2Controller.text = "";
  }
}
