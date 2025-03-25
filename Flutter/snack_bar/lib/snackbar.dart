//class
import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed:
                () => snackbarFunction(context, '버튼이 눌렸습니다.', Colors.red, 1),

            /* snackbar 공간만들기 (Scafforld context)와 연결
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Elevated Button is cliced',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      ),
                    );
                    */
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text(
              'Snackbar Button',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed:
                () => snackbarFunction(
                  context,
                  'Elevated Button is clicked.',
                  Colors.blue,
                  5,
                ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text(
              'Snackbar Button',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  } // Bulid

  // --------Function-----------

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




}


