import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toast Message')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: 'Toast Button is clicked',
              gravity: ToastGravity.BOTTOM,
              fontSize: 20,
              textColor: Colors.amber,
              toastLength: Toast.LENGTH_SHORT,
            );
          },
          child: Text("Toast Button"),
        ),
      ),
    );
  }
}

