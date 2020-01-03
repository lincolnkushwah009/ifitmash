import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:ifitmash/components/Picker.dart';
import 'package:ifitmash/screens/bottomNavigationBar.dart';

const List<String> intensity = const <String>['Low', 'Medium', 'High'];

class ExerciseDetail extends StatefulWidget {
  // Movie object to handle.
  @override
  _ExerciseDetailState createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {


  List<int> _selectedNumber = new List<int>.generate(6, (i) => 0);
  List<int> _selectedHour = new List<int>.generate(6, (i) => 0);
  List<int> _selectedMinute = new List<int>.generate(6, (i) => 0);
  List<int> _selectedIndex = new List<int>.generate(6, (i) => 0);
  List<int> _changedNumber = new List<int>.generate(6, (i) => 0);


  bool a = false;
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();
  int newSULength = 3;
  var selectedUnit = [0, 0, 0];
  var selectedGrade = [0, 0, 0];
  var _course = '';
  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  var selectedCount = 0;
  // Constructor for the class.
  var sets = ["1 Set", "2 Sets", "3 Sets", "4 Sets", "5 Sets", "6 Sets"];

  List<Map<dynamic, dynamic>> list = [
    {
      "display": "1",
      "value": "Running",
    },
    {
      "display": "2",
      "value": "Climbing",
    },
    {
      "display": "3",
      "value": "Walking",
    },
    {
      "display": "4",
      "value": "Swimming",
    },
    {
      "display": "5",
      "value": "moving",
    },
    {
      "display": "6",
      "value": "playing",
    },
  ];

  List<Widget> getList() {
    List<Widget> wlist = [];


    for (var i = 0; i < list.length; i++) {
      if (list[i]['value'] == _myActivity) {
        selectedCount = int.parse(list[i]['display']);
      }
    }



    for (var i = 1; i <= selectedCount; i++) {
      wlist.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200.0,
                            child: CupertinoPicker(
                                backgroundColor: Colors.white,
                                itemExtent: 32.0,
                                onSelectedItemChanged: (int index) {
                                  setState(() {
                                    _selectedIndex[i] = index;
                                  });
                                },
                                children: new List<Widget>.generate(
                                    intensity.length, (int index) {
                                  return new Center(
                                    child: new Text(intensity[index]),
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
                    child: Text(
                      intensity[_selectedIndex[i]],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),

              ],
            ),

            Text("X", textAlign: TextAlign.center,),
            SizedBox(height: 40),
            Column(
              children: <Widget>[
                GestureDetector(
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
                                        initialItem: _selectedNumber[i],
                                      ),
                                      itemExtent: 32.0,
                                      backgroundColor: Colors.white,
                                      onSelectedItemChanged: (int index) {
                                        _changedNumber[i] = index;
                                      },
                                      children: new List<Widget>.generate(100,
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
                                      _selectedNumber[i] = _changedNumber[i];
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
                      '${_selectedNumber[i] + 1}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),

              ],
            ),
            Text("X", textAlign: TextAlign.center,),
            SizedBox(height: 50),
            Column(
              children: <Widget>[
                GestureDetector(
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
                                Expanded(
                                  child: CupertinoPicker(
                                      scrollController:
                                      new FixedExtentScrollController(
                                        initialItem: _selectedHour[i],
                                      ),
                                      itemExtent: 32.0,
                                      backgroundColor: Colors.white,
                                      onSelectedItemChanged: (int index) {
                                        setState(() {
                                          _selectedHour[i] = index;
                                        });
                                      },
                                      children: new List<Widget>.generate(100,
                                              (int index) {
                                            return new Center(
                                              child: new Text('${index + 1}'),
                                            );
                                          })),
                                ),
                                Expanded(
                                  child: CupertinoPicker(
                                      scrollController:
                                      new FixedExtentScrollController(
                                        initialItem: _selectedMinute[i],
                                      ),
                                      itemExtent: 32.0,
                                      backgroundColor: Colors.white,
                                      onSelectedItemChanged: (int index) {
                                        setState(() {
                                          _selectedMinute[i] = index;
                                        });
                                      },
                                      children: new List<Widget>.generate(60,
                                              (int index) {
                                            return new Center(
                                              child: new Text('${index + 1}'),
                                            );
                                          })),
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
                      '${_selectedHour[i] + 1}:${_selectedMinute[i] + 1}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              ],
            ),
          ]));
    }
    return wlist;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: new FloatingActionButton(backgroundColor: Colors.black,
          onPressed: () {
            setState(() {
              newSULength++;
              selectedUnit.add(0);
              selectedGrade.add(0);
            });
          },
          child: new Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: new Text(
            "Exercises",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: new ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: new Image.asset("assets/image/gym.jpg")),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: new Row(
              children: [
                // First child in the Row for the name and the
                // Release date information.
                new Expanded(
                  // Name and Release date are in the same column
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: new BorderRadius.circular(10.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: Container(
                                      child: DropDownFormField(
                                        titleText: null,
                                        hintText: 'Enter Numbers of sets',
                                        value: _myActivity,
                                        onSaved: (value) {
                                          setState(() {
                                            _myActivity = value;
                                          });
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            a = true;
                                            _myActivity = value;
                                            getList();
                                          });
                                        },
                                        dataSource: list,
                                        textField: 'display',
                                        valueField: 'value',
                                      ),
                                    ),
                                  ),
                                  true
                                      ? Visibility(
                                    visible: a,
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Text("INTENSITY",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          SizedBox(width: 60),
                                          Text("REPS",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold)),
                                          SizedBox(width: 60),
                                          Text("WEIGHT",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  )
                                      : Container(),
                                  SizedBox(height: 20),
                                  Container(
                                      child: Column(
                                        children: getList(),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(_myActivityResult),
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => bottomNavigationBar()));
                        },
                        child: Container(
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
              ],
            ),
          ),
        ]));
  }
}