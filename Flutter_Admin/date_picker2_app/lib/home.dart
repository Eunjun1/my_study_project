import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String currentDateTime; // 현재 시간
  DateTime? chosenDateTime; // 선택 시간
  late bool isRunning; // 타이머
  late String chosenDate;
  late Color backColor;
  late int timeup;

  @override
  void initState() {
    super.initState();
    currentDateTime = "";
    chosenDate = "";
    backColor = Colors.white;
    timeup = 0;
    isRunning = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (!isRunning) {
        timer.cancel();
      }
      addItem();
      setState(() {});
    });
  }

  addItem() {
    final DateTime now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');
    String weekday = weekdayToString(now.weekday);
    String hour = now.hour.toString();
    String minute = now.minute.toString();
    String second = now.second.toString();
    currentDateTime = "$year. $month. $day. $weekday $hour:$minute:$second";
  }

  String weekdayToString(int weekday) {
    String dateName = "";
    switch (weekday) {
      case 1:
        dateName = "월";
      case 2:
        dateName = "화";
      case 3:
        dateName = "수";
      case 4:
        dateName = "목";
      case 5:
        dateName = "금";
      case 6:
        dateName = "토";
      case 7:
        dateName = "일";
    }
    return dateName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          chosenDateTime == null ? Colors.white : backColors(chosenDateTime!),

      appBar: AppBar(title: Text('Date Picker2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '현재 시간 : $currentDateTime',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              width: 300,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                use24hFormat: true,

                onDateTimeChanged: (value) {
                  chosenDateTime = value;
                  setState(() {});
                },
              ),
            ),
            Text(
              '선택시간 : ${chosenDate = chosenDateTime != null ? chosenItem(chosenDateTime!) : '시간을 선택해주세요.'}',
            ),
          ],
        ),
      ),
    );
  }

  chosenItem(DateTime now) {
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');
    String weekday = weekdayToString(now.weekday);
    String hour = now.hour.toString();
    String minute = now.minute.toString();
    return "$year. $month. $day. $weekday $hour:$minute";
  }

  backColors(DateTime chosenTime) {
    timeup++;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (chosenTime.hour == 13) {
        if (timeup == 5) {
          backColor = Colors.white;
          timeup = 0;
          timer.cancel();
          setState(() {});
        }
        if (timeup % 2 == 0) {
          backColor = Colors.amber;
        } else {
          backColor = Colors.red;
        }
      } else {
        timeup = 0;
        backColor = Colors.white;
        timer.cancel();
      }
    });

    setState(() {});
    return backColor;
  }
}
