//import 'package:flutter/material.dart';
//
//class Nutrition extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//      body: SingleChildScrollView(
//
//        child:Center(
//
//          child: Column(
//
//
//
//            children: <Widget>[
//              SizedBox(height: 20),
//              Container(child: Text("Assigned Nutrition"),),
//
//              SizedBox(height: 100),
//              Divider(color: Colors.grey),
//
//              Container(
//                  child:  ClipRRect(
//                    borderRadius: new BorderRadius.circular(40.0),
//                    child: SizedBox(
//                      height: 50,
//                      width: 300,
//                      child: RaisedButton(child: Text("Add Nutrition"),
//                        onPressed: (){
//
//                        },
//                        color: Colors.black,
//                        textColor: Colors.white,
//                        splashColor: Colors.grey,
//                      ),
//                    ),
//                  )
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//const List<String> intensity = const <String>[
//  'Low',
//  'Medium',
//  'High'
//];
//
//class Nutrition extends StatefulWidget {
//  @override
//  _PickerPageState createState() => _PickerPageState();
//}
//
//class _PickerPageState extends State<Nutrition> {
//  int _selectedIndex = 0;
//  int _selectedHour = 0, _selectedMinute = 0;
//  int _changedNumber = 0, _selectedNumber = 1;
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: const Text(''),
//      ),
//      body: Padding(
//        padding: const EdgeInsets.all(16.0),
//        child: Column(
//          children: <Widget>[
//            Text(
//              "",
//              style: TextStyle(
//                fontWeight: FontWeight.bold,
//                fontSize: 18.0,
//              ),
//            ),
//            Row(
//              children: <Widget>[
//                CupertinoButton(
//                    child: Text("Select Intensity :"),
//                    onPressed: () {
//                      showModalBottomSheet(
//                          context: context,
//                          builder: (BuildContext context) {
//                            return Container(
//                              height: 200.0,
//                              child: CupertinoPicker(
//                                  itemExtent: 32.0,
//                                  onSelectedItemChanged: (int index) {
//                                    setState(() {
//                                      _selectedIndex = index;
//                                    });
//                                  },
//                                  children: new List<Widget>.generate(
//                                      intensity.length, (int index) {
//                                    return new Center(
//                                      child: new Text(intensity[index]),
//                                    );
//                                  })),
//                            );
//                          });
//                    }),
//                Text(
//                  intensity[_selectedIndex],
//                  style: TextStyle(fontSize: 18.0),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//              ],
//            ),
//            Text(
//              "",
//              style: TextStyle(
//                fontWeight: FontWeight.bold,
//                fontSize: 18.0,
//              ),
//            ),
//            Row(
//              children: <Widget>[
//                CupertinoButton(
//                    child: Text("Select weight:"),
//                    onPressed: () {
//                      showModalBottomSheet(
//                          context: context,
//                          builder: (BuildContext context) {
//                            return Container(
//                              height: 200.0,
//                              color: Colors.white,
//                              child: Row(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: CupertinoPicker(
//                                        scrollController:
//                                        new FixedExtentScrollController(
//                                          initialItem: _selectedHour,
//                                        ),
//                                        itemExtent: 32.0,
//                                        backgroundColor: Colors.white,
//                                        onSelectedItemChanged: (int index) {
//                                          setState(() {
//                                            _selectedHour = index;
//                                          });
//                                        },
//                                        children: new List<Widget>.generate(24,
//                                                (int index) {
//                                              return new Center(
//                                                child: new Text('${index+1}'),
//                                              );
//                                            })),
//                                  ),
//                                  Expanded(
//                                    child: CupertinoPicker(
//                                        scrollController:
//                                        new FixedExtentScrollController(
//                                          initialItem: _selectedMinute,
//                                        ),
//                                        itemExtent: 32.0,
//                                        backgroundColor: Colors.white,
//                                        onSelectedItemChanged: (int index) {
//                                          setState(() {
//                                            _selectedMinute = index;
//                                          });
//                                        },
//                                        children: new List<Widget>.generate(60,
//                                                (int index) {
//                                              return new Center(
//                                                child: new Text('${index+1}'),
//                                              );
//                                            })),
//                                  ),
//                                ],
//                              ),
//                            );
//                          });
//                    }),
//                Text(
//                  '${_selectedHour+1}:${_selectedMinute+1}',
//                  style: TextStyle(fontSize: 18.0),
//                ),
//              ],
//            ),
//            Text(
//              "",
//              style: TextStyle(
//                fontWeight: FontWeight.bold,
//                fontSize: 18.0,
//              ),
//            ),
//            Row(
//              children: <Widget>[
//                CupertinoButton(
//                    child: Text("Select reps :"),
//                    onPressed: () {
//                      showModalBottomSheet(
//                          context: context,
//                          builder: (BuildContext context) {
//                            return Container(
//                              height: 200.0,
//                              color: Colors.white,
//                              child: Row(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  CupertinoButton(
//                                    child: Text("Cancel"),
//                                    onPressed: () {
//                                      Navigator.pop(context);
//                                    },
//                                  ),
//                                  Expanded(
//                                    child: CupertinoPicker(
//                                        scrollController:
//                                        new FixedExtentScrollController(
//                                          initialItem: _selectedNumber,
//                                        ),
//                                        itemExtent: 32.0,
//                                        backgroundColor: Colors.white,
//                                        onSelectedItemChanged: (int index) {
//                                          _changedNumber = index;
//                                        },
//                                        children: new List<Widget>.generate(100,
//                                                (int index) {
//                                              return new Center(
//                                                child: new Text('${index+1}'),
//                                              );
//                                            })),
//                                  ),
//                                  CupertinoButton(
//                                    child: Text("Ok"),
//                                    onPressed: () {
//                                      setState(() {
//                                        _selectedNumber = _changedNumber;
//                                      });
//                                      Navigator.pop(context);
//                                    },
//                                  ),
//                                ],
//                              ),
//                            );
//                          });
//                    }),
//                Text(
//                  '${_selectedNumber+1}',
//                  style: TextStyle(fontSize: 18.0),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
const List<String> intensity = const <String>['Low', 'Medium', 'High'];

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _selectedNumber = new List<int>.generate(100, (i) => 0);
  List<int> _selectedHour = new List<int>.generate(100, (i) => 0);
  List<int> _selectedMinute = new List<int>.generate(100, (i) => 0);
  List<int> _selectedIndex = new List<int>.generate(100, (i) => 0);
  List<int> _changedNumber = new List<int>.generate(100, (i) => 0);


  bool a = false;
  String _myActivity;
  String _myActivityResult;
  final _formKey = GlobalKey<FormState>();
  int newSULength = 1;
  var selectedUnit = [0, 0, 0];
  var selectedGrade = [0, 0, 0];
  var selectedGrade2 = [0, 0, 0];
  var _course = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        alignment: Alignment.bottomRight,
        child: Column(
          children: <Widget>[
            Expanded(
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

            Container(
              child: Row(
                children: <Widget>[
                  Container(margin:EdgeInsets.only(bottom: 8.0,top: 8.0,right: 270.0,left: 8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          newSULength--;
                          selectedUnit.add(0);
                          selectedGrade.add(0);
                          selectedGrade2.add(0);
                        });
                      },
                      child: new Icon(Icons.minimize),
                    ),
                  ),
                  Container(
                    child: FloatingActionButton(
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
            ),
          ],
        ),
      ),

    );
  }

  Widget buildfields(int index) {
    return new Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 110.0,
            child:   GestureDetector(
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
                                  onSelectedItemChanged: (int index) {
                                    _changedNumber[index] = index;
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
                            onSelectedItemChanged: (int index) {
                              setState(() {
                                _selectedIndex[index] = index;
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
                  intensity[_selectedIndex[index]],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
          new Container(
            child: new  GestureDetector(
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
                                    initialItem: _selectedHour[index],
                                  ),
                                  itemExtent: 32.0,
                                  backgroundColor: Colors.white,
                                  onSelectedItemChanged: (int index) {
                                    setState(() {
                                      _selectedHour[index] = index;
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
                                    initialItem: _selectedMinute[index],
                                  ),
                                  itemExtent: 32.0,
                                  backgroundColor: Colors.white,
                                  onSelectedItemChanged: (int index) {
                                    setState(() {
                                      _selectedMinute[index] = index;
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
                  '${_selectedHour[index] + 1}:${_selectedMinute[index] + 1}',
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