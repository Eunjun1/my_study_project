import 'package:char_ex_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  final List<DeveloperData> datas;
  const PieChart({super.key, required this.datas});

  @override
  State<PieChart> createState() => _HomeState();
}

class _HomeState extends State<PieChart> {
  // Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData();
  }

  addData() {
    data.addAll(widget.datas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pie Chart')),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 350,
          child: SfCircularChart(
            title: ChartTitle(text: 'Yearly in the Flutter Community'),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true),

            series: <CircularSeries<DeveloperData, int>>[
              // 파이 그래프
              PieSeries<DeveloperData, int>(
                name: 'Developers',
                dataSource: data,
                xValueMapper: (DeveloperData years, _) => years.year,
                yValueMapper:
                    (DeveloperData developers, _) => developers.developers,
                enableTooltip: true,
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
