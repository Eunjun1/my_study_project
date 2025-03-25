import 'package:alert_dialog_ex_app/page_1.dart';
import 'package:alert_dialog_ex_app/page_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/P1',
      routes: {'/P1': (context) => PageOne(), '/P2': (context) => Page_2()},
    );
  }
}
