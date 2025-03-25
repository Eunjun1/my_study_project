import 'package:flutter/material.dart';
import 'package:navigator_class_app/pageclass/Main%20Screen.dart';
import 'package:navigator_class_app/pageclass/screen_01/screen 1st.dart';
import 'package:navigator_class_app/pageclass/screen_01/pikachu%20sreen.dart';
import 'package:navigator_class_app/pageclass/screen%202st.dart';
import 'package:navigator_class_app/pageclass/smile%20screen.dart';

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
      initialRoute: '/main',
      routes: {
        '/main': (context) => Mainscreen(),
        '/1st': (context) => Firstpage(),
        '/2nd': (context) => Secondpage(),
        '/pika': (context) => Pikachupage(),
        '/smile': (context) => Smilepage(),
      },
    );
  }
}
