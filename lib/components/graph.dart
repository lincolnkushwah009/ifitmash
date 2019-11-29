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
// Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis'),
// Enable legend
                  legend: Legend(isVisible: true),
// Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),

                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        dataSource:  <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40)
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
                    LineSeries<SalesData, String>(
                      // Bind data source
                        dataSource:  <SalesData>[
                          SalesData('Jan', 20),
                          SalesData('Feb', 15),
                          SalesData('Mar', 34),
                          SalesData('Apr', 25),
                          SalesData('May', 65)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                    ),
                    LineSeries<SalesData,String>(
                        dataSource:  <SalesData>[
                          SalesData('Jan', 0),
                          SalesData('Feb', 40),
                          SalesData('Mar', 38),
                          SalesData('Apr', 60),
                          SalesData('May', 60)
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
