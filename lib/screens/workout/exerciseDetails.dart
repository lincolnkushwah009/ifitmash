import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:ifitmash/components/Picker.dart';
import 'package:ifitmash/screens/bottomNavigationBar.dart';

class ExerciseDetail extends StatefulWidget {
  // Movie object to handle.
  @override
  _ExerciseDetailState createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  bool a = false;
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
  var sets = ["1 Set", "2 Sets", "3 Sets", "4 Sets","5 Sets","6 Sets"];

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

    for(var i=1;i<=selectedCount;i++) {
      wlist.add(


          Row( mainAxisAlignment: MainAxisAlignment.spaceAround,

              children:<Widget>[

                Expanded(

                  child: Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    padding:EdgeInsets.only(bottom: 30.0),
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 32.0,
                      onSelectedItemChanged: (selectedIndex){
                        print(selectedIndex);
                      },children: [
                      Text('Low'),
                      Text('Medium'),
                      Text('High')
                    ],
                    ),
                  ),
                ),
                SizedBox(width: 15,height: 5),
                Expanded(

                  child: Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    padding:EdgeInsets.only(bottom: 30.0),
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 32.0,
                      onSelectedItemChanged: (selectedIndex){
                        print(selectedIndex);
                      },children: [
                      Text('1'),
                      Text('2'),
                      Text('3'),
                      Text('4'),
                      Text('5'),
                      Text('6'),
                      Text('7'),
                      Text('8'),
                      Text('9'),
                      Text('10'),
                      Text('11'),
                      Text('12'),
                      Text('13'),
                      Text('14'),
                      Text('15'),
                      Text('16'),
                      Text('17'),
                      Text('18'),
                      Text('19'),
                      Text('20'),

                    ],
                    ),
                  ),
                ),
                SizedBox(width: 15,height: 5),
                Expanded(

                  child: Container(
                    height: 100.0,
                    alignment: Alignment.center,
                    padding:EdgeInsets.only(bottom: 30.0),
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 32.0,
                      onSelectedItemChanged: (selectedIndex){
                        print(selectedIndex);
                      },children: [
                      Text('0'),
                      Text('5'),
                      Text('10'),
                      Text('15'),
                      Text('20'),
                      Text('25'),
                      Text('30'),
                      Text('40'),
                      Text('45'),
                      Text('50'),
                      Text('55'),
                      Text('60'),
                      Text('65'),
                      Text('70'),
                      Text('75'),
                      Text('80'),
                      Text('85'),
                      Text('90'),
                      Text('95'),
                      Text('100')
                    ],
                    ),

                  ),

                ),
              ]
          )

      );
    }
    return wlist;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                                    padding: const EdgeInsets.fromLTRB(0,0,0,20),
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
                                            a=true;
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
                                 true? Visibility(

                                    visible: a,
                                    child: Container(
                                      child: Row(children: <Widget>[
                                        SizedBox(width: 20),
                                        Text("INTENSITY",style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(width: 60),
                                        Text("REPS",style: TextStyle(fontWeight: FontWeight.bold)),
                                        SizedBox(width: 60),
                                        Text("WEIGHT",style: TextStyle(fontWeight: FontWeight.bold)),
                                      ],),
                                    ),
                                  ):Container(),
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
