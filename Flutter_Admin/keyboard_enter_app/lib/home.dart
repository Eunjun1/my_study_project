import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('Key board Enter')),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: '글자를 입력하세요.'),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  if (textEditingController.text.trim().isEmpty) {
                    errorSnackBar();
                  } else {
                    showSnackBar();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  errorSnackBar() {
    Get.snackbar(
      'Error',
      '입력한 글자가 없습니다.',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      colorText: Theme.of(context).colorScheme.onTertiary,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
    );
  }

  showSnackBar() {
    Get.snackbar(
      '입력 완료',
      '입력한 글자는 ${textEditingController.text}입니다.',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      colorText: Theme.of(context).colorScheme.onTertiary,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
    );
  }
}
