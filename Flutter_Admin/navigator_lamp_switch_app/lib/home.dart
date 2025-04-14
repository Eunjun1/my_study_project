import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/lamp.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main 화면'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/status').then((value) {
                setState(() {});
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(height: 600, width: 300, child: Image.asset(Lamp.lamp)),
      ),
    );
  }
}
