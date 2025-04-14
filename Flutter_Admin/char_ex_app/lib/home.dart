import 'package:char_ex_app/model/developer_data.dart';
import 'package:char_ex_app/view/bar_chart.dart';
import 'package:char_ex_app/view/line_chart.dart';
import 'package:char_ex_app/view/pie_chart.dart';
import 'package:char_ex_app/view/scatter_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    data = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  addData() {
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 39000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Tab Bar')),
      body: TabBarView(
        controller: controller,
        children: [
          BarChart(datas: data),
          LineChart(datas: data),
          ScatterChart(datas: data),
          PieChart(datas: data),
        ],
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
            Tab(icon: Icon(Icons.looks_one), text: 'Bar'),
            Tab(icon: Icon(Icons.looks_two), text: 'Line'),
            Tab(icon: Icon(Icons.looks_3), text: 'Scatter'),
            Tab(icon: Icon(Icons.looks_4), text: 'Pie'),
          ],
        ),
      ),
    );
  }
}
