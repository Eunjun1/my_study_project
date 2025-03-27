import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller; // 첫번째 숫자 입력
  late TextEditingController num2Controller; // 두번째 숫자 입력
  late TextEditingController addResult;
  late TextEditingController subResult;
  late TextEditingController multResult;
  late TextEditingController divResult; // 계산 결과
  late bool showAddResult;
  late bool showSubResult;
  late bool showMultResult;
  late bool showDivResult;
  late bool show;
  late bool showadd;
  late bool showsub;
  late bool showmult;
  late bool showdiv; // 계산 결과 보이기

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    addResult = TextEditingController();
    subResult = TextEditingController();
    multResult = TextEditingController();
    divResult = TextEditingController();
    show = false;
    showAddResult = false;
    showSubResult = false;
    showMultResult = false;
    showDivResult = false;
    showadd = false;
    showsub = false;
    showmult = false;
    showdiv = false; // 초기값  (가리기)
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 248, 219),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 193, 188, 126),
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
                            filled: true,
                            fillColor: const Color.fromARGB(255, 248, 248, 248),
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
                            filled: true,
                            fillColor: const Color.fromARGB(255, 248, 248, 248),
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
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(20, 20),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        255,
                                        116,
                                        162,
                                      ),
                                    ),
                                    onPressed: () {
                                      calcCheck('+');
                                    },
                                    child: Text('+'),
                                  ),
                                  Switch(
                                    inactiveThumbColor: const Color.fromARGB(
                                      255,
                                      255,
                                      116,
                                      162,
                                    ),
                                    activeTrackColor: const Color.fromARGB(
                                      255,
                                      252,
                                      182,
                                      205,
                                    ),
                                    value: showadd,
                                    onChanged:
                                        (value) => {
                                          showadd = value,
                                          showSwitch('+'),
                                        },
                                  ),
                                ],
                              ),
                            ),

                            // -------- 빼기 버튼 --------
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(20, 20),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        255,
                                        151,
                                        86,
                                      ),
                                    ),
                                    onPressed: () {
                                      calcCheck('-');
                                    },
                                    child: Text('-'),
                                  ),
                                  Switch(
                                    inactiveThumbColor: const Color.fromARGB(
                                      255,
                                      255,
                                      151,
                                      86,
                                    ),
                                    activeTrackColor: const Color.fromARGB(
                                      255,
                                      251,
                                      205,
                                      176,
                                    ),
                                    value: showsub,
                                    onChanged:
                                        (value) => {
                                          showsub = value,
                                          showSwitch('-'),
                                        },
                                  ),
                                ],
                              ),
                            ),

                            // -------- 곱하기 버튼 --------
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(20, 20),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        29,
                                        205,
                                        229,
                                      ),
                                    ),
                                    onPressed: () {
                                      calcCheck('x');
                                    },
                                    child: Text('x'),
                                  ),
                                  Switch(
                                    inactiveThumbColor: const Color.fromARGB(
                                      255,
                                      29,
                                      205,
                                      229,
                                    ),
                                    activeTrackColor: const Color.fromARGB(
                                      255,
                                      160,
                                      234,
                                      243,
                                    ),
                                    value: showmult,
                                    onChanged:
                                        (value) => {
                                          showmult = value,
                                          showSwitch('x'),
                                        },
                                  ),
                                ],
                              ),
                            ),
                            // -------- 나누기 버튼 --------
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(20, 20),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        240,
                                        104,
                                        252,
                                      ),
                                    ),
                                    onPressed: () {
                                      calcCheck('%');
                                    },
                                    child: Text('÷'),
                                  ),
                                  Switch(
                                    inactiveThumbColor: const Color.fromARGB(
                                      255,
                                      240,
                                      104,
                                      252,
                                    ),
                                    activeTrackColor: const Color.fromARGB(
                                      255,
                                      249,
                                      179,
                                      255,
                                    ),
                                    value: showdiv,
                                    onChanged:
                                        (value) => {
                                          showdiv = value,
                                          showSwitch('%'),
                                        },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // -------- 전체 지우기 버튼 --------
                      ],
                    ),
                  ],
                ),

                // -------- 계산 결과 --------
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Visibility(
                            visible: showAddResult,
                            child: SizedBox(
                              width: 300,
                              child: TextField(
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    116,
                                    162,
                                  ),
                                ),
                                controller: addResult,
                                decoration: InputDecoration(labelText: '덧셈 결과'),
                                keyboardType: TextInputType.number,
                                readOnly: true,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: showSubResult,
                            child: TextField(
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 151, 86),
                              ),
                              controller: subResult,
                              decoration: InputDecoration(labelText: '뺄셈 결과'),
                              keyboardType: TextInputType.number,
                              readOnly: true,
                            ),
                          ),
                          Visibility(
                            visible: showMultResult,
                            child: TextField(
                              style: TextStyle(
                                color: const Color.fromARGB(255, 29, 205, 229),
                              ),
                              controller: multResult,
                              decoration: InputDecoration(labelText: '곱셈 결과'),
                              keyboardType: TextInputType.number,
                              readOnly: true,
                            ),
                          ),
                          Visibility(
                            visible: showDivResult,
                            child: TextField(
                              style: TextStyle(
                                color: const Color.fromARGB(255, 240, 104, 252),
                              ),
                              controller: divResult,
                              decoration: InputDecoration(labelText: '나눗셈 결과'),
                              keyboardType: TextInputType.number,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(120, 20),
                            backgroundColor: const Color.fromARGB(
                              255,
                              232,
                              112,
                              103,
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
        addResult.text = sum.toString();
        showadd = true;
        showAddResult = true;
      }
      if (i == '-') {
        int sum = num1 - num2;
        subResult.text = sum.toString();
        showsub = true;
        showSubResult = true;
      }
      if (i == 'x') {
        int sum = num1 * num2;
        multResult.text = sum.toString();
        showmult = true;
        showMultResult = true;
      }
      if (i == '%') {
        if (num2 == 0) {
          divResult.text = "Impossible";
        } else {
          double sum = num1 / num2;
          divResult.text = sum.toString();
          showdiv = true;
          showDivResult = true;
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
    addResult.text = "";
    subResult.text = "";
    multResult.text = "";
    divResult.text = "";
    showAddResult = false;
    showSubResult = false;
    showMultResult = false;
    showDivResult = false;
    showadd = false;
    showsub = false;
    showmult = false;
    showdiv = false;

    FocusScope.of(context).unfocus();
  }

  // -------- 입력 숫자 지우기 --------
  deletNumber(int a) {
    (a == 1) ? num1Controller.text = "" : num2Controller.text = "";
  }

  showSwitch(String a) {
    if (a == '+') {
      if (showadd == true) {
        addResult.text = addResult.text;
        showAddResult = true;
      } else {
        addResult.text = "";
        showAddResult = false;
      }
    }
    if (a == '-') {
      if (showsub == true) {
        subResult.text = subResult.text;
        showSubResult = true;
      } else {
        subResult.text = "";
        showSubResult = false;
      }
    }
    if (a == 'x') {
      if (showmult == true) {
        multResult.text = multResult.text;
        showMultResult = true;
      } else {
        multResult.text = "";
        showMultResult = false;
      }
    }
    if (a == '%') {
      if (showdiv == true) {
        divResult.text = divResult.text;
        showDivResult = true;
      } else {
        divResult.text = "";
        showDivResult = false;
      }
    }
    setState(() {});
  }
}
