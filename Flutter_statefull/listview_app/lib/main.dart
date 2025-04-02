import 'package:flutter/material.dart';
import 'package:listview_app/home.dart';
import 'package:listview_app/showview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/home',

      routes: {'/home': (context) => Home(), '/view': (context) => Showview()},
    );
  }
}
