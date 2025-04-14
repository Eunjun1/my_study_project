import 'package:char_ex_app/model/developer_data.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScatterChart extends StatefulWidget {
  final List<DeveloperData> datas;
  const ScatterChart({super.key, required this.datas});

  @override
  State<ScatterChart> createState() => _HomeState();
}

class _HomeState extends State<ScatterChart> {
  // Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = widget.datas;
    tooltipBehavior = TooltipBehavior(enable: true);
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
      appBar: AppBar(title: Text('Scatter Chart')),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 350,
          child: SfCartesianChart(
            title: ChartTitle(text: 'Yearly in the Flutter Community'),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true),

            series: [
              // 라인 그래프
              ScatterSeries<DeveloperData, int>(
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
