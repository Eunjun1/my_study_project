import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              fixedSize: Size(120, 30),
            ),
            onPressed:() => toastFunction('Toast Message 1', ToastGravity.TOP, 20, Colors.green, Toast.LENGTH_SHORT),
            child: Text("Toast"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: Size(120, 30),
            ),
            onPressed:() => toastFunction('Toast Message 2', ToastGravity.BOTTOM, 20, Colors.blue, Toast.LENGTH_SHORT),
            
            child: Text("Toast"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              fixedSize: Size(120, 30),
            ),
            onPressed:
                () => snackbarFunction(context, 'SnackBar1', Colors.amber, 1),
            child: Text("SnackBar"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              fixedSize: Size(120, 30),
            ),
            onPressed:
                () => snackbarFunction(context, 'SnackBar2', Colors.pink, 1),
            child: Text("SnackBar"),
          ),
        ],
      ),
    );
  }

  snackbarFunction(
    BuildContext context,
    String message,
    Color colors,
    int seconds,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.black)),
        backgroundColor: colors,
        duration: Duration(seconds: seconds),
      ),
    );
  }

  toastFunction(
    String msg,
    ToastGravity gravity,
    double fontsized,
    Color colors,
    Toast toastlength,
  ){
    Fluttertoast.showToast(
                msg: msg,
                gravity: gravity,
                fontSize: fontsized,
                textColor: colors,
                toastLength: toastlength,
              );
  }
}
