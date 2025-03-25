import 'package:flutter/material.dart';
import 'package:project_03_24/view/eunjun.dart';
import 'package:project_03_24/view/main%20screen.dart';

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
        '/EJ': (context) => EjScreen(),
        '/JW': (context) => JwScreen(),
        '/TM': (context) => TmScreen(),
        '/JH': (context) => JHScreen(),
        '/SB': (context) => SbScreen(),
      },
    );
  }
}
