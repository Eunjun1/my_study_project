import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/mainpage.dart';
import 'package:navigator_appbar_ex_app/receivedmail.dart';
import 'package:navigator_appbar_ex_app/sendmail.dart';

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
        '/main': (context) => Mainpage(),
        '/SM': (context) => Sendmail(),
        '/RM': (context) => Receivedmail(),
      },
    );
  }
}
