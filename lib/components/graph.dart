import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifitmash/components/reusable_card.dart';
import 'package:ifitmash/components/round_icon_button.dart';
import 'package:ifitmash/constants.dart';


class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),

  ];

  bool showAvg = false;

  double weight = 70;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                color: const Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: FlatButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                  showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
        Container(
            alignment: Alignment.topCenter,
            child: Text("Weight chart",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),

//        Container(
//          alignment: Alignment.bottomCenter,
//          child: Column(
//            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  Expanded(
//                    child: ReusableCard(
//                      color: kActiveCardColor,
//                      cardChild: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          SizedBox(height: 20),
//                          Text(
//                            'ADD YOUR WEIGHT',
//                            style: kLabelStyle,
//                          ),
//                          Text(
//                            '$weight',
//                            style: kNumberStyle,
//                          ),
//                          Row(
//                            mainAxisAlignment:
//                            MainAxisAlignment.spaceAround,
//                            children: <Widget>[
//                              RoundIconButton(
//                                icon: Icons.remove,
//                                onPressed: () {
//                                  setState(() {
//                                    if (weight > 1) weight=weight-.5;
//                                  });
//                                },
//                              ),
//                              RoundIconButton(
//                                icon: Icons.add,
//                                onPressed: () {
//                                  setState(() {
//                                    weight=weight+0.5;
//                                  });
//                                },
//                              ),
//                            ],
//                          ),
//                          SizedBox(height: 20),
//                          ClipRRect(
//                            borderRadius:
//                            new BorderRadius.circular(40.0),
//                            child: SizedBox(
//                              height: 50,
//                              width: 200,
//                              child: RaisedButton(
//                                child: Text("Save"),
//                                onPressed: () {
//                                  Fluttertoast.showToast(msg: 'You successfully submitted your weight',
//                                      toastLength: Toast.LENGTH_SHORT,
//                                      gravity: ToastGravity.CENTER,
//                                      timeInSecForIos: 1,
//                                      backgroundColor: Colors.green,
//                                      textColor: Colors.white,
//                                      fontSize: 16.0
//                                  );
//                                },
//                                color: Colors.black,
//                                textColor: Colors.white,
//                                splashColor: Colors.grey,
//                              ),
//                            ),
//                          ),
//
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ],
//          ),
//        ),

      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'JAN';
              case 5:
                return 'FEB';
              case 8:
                return 'MAR';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '30kg';
              case 3:
                return '40kg';
              case 5:
                return '50kg';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 3,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
              color: const Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '80kg';
              case 3:
                return '90kg';
              case 5:
                return '120kg';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        )
      ],
    );
  }
}
