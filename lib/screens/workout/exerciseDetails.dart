import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ifitmash/screens/bottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';



//List<int> _selectedNumber = new List<int>.generate(100, (i) => 0);


class ExerciseDetail extends StatefulWidget {
  ExerciseDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExerciseDetailState createState() => new _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  List<int> _selectedNumber = new List<int>.generate(100, (i) => 0);
  List<int> _changedNumber = new List<int>.generate(100, (i) => 0);
  List<int> _heartRate = new List<int>.generate(200, (i) => 0);
 List<int> _weight = new List<int>.generate(200, (i) => 0);


  bool a = false;
  String _myActivity;
  String _myActivityResult;
  final _formKey = GlobalKey<FormState>();
  int newSULength = 3;
  var selectedUnit = [0, 0, 0];
  var selectedGrade = [0, 0, 0];
  var selectedGrade2 = [0, 0, 0];
  var _course = '';



  @override
  Widget build(BuildContext context) {


    return new Scaffold(

        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                title: Text("Exercise"),
                background: Image.asset(
                  "assets/image/gym.jpg",
                  fit: BoxFit.cover,
                )),
          ),
          SliverFillRemaining(

            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(10.0),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Reps",style: TextStyle(fontWeight:
                        FontWeight.bold,fontSize: 20.0),),
                        Text("Weight",style: TextStyle(fontWeight:
                        FontWeight.bold,fontSize: 20.0),),
                        Text("Heart Rate",style: TextStyle(fontWeight:
                        FontWeight.bold,fontSize: 20.0),),

                      ],
                    ),
                  ),


                  Column(
                    children: <Widget>[
                      Container(
                        height: 300,
                        child: Form(
                          key: _formKey,
                          child: new ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return buildfields(index);
                            },
                            itemCount: newSULength,
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: FloatingActionButton(
                              backgroundColor: Colors.black,
                              heroTag: "btn1",
                              onPressed: () {
                                setState(() {
                                  newSULength--;
                                  selectedUnit.add(0);
                                  selectedGrade.add(0);
                                  selectedGrade2.add(0);
                                });
                              },
                              child: new Icon(Icons.remove),
                            ),
                          ),
                          Container(
                            child: FloatingActionButton(
                              backgroundColor: Colors.black,
                              heroTag: "btn2",
                              onPressed: () {
                                setState(() {
                                  newSULength++;
                                  selectedUnit.add(0);
                                  selectedGrade.add(0);
                                  selectedGrade2.add(0);
                                });
                              },
                              child: new Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),


                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => bottomNavigationBar()));
                    },
                    child: Container(
                      width: 250,
                      height: 45,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xDD000000), Color(0xDD000000)],
                          ),
                          borderRadius:
                          BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Text(
                          'Save'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ]));
  }

  Widget buildfields(int index) {
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 110.0,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200.0,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CupertinoButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Expanded(
                              child: CupertinoPicker(
                                  scrollController:
                                  new FixedExtentScrollController(
                                    initialItem: _selectedNumber[index],
                                  ),
                                  itemExtent: 32.0,
                                  backgroundColor: Colors.white,
                                  onSelectedItemChanged: (int index1) {
                                    _changedNumber[index] = index1;
                                  },
                                  children: new List<Widget>.generate(200,
                                          (int index) {
                                        return new Center(
                                          child: new Text('${index + 1}'),
                                        );
                                      })),
                            ),
                            CupertinoButton(
                              child: Text("Ok"),
                              onPressed: () {
                                setState(() {
                                  _selectedNumber[index] = _changedNumber[index];
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.grey)),
                height: 30,
                width: 80,
                child: Text(
                  '${_selectedNumber[index] + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),




          new Container(
            child: new GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200.0,
                        child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 32.0,
                            onSelectedItemChanged: (int index1) {
                              setState(() {
                                _weight[index] = index1;
                              });
                            },
                            children:List<Widget>.generate(200,
                                    (int index) {
                                  return new Center(
                                    child: new Text('${index + 1}'),
                                  );
                                })),
                      );
                    });
              },
              child: Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.grey)),
                height: 30,
                width: 80,
                child: Text('${_weight[index] + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),


          new Container(
            child: new GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200.0,
                        child: CupertinoPicker(

                            backgroundColor: Colors.white,
                            itemExtent: 32.0,
                            onSelectedItemChanged: (int index1) {
                              setState(() {
                                _heartRate[index] = index1;
                              });
                            },
                            children:List<Widget>.generate(200,
                                    (int index) {
                              Container(
                                child: Text("Heart Rate"),
                              );
                                  return new Center(
                                    child: new Text('${index + 1}'),
                                  );
                                })),
                      );
                    });
              },
              child: Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.grey)),
                height: 30,
                width: 80,
                child: Text('${_heartRate[index] + 1}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),





        ].where((value) => value != null).toList(),
      ),
    );
  }
}