import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Action Sheet')),

      body: Center(
        child: ElevatedButton(
          onPressed: () => actionSheet(),
          child: Text('Action Sheet'),
        ),
      ),
    );
  }

  actionSheet() {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => CupertinoActionSheet(
            title: Text('Title'),
            message: Text('Message'),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  print('action');
                  Get.back();
                },
                child: Text('Action'),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
          ),
    );
  }
}
