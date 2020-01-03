import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,

              flexibleSpace: FlexibleSpaceBar(

                  title: InkWell(
                    onTap: (){

                    },
                    child: Text("Samosa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        )),
                  ),
                  background: Image.asset(
                    "assets/image/Samosa.jpg",
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
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,10,0),
            child: Container(
              height: 200,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[

                Expanded(
                  child: Container(
                    child: Center(
                      child: Container(
                        height: 130.0,

                        alignment: Alignment.center,
                        padding:EdgeInsets.only(bottom: 30.0),
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 32.0,
                          onSelectedItemChanged: (selectedIndex){
                            print(selectedIndex);
                          },children: [
                          Text('0.75',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('1.0',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('1.5',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('2.0',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('2.5',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('3',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('3.5',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('4.0',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('4.5',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('5.0',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('5.5',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('6.0',style: TextStyle(fontWeight: FontWeight.w100)),

                        ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,width: 5,),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Container(
                        height: 130.0,

                        alignment: Alignment.center,
                        padding:EdgeInsets.only(bottom: 30.0),
                        child: CupertinoPicker(
                          backgroundColor: Colors.white,
                          itemExtent: 32.0,
                          onSelectedItemChanged: (selectedIndex){
                            print(selectedIndex);
                          },children: [
                          Text('samosa(regul)',style: TextStyle(fontWeight: FontWeight.w100),),
                          Text('samosa(mini)',style: TextStyle(fontWeight: FontWeight.w100)),
                          Text('grams',style: TextStyle(fontWeight: FontWeight.w100))
                        ],
                        ),
                      ),
                    ),
                  ),

                )
              ],),
            ),
          ),

          SizedBox(height:20),
          Container(

            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[

              Column(
                children: <Widget>[
                  Text("8.1 g"),
                  SizedBox(height: 10),
                  Image.asset("images/foodicons/protein.png",height: 60),
                  Text("Protein")
                ],
              ),
              Column(
                children: <Widget>[
                  Text("60.3 g"),
                  SizedBox(height: 10),
                  Image.asset("images/foodicons/Carbs.png",height: 60),
                  Text("Carbs"),

                ],
              ),
              Column(
                children: <Widget>[
                  Text("30.6 g"),
                  SizedBox(height: 10),
                  Image.asset("images/foodicons/Fat.png",height: 60),
                  Text("Fat"),

                ],
              ),
              Column(
                children: <Widget>[
                  Text("3.6 g"),
                  SizedBox(height: 10),
                  Image.asset("images/foodicons/fiber.png",height: 60,),
                  Text("Fiber"),
                ],
              ),

            ],),
          ),
          SizedBox(height: 50),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => bottomNavigationBar()));
            },
            child: Container(
              width: 300,
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
    );
  }
}
