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
