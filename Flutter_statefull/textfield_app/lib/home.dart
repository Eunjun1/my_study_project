import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('Single Textfield')),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: '내용을 입력해주세요.',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () => checkData(),
                  child: Text('출력'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkData() {
    if (textEditingController.text.trim().isEmpty) {
      // Error Message
      showSnapBar("내용을 입력해주세요.", Colors.red, 2);
    } else {
      // Display
      showSnapBar("입력하신 내용은 ${textEditingController.text}.", Colors.blue, 3);
    }
  }

  showSnapBar(String snackBarContents, Color backgroundColor, int time) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(snackBarContents),
        duration: Duration(seconds: time),
        backgroundColor: backgroundColor,
      ),
    );
  }

  // errorSnapBar(String snackBarContents, Color contentsColor, double time) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(),
  //       duration: Duration(seconds: 2),
  //       backgroundColor: Colors.red,
  //     ),
  //   );
  // }
}
