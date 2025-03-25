import 'package:flutter/material.dart';
import 'snackbar.dart'; // class

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snack Bar'), backgroundColor: Colors.amber),
      body: MySnackBar(),
    );
  } //Build
}

