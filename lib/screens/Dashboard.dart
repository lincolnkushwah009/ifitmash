import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifitmash/components/ExerciseInput.dart';
import 'package:ifitmash/components/notification.dart';
import 'package:ifitmash/components/googleSign.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fit_kit/fit_kit.dart';
import 'package:ifitmash/calculator.dart';
import 'package:ifitmash/components/StepCount.dart';
import 'package:ifitmash/components/water%20Count/tracking_input.dart';
import 'package:ifitmash/screens/Workout.dart' as prefix0;
import 'package:ifitmash/screens/cal_in_take/BLDlist.dart';
import 'package:ifitmash/screens/workout/exerciseDetails.dart';
import 'package:ifitmash/screens/workout/list_of_exercises.dart';
import 'package:ifitmash/components/CalBurnCircle.dart';
import 'package:ifitmash/components/fadeRoute.dart';
import 'package:ifitmash/screens/cal_in_take/Lunch.dart';
import 'package:ifitmash/screens/profile.dart';
import 'package:ifitmash/components/graph.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:ifitmash/about.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ifitmash/components/reusable_card.dart';
import 'package:ifitmash/components/round_icon_button.dart';
import 'package:ifitmash/constants.dart';
import 'package:ifitmash/input_page/input_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifitmash/components/WaterCountTab.dart';
import 'package:ifitmash/components/AppConfig.dart';
import 'package:image_picker/image_picker.dart';
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

//final DBRef=FirebaseDatabase.instance.reference();
DateTime _now = DateTime.now();
class Dashboard extends StatefulWidget {
  final drawerItems =  [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Profile", Icons.person),
    new DrawerItem("Notifications", Icons.notifications),
    new DrawerItem("Rewards", Icons.redeem),
    new DrawerItem("Store", Icons.store),
    new DrawerItem("Terms and Conditions", Icons.insert_drive_file),
    new DrawerItem("Logout", Icons.power_settings_new)
  ];

  @override
  _DashboardState createState() => _DashboardState();
}

const String spKey = 'myBool';

class _DashboardState extends State<Dashboard> {
   double _energy=0.0;
  int _totalSteps = 0;

  int _counter = 0;
  String _results = 'Unknown';

  bool _buttonPressed = false;
  bool _loopActive = false;

  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      setState(() {
        _counter++;
      });

      // wait a bit
      await Future.delayed(Duration(milliseconds: 200));
    }

    _loopActive = false;
  }

Future<void> readAll() async {
    String results = "";

    try {
      final permissions = await FitKit.requestPermissions(DataType.values);
      if (!permissions) {
        results = "User declined permissions";
      } else {
        DateTime toTime= new DateTime.now();
        DateTime fromTime= new DateTime(toTime.year, toTime.month, toTime.day); 
        final results = await FitKit.read( DataType.STEP_COUNT,fromTime,toTime );
        final calories =await FitKit.read(DataType.ENERGY, fromTime, toTime);
var stepCounts=results.forEach((result) => _totalSteps += result.value.round());
         print(_totalSteps); 
var energyData=calories.forEach((calorie) => _energy += calorie.value.round());
print(_energy);

//         for (DataType type in DataType.values) {
//           final data = await FitKit.read(
//             type,
//             fromTime,
//             toTime
//             // DateTime.now().subtract(Duration(days: 365)),  DateTime.now(), 
              
//           );

// print(fromTime);
// print(toTime);

//           final result = "$type = ${data.forEach((result) => _totalSteps += result.value.round()) }\n\n\n";
//           results += result;
//           debugPrint(result);
//           // final result = await FitKit.readLast(DataType.STEP_COUNT); 
//         }
      }
    } catch (e) {
      results = 'Failed to read all values. $e';
    }

    if (!mounted) return;

    setState(() {
      _results = results;
    });
  }



  int selectedDrawerIndex;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  SharedPreferences sharedPreferences;
  String userData;
  String email;
  String bmi;


  List<dynamic> stepData = new List();
  double weight = 70;
  List<dynamic> currentWeight = new List();
  @override
  @protected
  @mustCallSuper
  void initState() {
    readAll();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      userData = sharedPreferences.getString('user_name');
      email = sharedPreferences.getString('email');
      bmi=sharedPreferences.getString("bmi");
      //sharedPreferences.remove('doubleValue');
      print(userData);
      // will be null if never previously saved
      if (userData == null) {
        userData = "";
        persist(userData); // set an initial value
      }
      setState(() {});
    });
//    SchedulerBinding.instance.addPostFrameCallback((_) => loadData());
  }
//  loadData() {
////    read();
////    readAll();
////    readData();
//  }
//  void read() async {
//    stepData = await FitKit.read(
//      DataType.WEIGHT,
//      DateTime.now().subtract(Duration(days: 5)),
//      DateTime.now(),
//    );
//     print("jefbjefbjefj");
//     print(stepData);
//  }
//  void testingFitKit() async {}
//  void readAll() async {
//    if (await FitKit.requestPermissions(DataType.values)) {
//      for (DataType type in DataType.values) {
//        stepData = await FitKit.read(
//          type,
//          DateTime.now().subtract(Duration(days: 5)),
//          DateTime.now(),
//        );
//         print(stepData);
//      }
//    }
//  }


//  void getValues()async{
//    SharedPreferences sharedPrefs = await sharedPreferences.getInstance();
//  }
   Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      AppConfig.image = image;
    });
  }
   void pickandUpdateImage() async {
    await getImage();
    // print(AppConfig.image);

    // setState(() {
    //   loading_state = true;
    // });

    // var stream =
    //     new http.ByteStream(DelegatingStream.typed(AppConfig.image.openRead()));
    // // get file length
    // var length = await AppConfig.image.length();

    // // string to uri
    // var uri = Uri.parse(AppConfig.apiUrl + AppConfig.updateCustomerImageApi);

    // // create multipart request
    // var request = new http.MultipartRequest("POST", uri);

    // // multipart that takes file
    // var multipartFile = new http.MultipartFile('file', stream, length,
    //     filename: (AppConfig.userID).toString() + 'profileImage');

    // // add file to multipart
    // request.files.add(multipartFile);

    // // send
    // var response = await request.send();
    // if (response.statusCode == 200) {
    //   setState(() {
    //     // loading_state = false;
    //     // AppConfig.customer_details['image'] = _image;
    //     showDialog<void>(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return AlertDialog(
    //             title: Text(
    //               "Success",
    //               style: TextStyle(color: Colors.white),
    //             ),
    //             actions: <Widget>[
    //               FlatButton(
    //                 child: Text('Ok'),
    //                 onPressed: () {
    //                   Navigator.of(context).pop();
    //                 },
    //               ),
    //             ],
    //           );
    //         });
    //     AppConfig.loadLocalImage = true;
    //     print(response);
    //   });
    // }

    // // listen for response
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print(value);
    // });

    // setState(() {});
  }
  void persist(String value) {
    setState(() {
      userData = value;

    });
    sharedPreferences?.setString(spKey, value);
  }

  final TextStyle whiteText = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == selectedDrawerIndex,
        onTap: () => print("a"),
      ));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }
  @override
  Widget _buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title:Center(child: Text("Welcome "+'${userData}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black ))),

        actions: <Widget>[
          InkWell(
            child: Icon(
                Icons.info,
                size: 25,
                color: Colors.black), onTap: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => MyNotification()));},),
        ],

      ),


      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5,20,5,10),
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: ScaleAnimation(
                      child: widget,
                    ),
                  ),
                  children: <Widget>[




                    Card(

                      elevation: 8,

                      child: Container(

                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,10,0,10),
                              child: Stack(
                                children: <Widget>[

                                  Container(

                                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                      child: Center(child: RadialProgress())),
                                      RaisedButton(
                                        
                                        onPressed: (){
                                          print("tap");
                                          pickandUpdateImage();
                                        },
                                        child: Icon(Icons.edit)),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(35, 35, 0, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) => Profile()));
                                      },
                                      child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new AssetImage(
                                                  "assets/image/elon.png"),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Container(child: Center(child: CalBurn())),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 9,
                              thickness: 1,
                              color: Colors.red,
                            ),

                            Column(
                              children: <Widget>[

                                RaisedButton(
                                  onPressed: displayDialog,

                                  child: Text(
                                    "Calorie Burned",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Container(
                                  child: Text(
                                    _energy.toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),

                                Container(
                                  height: 2.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                                ),
                                SizedBox(height: 10),


                                RaisedButton(

                                  onPressed: null,

                                  child: Text(
                                    "Calorie In Take",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0.0),
                                  child: Text(
                                    "2,000 ",
                                    style:
                                    TextStyle(fontSize: 25, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => TrackingInput()));
                      },
                      child: Container(
                        width: 400,
                        height: 100,
                        color:Color.fromRGBO(35, 77, 108,100),

                        child: WaterCountPage(),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[

                              Container(
                                decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue,
                                        blurRadius: 2.0,
                                      ),
                                    ],
                                    color: Colors.blue,
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0),
                                      bottomLeft: const Radius.circular(10.0),
                                      bottomRight: const Radius.circular(10.0),
                                    )),
                                height: 120,
                                child: GestureDetector(
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[



                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                              children: <Widget>[
                                                Container(
                                                   child: Text("STEPS",style: TextStyle(fontSize: 20,color: Colors.white)),
                                                ),

                                                  Icon(
                                                    FontAwesomeIcons.running,
                                                    color: Colors.white,
                                                    size: 25,
                                                  ),

                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              child: Text(_totalSteps.toString(),style: TextStyle(
                                                color:Colors.white,
                                                fontSize: 40,
                                              ),),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              child: Text("3.2 Km",style: TextStyle(
                                                color:Colors.white70,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w100
                                              ),),
                                            ),
                                          ),
                                          // RaisedButton(
                                          //   onPressed: (){
                                          //     Navigator.push(context, new MaterialPageRoute(builder: (context) => MyApp())); 
                                          //   },
                                          //   splashColor: Colors.green,
                                          //   child: Text("google"),
                                          // )




                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 2.0,
                                      ),
                                    ],
                                    color: Colors.red,
                                    borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(10.0),
                                      topRight: const Radius.circular(10.0),
                                      bottomLeft: const Radius.circular(10.0),
                                      bottomRight: const Radius.circular(10.0),
                                    )),
                                height: 120,
                                child: GestureDetector(
                                  child: FlatButton(onPressed: () {Navigator.of(context).push(ScaleRoute(page: InputPage()));},
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                                            children: <Widget>[
                                              Container(
                                                child: Text("BMI",style: TextStyle(fontSize: 20,color: Colors.white)),
                                              ),

                                              Icon(
                                                FontAwesomeIcons.fire,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            child: Text('${bmi.toString()}',style: TextStyle(
                                              color:Colors.white,
                                              fontSize: 40,
                                            ),),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            child: Text("Healthy",style: TextStyle(
                                                color:Colors.white70,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w100
                                            ),),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text("TODAY'S ACTIVITIES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(20.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                        color: Colors.black,
                        child: ListTile(
                         leading: Icon(
                           FontAwesomeIcons.dumbbell,
                           color: Colors.white,
                         ),
                          title: Text(
                            "Today's Workout",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.add_circle_outline,
                              color: Colors.white, size: 25.0),
                          onTap: () {
//                  Navigator.push(context, new MaterialPageRoute(builder: (context) => ListOfExercises()));
                            Navigator.of(context)
                                .push(ScaleRoute(page: prefix0.Workout()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(20.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),

                        color: Colors.black,

                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.nutritionix,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Today's Nutrition",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.add_circle_outline,
                              color: Colors.white, size: 25.0),
                          onTap: () {
                            Navigator.of(context)
                                .push(ScaleRoute(page: BldList()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      children: <Widget>[

                        Container(
                          child: Text("WEIGHT CHART",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),

                        Container(
                            alignment: Alignment.center,
                            height: 240, width: 500, child: Graph()),

                        Container(

                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: ReusableCard(
                                  color: kActiveCardColor,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
//                                      Text('$currentWeight'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                      Text(
                                        'ADD YOUR WEIGHT',
                                        style: kLabelStyle,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          RoundIconButton(
                                            icon: Icons.remove,
                                            onPressed: () { _increaseCounterWhilePressed();

                                            setState(() {
                                                if (weight > 1) weight=weight-.5;
                                              });
                                            },
                                          ),



                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(15.0)),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1,
                                                  )),

                                              child: Center(
                                                child: Text('$weight', style: kNumberStyle ,
                                                ),
                                              ),
                                            ),
                                          ),

                                          RoundIconButton(
                                            icon: Icons.add,
                                            onPressed: () {
                                              setState(() {
                                                weight=weight+0.5;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      ClipRRect(
                                        borderRadius:
                                        new BorderRadius.circular(15.0),
                                        child: SizedBox(
                                          height: 50,
                                          width: 200,
                                          child: RaisedButton(
                                            child: Text("Save"),
                                            onPressed: () {
//                                              readData();
//                                              writeData();
                                              Fluttertoast.showToast(msg: 'You successfully submitted your weight',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIos: 1,
                                                  backgroundColor: Colors.green,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0
                                              );
                                            },
                                            color: Colors.black,
                                            textColor: Colors.white,
                                            splashColor: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),


                    Container(
                      child: Column(
                        children: <Widget>[
//
//                         FloatingActionButton(
//                            onPressed: displayDialog() ,
//                            child: new Icon(Icons.add),
//                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );





  }
//  void writeData(){
//    setState(() {
//      DBRef.child("1").set({
//        'user':email,
//        'weight':weight
////        'date':DateTime.now();
//      });
//    });
//  }
//  void readData(){
//    DBRef.once().then((DataSnapshot dataSnapshot){
//      setState(() {
//        currentWeight=dataSnapshot.value;
//      });
//      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//      print(currentWeight.elementAt(1));
//    });
//  }


  void displayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Message"),
        content: new Text("Calculator Calories Burned"),
        actions: [
         CupertinoDialogAction(child: Text("Manual"),onPressed: () {Navigator.of(context).push(ScaleRoute(page: ExerciseInput()));}, ),



          CupertinoDialogAction(child: Text("Average"))

        ],
      ),
    );
  }


}





