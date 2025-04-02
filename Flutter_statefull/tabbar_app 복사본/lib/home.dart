import 'package:flutter/material.dart';
import 'package:tappbar_app/firstpage.dart';
import 'package:tappbar_app/secondpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Tab Bar')),
      body: TabBarView(
        controller: controller,
        children: [Firstpage(), Secondpage()],
      ),
      bottomNavigationBar: Container(
        color: Colors.amber,
        height: 70,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          indicatorWeight: 10,
          tabs: [
            Tab(icon: Icon(Icons.looks_one), text: 'first page'),
            Tab(icon: Icon(Icons.looks_two), text: 'second page'),
          ],
        ),
      ),
    );
  }
}
