//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//
//
//class LunchDetails extends StatelessWidget {
//  // Movie object to handle.
//
//
//  // Constructor for the class.
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          iconTheme: IconThemeData(
//            color: Colors.black, //change your color here
//          ),
//          title: new Text("Lunch",style: TextStyle(
//              color: Colors.black
//          ),),
//          backgroundColor: Colors.white,
//        ),
//        body: new ListView(
//            children: <Widget>[
//              new Image.asset("assets/image/lunch.jpg"),
//              new Container(
//                padding: const EdgeInsets.all(32.0),
//                child: new Row(
//                  children: [
//                    // First child in the Row for the name and the
//                    // Release date information.
//                    new Expanded(
//                      // Name and Release date are in the same column
//                      child: new Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: [
//                          // Code to create the view for name.
//                          new Container(
//                            padding: const EdgeInsets.only(bottom: 8.0),
//                            child: new Text(
//                              "Lunch item",
//                              style: new TextStyle(
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                          ),
//                          // Code to create the view for release date.
//                          new Text(
//                            "Tasty food",
//                            style: new TextStyle(
//                              color: Colors.grey[500],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//
//                  ],
//                ),
//              ),
//              new Container(
//                  padding: const EdgeInsets.all(10.0),
//                  child: new Text("good quality food with delicious taste good quality food with delicious taste good quality food with delicious taste good quality food with delicious taste",
//                    softWrap: true,
//                  )
//              )
//
//            ]
//
//        )
//
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:ifitmash/components/graph.dart';
import 'package:ifitmash/screens/Dashboard.dart';
import 'package:ifitmash/screens/bottomNavigationBar.dart';

class LunchDetails extends StatefulWidget {
  // Movie object to handle.
  @override
  _LunchDetailState createState() => _LunchDetailState();
}

class _LunchDetailState extends State<LunchDetails> {
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

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
  var sets = ["1", "2", "3", "4"];

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
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Large', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Small', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
            )
          ]
      )
      );
    }
    return wlist;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: new Text(
            "Lunch",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: new ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: new Image.asset("assets/image/lunch.jpg")),
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
                                  Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: DropDownFormField(
                                      titleText: 'how many bowls',
                                      hintText: 'Please choose one',
                                      value: _myActivity,
                                      onSaved: (value) {
                                        setState(() {
                                          _myActivity = value;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _myActivity = value;
                                          getList();
                                        });
                                      },
                                      dataSource: list,
                                      textField: 'display',
                                      valueField: 'value',
                                    ),
                                  ),
                                  Container(
                                      child: Column(
                                        children: getList(),
                                      )),
                                  Container(
                                    padding: EdgeInsets.all(16),
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
                              'GO'.toUpperCase(),
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


