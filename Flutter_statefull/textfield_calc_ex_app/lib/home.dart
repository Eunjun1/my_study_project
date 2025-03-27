import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller; // 첫번째 숫자 입력
  late TextEditingController num2Controller; // 두번째 숫자 입력
  late TextEditingController calcResult; // 계산 결과
  late bool show; // 계산 결과 보이기

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    calcResult = TextEditingController();

    show = false; // 초기값  (가리기)
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

        // ----- body ---------
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------- 첫번째 숫자 입력 필드 -----------
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

                    // ------ 첫번째 숫자 지우기버튼-------
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

                // ------ 두번째 숫자 입력 필드 ---------
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

                    // ------- 두번째 숫자 지우기 버튼 ----------
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

                // -------- 계산 산수, 계산 결과 --------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            // -------- 더하기 버튼 --------
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

                            // -------- 빼기 버튼 --------
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

                            // -------- 곱하기 버튼 --------
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
                            // -------- 나누기 버튼 --------
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

                        // -------- 전체 지우기 버튼 --------
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

                // -------- 계산 결과 --------
                Visibility(
                  visible: show,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: calcResult,
                      decoration: InputDecoration(labelText: '계산 결과'),
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

  // -------- 산수 함수 --------
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
        if (num2 == 0) {
          calcResult.text = "Impossible";
        } else {
          double sum = num1 / num2;
          calcResult.text = sum.toString();
        }
      }
    }
    setState(() {});
  }

  // -------- 에러 메시지 --------
  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("다시 입력해 주세요."),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  // -------- 전체 지우기 --------
  delet() {
    num1Controller.text = "";
    num2Controller.text = "";
    calcResult.text = "";
    show = false;
    FocusScope.of(context).unfocus();
  }

  // -------- 입력 숫자 지우기 --------
  deletNumber(int a) {
    (a == 1) ? num1Controller.text = "" : num2Controller.text = "";
  }
}
