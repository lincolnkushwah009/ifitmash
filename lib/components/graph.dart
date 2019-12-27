import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

class Graph extends StatelessWidget {
  final List<int> showIndexes = const [1, 3, 5];

  @override
  Widget build(BuildContext context) {
    final fromDate = DateTime(2012, 11, 22);
    final toDate = DateTime.now();

    final date1 = DateTime.now().subtract(Duration(days: 2));
    final date2 = DateTime.now().subtract(Duration(days: 3));

    final date3 = DateTime.now().subtract(Duration(days: 300));
    final date4 = DateTime.now().subtract(Duration(days: 320));

    final date5 = DateTime.now().subtract(Duration(days: 650));
    final date6 = DateTime.now().subtract(Duration(days: 652));

    return Center(
      child: Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          bezierChartScale: BezierChartScale.YEARLY,
          fromDate: fromDate,
          toDate: toDate,
          selectedDate: toDate,
          series: [
            BezierLine(
              label: "weight Loss",
              onMissingValue: (dateTime) {
                if (dateTime.year.isEven) {
                  return 20.0;
                }
                return 20.0;
              },
              data: [
                DataPoint<DateTime>(value: 10, xAxis: date1),
                DataPoint<DateTime>(value: 20, xAxis: date2),
                DataPoint<DateTime>(value: 40, xAxis: date3),
                DataPoint<DateTime>(value: 60, xAxis: date4),
                DataPoint<DateTime>(value: 80, xAxis: date5),
                DataPoint<DateTime>(value: 60, xAxis: date6),
              ],
            ),
            BezierLine(
              label: "weight",
              lineColor: Colors.black26,
              onMissingValue: (dateTime) {
                if (dateTime.month.isEven) {
                  return 10.0;
                }
                return 72.0;
              },
              data: [
                DataPoint<DateTime>(value: 20, xAxis: date1),
                DataPoint<DateTime>(value: 30, xAxis: date2),
                DataPoint<DateTime>(value: 150, xAxis: date3),
                DataPoint<DateTime>(value: 80, xAxis: date4),
                DataPoint<DateTime>(value: 45, xAxis: date5),
                DataPoint<DateTime>(value: 45, xAxis: date6),
              ],
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.blue,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            backgroundGradient: LinearGradient(
              colors: [
                Colors.white12,
                Colors.white24,
                Colors.white30,
                Colors.white38,
                Colors.white70,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            footerHeight: 30.0,
          ),
        ),
      ),
    );

  }
}
