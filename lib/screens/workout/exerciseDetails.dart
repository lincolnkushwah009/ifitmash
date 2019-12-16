import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:ifitmash/components/Picker.dart';
import 'package:ifitmash/screens/bottomNavigationBar.dart';

//class ExerciseDetail extends StatefulWidget {
//  // Movie object to handle.
//  @override
//  _ExerciseDetailState createState() => _ExerciseDetailState();
//}
//
//class _ExerciseDetailState extends State<ExerciseDetail> {
//  String _myActivity;
//  String _myActivityResult;
//  final formKey = new GlobalKey<FormState>();
//
//  @override
//  void initState() {
//    super.initState();
//    _myActivity = '';
//    _myActivityResult = '';
//  }
//
//  _saveForm() {
//    var form = formKey.currentState;
//    if (form.validate()) {
//      form.save();
//      setState(() {
//        _myActivityResult = _myActivity;
//      });
//    }
//  }
//
//  var selectedCount = 0;
//  // Constructor for the class.
//  var sets = ["1 Set", "2 Sets", "3 Sets", "4 Sets","5 Sets"];
//
//  List<Map<dynamic, dynamic>> list = [
//    {
//      "display": "1",
//      "value": "Running",
//    },
//    {
//      "display": "2",
//      "value": "Climbing",
//    },
//    {
//      "display": "3",
//      "value": "Walking",
//    },
//    {
//      "display": "4",
//      "value": "Swimming",
//    },
//    {
//      "display": "5",
//      "value": "moving",
//    },
//  ];
//
//  List<Widget> getList() {
//    List<Widget> wlist = [];
//
//    for (var i = 0; i < list.length; i++) {
//      if (list[i]['value'] == _myActivity) {
//        selectedCount = int.parse(list[i]['display']);
//      }
//    }
//
//    for(var i=1;i<=selectedCount;i++) {
//      wlist.add(
//
//          Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children:<Widget>[
//
//                Expanded(
//                  child: TextField(
//                    decoration: InputDecoration(
//
//                        labelText: 'Sets',
//                        border: OutlineInputBorder()),
//                    keyboardType: TextInputType.number,
//
//                  ),
//                ),
//                SizedBox(width: 15,height: 5),
//                Expanded(
//                  child: TextField(
//                    decoration: InputDecoration(
//
//                        labelText: 'reps',
//                        border: OutlineInputBorder()),
//                    keyboardType: TextInputType.number,
//
//                  ),
//                )
//              ]
//          )
//      );
//    }
//    return wlist;
//  }
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          iconTheme: IconThemeData(
//            color: Colors.black, //change your color here
//          ),
//
//
//          title: new Text(
//            "Exercises",
//            style: TextStyle(color: Colors.black),
//          ),
//          backgroundColor: Colors.white,
//        ),
//        body: new ListView(children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(20.0),
//            child: ClipRRect(
//                borderRadius: new BorderRadius.circular(10.0),
//                child: new Image.asset("assets/image/gym.jpg")),
//          ),
//          new Container(
//            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//            child: new Row(
//              children: [
//                // First child in the Row for the name and the
//                // Release date information.
//                new Expanded(
//                  // Name and Release date are in the same column
//                  child: new Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Container(
//                        child: ClipRRect(
//                            borderRadius: new BorderRadius.circular(10.0),
//                            child: Form(
//                              key: formKey,
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: <Widget>[
//                                  Container(
//                                    padding: EdgeInsets.all(16.0),
//                                    child: DropDownFormField(
////
//                                      hintText: 'Enter no. of sets',
//                                      value: _myActivity,F
//                                      onSaved: (value) {
//                                        setState(() {
//                                          _myActivity = value;
//                                        });
//                                      },
//                                      onChanged: (value) {
//                                        setState(() {
//                                          _myActivity = value;
//                                          getList();
//                                        });
//                                      },
//                                      dataSource: list,
//                                      textField: 'display',
//                                      valueField: 'value',
//                                    ),
//                                  ),
//                                  Container(
//                                      child: Column(
//                                        children: getList(),
//                                      )),
//                                  Container(
//                                    padding: EdgeInsets.all(16),
//                                    child: Text(_myActivityResult),
//                                  )
//                                ],
//                              ),
//                            )),
//                      ),
//                      SizedBox(
//                        height: 20,
//                      ),
//                      InkWell(
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              new MaterialPageRoute(
//                                  builder: (context) => bottomNavigationBar()));
//                        },
//                        child: Container(
//                          height: 45,
//                          decoration: BoxDecoration(
//                              gradient: LinearGradient(
//                                colors: [Color(0xDD000000), Color(0xDD000000)],
//                              ),
//                              borderRadius:
//                              BorderRadius.all(Radius.circular(50))),
//                          child: Center(
//                            child: Text(
//                              'GO'.toUpperCase(),
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ]));
//  }
//}

class ExerciseDetail extends StatefulWidget {

  @override
  _ExerciseDetailState createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => Picker()));
                    },
                    child: Text("Exercise",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                  ),
                  background: Image.asset(
                    "assets/image/gym.jpg",
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ];
        },
        body: Column( children: <Widget>[
          Container(
            height: 50,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
              Text('Pick the Quantity of food!'),
              Text('Icon')
            ],),
          ),
         Container(
           height: 200,
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
             Container(
               height: 50,
               child: SingleChildScrollView(
                 child: Column(children: <Widget>[
                   Text('asdsad123'),
                 ],),
               ),
             ),
             Container(
               child: SingleChildScrollView(
                 child: Text('asdsad'),
               ),
             )
           ],),
         ),
          Container(
            height: 100,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[

              Text("Item"),
              Text("Item"),
              Text("Item"),
              Text("Item")
            ],),
          )

        ],


        ),
      ),
    );
  }

}


