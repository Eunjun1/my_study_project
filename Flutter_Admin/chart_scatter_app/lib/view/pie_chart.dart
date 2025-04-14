import 'package:chart_scatter_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

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
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 39000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
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
