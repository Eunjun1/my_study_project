import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        toolbarHeight: 100,
        title: Column(
          children: [
            Text('AppBar Icon'),
            Text('---------------'),
            Text('---------------'),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.email),
            color: Colors.blue,
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.add_alarm),
            color: Colors.green,
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(Icons.add_outlined),
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print('Smile image is tapped');
              },
              child: Image.asset('images/smile.png', width: 25),
            ),
          ),
        ],
      ),
    );
  }
}
