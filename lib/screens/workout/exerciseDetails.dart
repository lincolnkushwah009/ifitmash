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
const String sppKey = 'myBool';
class _ExerciseDetailState extends State<ExerciseDetail> {
  SharedPreferences sharedPreferences;
  String userData;
  String email;
  String dob;
  String height;
  String weight;
  String gender;


//  var time=reps;
//  if(reps<7){
//    print("low rep");
//  time=2.25seconds;
//  }
//  if(reps<14)
//  {print("moderate reps");
//  time=1.5seconds;
//  }
//  if(reps>14){
//    print("high reps");
//    time=0.75seconds;
//  }
//  var a={(0.6309*_heartRate)+(0.2017*age)-(0.9036*_weight)-55.0969*time}/4.184;


  List<int> _selectedNumber = new List<int>.generate(100, (i) => 0);
  List<int> _changedNumber = new List<int>.generate(100, (i) => 0);
  List<int> _heartRate = new List<int>.generate(200, (i) => 0);
 List<int> _weight = new List<int>.generate(200, (i) => 0);

//var b=_selectedNumber+_changedNumber;
  bool a = false;
  String _myActivity;
  String _myActivityResult;
  final _formKey = GlobalKey<FormState>();
  int newSULength = 3;
  var selectedUnit = [0, 0, 0];
  var selectedGrade = [0, 0, 0];
  var selectedGrade2 = [0, 0, 0];
  var _course = '';
  void persist(String value) {
    setState(() {
      userData = value;

    });
    sharedPreferences?.setString(sppKey, value);
  }

@override
  void initState() {
    // TODO: implement initState

  SharedPreferences.getInstance().then((SharedPreferences sp) {
    sharedPreferences = sp;
    userData = sharedPreferences.getString('user_name');
    email = sharedPreferences.getString('email');
    dob = sharedPreferences.getString('dob');
    height = sharedPreferences.getString('height');
    weight = sharedPreferences.getString('weight');
    gender = sharedPreferences.getString('gender');
    print(userData);
    print(dob);
    // will be null if never previously saved
    if (userData == null) {
      userData = "";
      persist(userData); // set an initial value
    }
    setState(() {});
  });
  }

  @override
  Widget build(BuildContext context) {

    var values = [
      {'userId': 1, 'rating': 4.5},
      {'userId': 2, 'rating': 4.0},
      {'userId': 3, 'rating': 3.5},
      {'userId': 4, 'rating': 3.0}
    ];

    var result = (((0.6309)+(0.2017*22)- (0.09036*50)-55.0969)*20)/4.184;
    print(result);
    return new Scaffold(
       bottomNavigationBar: Container(
         height: 60,
         child:   Card(
           elevation: 5,
           child: ListTile(

             title: Text("Calorie Burned",style: TextStyle(fontSize: 25),),
             trailing:  Row(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Text(
                   '🔥',
                   style: TextStyle(fontSize: 25.0),
                 ),
                 Text(result.toString(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))
               ],
             )
//           Text("2344"),
           ),
         )
       ),
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
                        height: 250,
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,10,10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                print(_heartRate[1]);

                              });
                            },
                            children:List<Widget>.generate(200, (int index) {
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