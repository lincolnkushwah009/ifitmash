import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}


@override

Widget build(BuildContext context) {
  return Scaffold(
      body: Center(
          child: Container(
              child: SfCartesianChart(

                  primaryXAxis: CategoryAxis(),
                  legend: Legend(isVisible: true),
// Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),

                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        dataSource:  <SalesData>[
                          SalesData('mon', 80),
                          SalesData('tue', 28),
                          SalesData('wed', 34),
                          SalesData('thu', 32),
                          SalesData('fri', 40),
                          SalesData('sat', 40)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
// Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                    )
                  ]
              )
          )
      )
  );
}
class _GraphState extends State<Graph> {@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Container(
          height: 200,
          width: 400,
          child: Card(
              child: SfCartesianChart(
                // Initialize category axis
                  primaryXAxis: CategoryAxis(),

                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData,String>(
                        dataSource:  <SalesData>[
                          SalesData('Week 1', 0),
                          SalesData('Week 2', 40),
                          SalesData('Week 3', 38),
                          SalesData('Week 4', 60),

                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                    ),
                  ]
              )
          )
      )
  );
}
}

//import 'package:fl_chart/fl_chart.dart';
//import 'package:flutter/material.dart';
//
//class Graph extends StatelessWidget {
//  final List<int> showIndexes = const [1, 3, 5];
//
//  @override
//  Widget build(BuildContext context) {
//    final lineBarsData = [
//      LineChartBarData(
//        showingIndicators: showIndexes,
//        spots: [
//          FlSpot(0, 1),
//          FlSpot(1, 2),
//          FlSpot(2, 1.5),
//          FlSpot(3, 3),
//          FlSpot(4, 3.5),
//          FlSpot(5, 5),
//          FlSpot(6, 8),
//        ],
//        isCurved: true,
//        barWidth: 4,
//        belowBarData: BarAreaData(
//          show: true,
//        ),
//        dotData: FlDotData(show: false),
//      ),
//    ];
//
//    final LineChartBarData tooltipsOnBar = lineBarsData[0];
//
//    return SizedBox(
//      width: 300,
//      height: 140,
//      child: LineChart(
//        LineChartData(
//          showingTooltipIndicators: showIndexes.map((index) {
//            return MapEntry(
//              index,
//              [
//                LineBarSpot(tooltipsOnBar, lineBarsData.indexOf(tooltipsOnBar), tooltipsOnBar.spots[index]),
//              ],
//            );
//          }).toList(),
//          lineTouchData: LineTouchData(
//              enabled: false,
//              touchTooltipData: LineTouchTooltipData(
//                  tooltipBgColor: Colors.pink,
//                  tooltipRoundedRadius: 8,
//                  getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
//                    return lineBarsSpot.map((lineBarSpot) {
//                      return LineTooltipItem(
//                        lineBarSpot.y.toString(),
//                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                      );
//                    }).toList();
//                  })),
//          lineBarsData: lineBarsData,
//          minY: 0,
//          titlesData: FlTitlesData(
//            leftTitles: const SideTitles(
//              showTitles: false,
//            ),
//            bottomTitles: SideTitles(
//                showTitles: true,
//                getTitles: (val) {
//                  switch (val.toInt()) {
//                    case 0:
//                      return '00:00';
//                    case 1:
//                      return '04:00';
//                    case 2:
//                      return '08:00';
//                    case 3:
//                      return '12:00';
//                    case 4:
//                      return '16:00';
//                    case 5:
//                      return '20:00';
//                    case 6:
//                      return '23:59';
//                  }
//                  return '';
//                },
//                textStyle: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  color: Colors.blueGrey,
//                  fontFamily: 'Digital',
//                  fontSize: 18,
//                )),
//          ),
//          gridData: const FlGridData(show: false),
//          borderData: FlBorderData(
//            show: true,
//          ),
//        ),
//      ),
//    );
//  }
//}
