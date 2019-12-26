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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> intensity = const <String>[
  'Low',
  'Medium',
  'High'
];

class Nutrition extends StatefulWidget {
  @override
  _PickerPageState createState() => _PickerPageState();
}

class _PickerPageState extends State<Nutrition> {
  int _selectedIndex = 0;
  int _selectedHour = 0, _selectedMinute = 0;
  int _changedNumber = 0, _selectedNumber = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: <Widget>[
                CupertinoButton(
                    child: Text("Select Intensity :"),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200.0,
                              child: CupertinoPicker(
                                  itemExtent: 32.0,
                                  onSelectedItemChanged: (int index) {
                                    setState(() {
                                      _selectedIndex = index;
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
                    }),
                Text(
                  intensity[_selectedIndex],
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: <Widget>[
                CupertinoButton(
                    child: Text("Select weight:"),
                    onPressed: () {
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
                                          initialItem: _selectedHour,
                                        ),
                                        itemExtent: 32.0,
                                        backgroundColor: Colors.white,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            _selectedHour = index;
                                          });
                                        },
                                        children: new List<Widget>.generate(24,
                                                (int index) {
                                              return new Center(
                                                child: new Text('${index+1}'),
                                              );
                                            })),
                                  ),
                                  Expanded(
                                    child: CupertinoPicker(
                                        scrollController:
                                        new FixedExtentScrollController(
                                          initialItem: _selectedMinute,
                                        ),
                                        itemExtent: 32.0,
                                        backgroundColor: Colors.white,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            _selectedMinute = index;
                                          });
                                        },
                                        children: new List<Widget>.generate(60,
                                                (int index) {
                                              return new Center(
                                                child: new Text('${index+1}'),
                                              );
                                            })),
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
                Text(
                  '${_selectedHour+1}:${_selectedMinute+1}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              children: <Widget>[
                CupertinoButton(
                    child: Text("Select reps :"),
                    onPressed: () {
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
                                          initialItem: _selectedNumber,
                                        ),
                                        itemExtent: 32.0,
                                        backgroundColor: Colors.white,
                                        onSelectedItemChanged: (int index) {
                                          _changedNumber = index;
                                        },
                                        children: new List<Widget>.generate(100,
                                                (int index) {
                                              return new Center(
                                                child: new Text('${index+1}'),
                                              );
                                            })),
                                  ),
                                  CupertinoButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      setState(() {
                                        _selectedNumber = _changedNumber;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
                Text(
                  '${_selectedNumber+1}',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}