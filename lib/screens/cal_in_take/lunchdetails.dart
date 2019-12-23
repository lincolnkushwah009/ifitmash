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
import 'package:flutter/cupertino.dart';
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

                    },
                    child: Text("Lunch",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        )),
                  ),
                  background: Image.asset(
                    "assets/image/images.jpeg",
                    fit: BoxFit.cover,
                  )
              ),
            ),
          ];
        },
        body: Column( children: <Widget>[
          Container(
            height: 60,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
              Text('Pick the Quantity of food!'),
              Icon(Icons.share)
            ],),
          ),
          Container(
            height: 200,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: 50,
              ),
              Expanded(
                child: Container(
                  child: Center(
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
                        Text('0.75'),
                        Text('1.0)'),
                        Text('1.5'),
                        Text('2.0'),
                        Text('2.5)'),
                        Text('3'),
                        Text('3.5'),
                        Text('4.0)'),
                        Text('4.5'),
                        Text('5.0'),
                        Text('5.5)'),
                        Text('6.0'),

                      ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,height: 5),
              Expanded(
                child: Container(
                  child: Center(
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
                        Text('samosa(regular)'),
                        Text('samosa(mini)'),
                        Text('grams')
                      ],
                      ),
                    ),
                  ),
                ),

              )
            ],),
          ),
          Container(
            height: 100,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[

            Image.asset("assets/image/lunch.jpg"),
              Text("Carbs"),
              Text("Fat"),
              Text("Fibre")
            ],),
          )

        ],


        ),
      ),
    );
  }
}


