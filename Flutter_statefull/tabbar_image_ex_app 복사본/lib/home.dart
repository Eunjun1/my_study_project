import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/buttonpage.dart';
import 'package:tabbar_image_ex_app/swipepage.dart';
import 'package:tabbar_image_ex_app/timerpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('이미지 변경하기')),

      body: TabBarView(
        controller: controller,
        children: [Buttonpage(), Swipepage(), Timerpage()],
      ),

      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(icon: Icon(Icons.radio_button_on), text: 'Button',
          ),
          Tab(icon: Icon(Icons.swipe), text: 'Swipe'),
          Tab(icon: Icon(Icons.timer), text: 'Timer'),
        ],
      ),
    );
  }
}
