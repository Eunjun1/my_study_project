import 'package:char_ex_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  final List<DeveloperData> datas;
  const LineChart({super.key, required this.datas});

  @override
  State<LineChart> createState() => _HomeState();
}

class _HomeState extends State<LineChart> {
  // Property
  late List<DeveloperData> data;
  late List<DeveloperData> data1;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = widget.datas;
    data1 = [];
    tooltipBehavior = TooltipBehavior(enable: true);

    addData1();
  }

  addData1() {
    data1.add(DeveloperData(year: 2017, developers: 900));
    data1.add(DeveloperData(year: 2018, developers: 20000));
    data1.add(DeveloperData(year: 2019, developers: 17000));
    data1.add(DeveloperData(year: 2020, developers: 18000));
    data1.add(DeveloperData(year: 2021, developers: 23000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Line Chart')),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 350,
          child: SfCartesianChart(
            title: ChartTitle(text: 'Yearly in the Flutter Community'),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true),

            series: [
              ColumnSeries<DeveloperData, int>(
                color: const Color.fromARGB(255, 135, 219, 231),
                name: 'Developer',
                dataSource: data1,
                xValueMapper: (DeveloperData years, index) => years.year,
                yValueMapper:
                    (DeveloperData develpers, index) => develpers.developers,
                enableTooltip: true,
              ),
              ColumnSeries<DeveloperData, int>(
                color: const Color.fromARGB(255, 145, 205, 147),
                name: 'Developer',
                dataSource: data,
                xValueMapper: (DeveloperData years, index) => years.year,
                yValueMapper:
                    (DeveloperData develpers, index) => develpers.developers,
                enableTooltip: true,
              ),
              // 라인 그래프
              LineSeries<DeveloperData, int>(
                color: Colors.green,
                name: 'Developer',
                dataSource: data,
                xValueMapper: (DeveloperData years, _) => years.year,
                yValueMapper:
                    (DeveloperData develpers, _) => develpers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
              LineSeries<DeveloperData, int>(
                color: Colors.blue,
                name: 'Developer',
                dataSource: data1,
                xValueMapper: (DeveloperData years, _) => years.year,
                yValueMapper:
                    (DeveloperData develpers, _) => develpers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
              ScatterSeries<DeveloperData, int>(
                color: const Color.fromARGB(255, 28, 106, 31),
                name: 'Developer',
                dataSource: data,
                xValueMapper: (DeveloperData years, _) => years.year,
                yValueMapper:
                    (DeveloperData develpers, _) => develpers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
              ScatterSeries<DeveloperData, int>(
                color: const Color.fromARGB(255, 13, 113, 195),
                name: 'Developer',
                dataSource: data1,
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
