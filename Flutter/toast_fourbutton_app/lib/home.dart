import 'package:flutter/material.dart';
import 'package:toast_fourbutton_app/messagebutton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toast Message')),
      body: MyMessage(),
    );
  }
}
