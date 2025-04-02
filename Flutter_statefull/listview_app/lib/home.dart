import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String id;
  late String pw;
  late int errorCount;
  late int logintime;
  late int time;
  late Timer timer;
  late TextEditingController textEditingControllerid;
  late TextEditingController textEditingControllerpw;

  @override
  void initState() {
    id = 'hello';
    pw = 'flutter';
    errorCount = 1;
    logintime = 0;
    time = 0;
    textEditingControllerid = TextEditingController();
    textEditingControllerpw = TextEditingController();
    Timer.periodic(Duration(seconds: 10), (timer) {
      login();
      setState(() {});
    });
    super.initState();
  }

  login() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Error'), content: Text('빨리 입력해주세요.'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Log in')),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Icon(Icons.account_circle, color: Colors.blue, size: 150),
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: textEditingControllerid,
                    decoration: InputDecoration(labelText: '아이디를 입력하세요.'),
                    keyboardType: TextInputType.text,
                  ),
                  TextField(
                    controller: textEditingControllerpw,
                    decoration: InputDecoration(labelText: '암호를 입력하세요.'),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (textEditingControllerid.text == id &&
                            textEditingControllerpw.text == pw) {
                          _showDialog(context);
                        } else {
                          if (errorCount == 5) {
                            fiveerrorMessage(context);
                            Timer.periodic(Duration(seconds: 1), (timer) {
                              time++;
                              setState(() {});
                              if (time == 10) {
                                timer.cancel();
                                time = 0;
                                Navigator.pop(context);
                                errorCount = 0;
                                setState(() {});
                              }
                            });
                          } else {
                            errorCount++;
                            errorMessage(context);
                          }
                        }
                      },
                      child: Text('Log in'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('환영합니다'),
          content: Text('신분이 확인되었습니다'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/view');
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  errorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
            '아이디 또는 암호가 틀립니다.\n'
            '($errorCount / 5)',
          ),
          actions: [
            TextButton(
              onPressed: () {
                textEditingControllerpw.text = "";
                Navigator.pop(context);
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  fiveerrorMessage(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(
            '아이디 또는 암호를 5회 틀렸습니다.\n'
            '10초 후 다시 입력해주세요.\n',
          ),
        );
      },
    );
  }
}
