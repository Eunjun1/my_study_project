import 'package:char_ex_app/model/developer_data.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  final List<DeveloperData> datas;
  const BarChart({super.key, required this.datas});

  @override
  State<BarChart> createState() => _HomeState();
}

class _HomeState extends State<BarChart> {
  // Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = widget.datas;
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bar Chart')),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 350,
          child: SfCartesianChart(
            title: ChartTitle(text: 'Yearly in the Flutter Community'),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true),

            series: [
              // 세로 막대 그래프
              // ColumnSeries<DeveloperData, int>(
              //   color: Theme.of(context).colorScheme.primary,
              //   name: 'Developer',
              //   dataSource: data,
              //   xValueMapper: (DeveloperData years, index) => years.year,
              //   yValueMapper:
              //       (DeveloperData develpers, index) => develpers.developers,
              //   enableTooltip: true,
              // ),
              // 가로 막대 그래프
              BarSeries<DeveloperData, int>(
                color: Theme.of(context).colorScheme.primary,
                name: 'Developer',
                dataSource: data,
                xValueMapper: (DeveloperData years, _) => years.year,
                yValueMapper:
                    (DeveloperData develpers, _) => develpers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
            ],
            // x축 Category로 표현
            primaryXAxis: CategoryAxis(title: AxisTitle(text: '연도')),
            // y축 숫자로 표현
            primaryYAxis: NumericAxis(title: AxisTitle(text: '인원 수')),
          ),
        ),
      ),
    );
  }
}
