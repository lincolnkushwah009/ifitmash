import 'package:ifitmash/app_bar.dart';
import 'package:ifitmash/calculator.dart' as calculator;
import 'package:ifitmash/input_page/input_page_styles.dart';
import 'package:ifitmash/model/gender.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ResultPage extends StatefulWidget {

  final int height;
  final int weight;
  final Gender gender;

  const ResultPage({Key key, this.height, this.weight, this.gender})
      : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();



}



class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: BmiAppBar(),
        preferredSize: Size.fromHeight(appBarHeight(context)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ResultCard(
            bmi: calculator.calculateBMI(
                height: widget.height, weight: widget.weight),
            minWeight:
                calculator.calculateMinNormalWeight(height: widget.height),
            maxWeight:
                calculator.calculateMaxNormalWeight(height: widget.height),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),

    );
  }
}

class ResultCard extends StatelessWidget {
  final double bmi;
  final double minWeight;
  final double maxWeight;

  ResultCard({Key key, this.bmi, this.minWeight, this.maxWeight})
      : super(key: key);


  void setValues() async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    sharedPrefs.getInt(bmi.toStringAsFixed(1));
  }




  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(15.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: Container(
            width: double.infinity,
            child: Column(children: [
              Text(
                '🔥',
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(fontSize: 120.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'BMI = ${bmi.toStringAsFixed(2)} kg/m²',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Text(
                  'Normal BMI weight range for the height:\n${minWeight.round()}kg - ${maxWeight.round()}kg',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),

              Divider(height: 40),

              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: Table(
                      columnWidths: {0:FractionColumnWidth(.5)},
                      children: [
                        TableRow(
                            children: [
                              Text("Category", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                              Text("BMI range - kg/m2",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

                            ]
                        ),
                        TableRow(
                            children: [
                              Text("Severe Thinness",),
                              Text('< 16',textAlign: TextAlign.center,),

                            ]
                        ),


                        TableRow(
                            children: [
                              Text('Moderate Thinness	',),
                              Text('16 - 17',textAlign: TextAlign.center,),
                             ]),

                        TableRow(
                            children: [
                              Text('Mild Thinness'),
                              Text('17 - 18.5',textAlign: TextAlign.center,),]
                        ),
                        TableRow(
                            children: [
                              Text('Normal'),
                              Text('18.5 - 25',textAlign: TextAlign.center,),]
                        ),
                        TableRow(
                            children: [
                              Text('Overweight'),
                              Text('25 - 30',textAlign: TextAlign.center,),]
                        ),
                        TableRow(
                            children: [
                              Text('Obese Class I'),
                              Text('30 - 35',textAlign: TextAlign.center,),]
                        ),

                        TableRow(
                            children: [
                              Text('Obese Class II'),
                              Text('35 - 40',textAlign: TextAlign.center,),]
                        ),

                        TableRow(
                            children: [
                              Text('Obese Class III'),
                              Text('	> 40',textAlign: TextAlign.center,),]
                        ),
                      ]
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );

  }
}
