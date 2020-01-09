//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:fit_kit/fit_kit.dart';
//import 'package:ifitmash/components/StepCount.dart';
//import 'package:ifitmash/components/fadeRoute.dart';
//import 'package:ifitmash/screens/cal_in_take/Lunch.dart';
//import 'package:ifitmash/screens/workout/list_of_exercises.dart';
//import 'package:ifitmash/components/CalBurnCircle.dart';
//import 'package:ifitmash/screens/profile.dart';
//import 'package:ifitmash/components/graph.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:ifitmash/about.dart';
//import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//import 'package:ifitmash/components/reusable_card.dart';
//import 'package:ifitmash/components/round_icon_button.dart';
//import 'package:ifitmash/constants.dart';
//import 'package:ifitmash/input_page/input_page.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//
//class Dashboard extends StatefulWidget {
//  @override
//  _DashboardState createState() => _DashboardState();
//}
//
//class _DashboardState extends State<Dashboard> {
//  SharedPreferences sharedPreferences;
//  String userData;
//  String email;
//
//  void read() async {
//    final results = await FitKit.read(
//      DataType.HEART_RATE,
//      DateTime.now().subtract(Duration(days: 5)),
//      DateTime.now(),
//    );
//  }
//
//
//
//  void testingFitKit() async {}
//
//  final TextStyle whiteText = TextStyle(color: Colors.white);
//
//  double weight = 70;
//
//  @override
//  void initState() {
//    super.initState();
//
//    SharedPreferences.getInstance().then((SharedPreferences sp) {
//      sharedPreferences = sp;
//      userData = sharedPreferences.getString('user_name');
//      email = sharedPreferences.getString('email');
//      print(userData);
//      // will be null if never previously saved
//      if (userData == null) {
//        userData = "";
//        persist(userData); // set an initial value
//      }
//      setState(() {});
//    });
//  }
//  void persist(String value) {
//    setState(() {
//      userData = value;
//    });
//    sharedPreferences?.setString(spKey, value);
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: _buildBody(context),
//    );
//  }
//  @override
//  Widget _buildBody(BuildContext context) {
//    return Scaffold(
//      body: SingleChildScrollView(
//        child: AnimationLimiter(
//          child: Padding(
//            padding: const EdgeInsets.fromLTRB(10,5,10,10),
//            child: Column(
//              children: AnimationConfiguration.toStaggeredList(
//                duration: const Duration(milliseconds: 375),
//                childAnimationBuilder: (widget) => SlideAnimation(
//                  horizontalOffset: 50.0,
//                  child: ScaleAnimation(
//                    child: widget,
//                  ),
//                ),
//                children: <Widget>[
//
//                  ListTile(
//                    title:Text("Welcome "+'${userData}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 )),
//
//                    trailing:InkWell(
//                      child: Icon(
//                        Icons.info,
//                        size: 30,
//                        color: Colors.black,
//                      ),
//                      onTap: () {
//                        Navigator.push(
//                            context,
//                            new MaterialPageRoute(
//                                builder: (context) => AboutApp()));
//                      },
//                    ),
//                  ),
//
//                  SizedBox(
//                    height: 20,
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Stack(
//                        children: <Widget>[
//                          Container(
//                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
//                              child: Center(child: RadialProgress())),
//                          Container(
//                            padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
//                            child: GestureDetector(
//                              onTap: () {
//                                Navigator.push(
//                                    context,
//                                    new MaterialPageRoute(
//                                        builder: (context) => Profile()));
//                              },
//                              child: Container(
//                                  width: 120.0,
//                                  height: 120.0,
//                                  decoration: new BoxDecoration(
//                                    shape: BoxShape.circle,
//                                    image: new DecorationImage(
//                                      fit: BoxFit.fill,
//                                      image: new AssetImage(
//                                          "assets/image/elon.png"),
//                                    ),
//                                  )),
//                            ),
//                          ),
//                          Container(child: Center(child: CalBurn())),
//                        ],
//                      ),
//                      SizedBox(width: 10),
//                      Column(
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
//                            child: Text(
//                              "Calorie Burned",
//                              style: TextStyle(
//                                fontSize: 18,
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                          ),
//                          Container(
//                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
//                            child: Text(
//                              "480",
//                              style: TextStyle(
//                                fontSize: 25,
//                                color: Colors.red,
//                              ),
//                            ),
//                          ),
//                          Container(
//                            height: 2.0,
//                            width: 80.0,
//                            decoration: BoxDecoration(
//                                color: Colors.purple,
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(10.0))),
//                          ),
//                          SizedBox(height: 10),
//                          Container(
//                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
//                            child: Text(
//                              "Calorie In Take",
//                              style: TextStyle(
//                                fontSize: 19,
//                                fontWeight: FontWeight.bold,
//                              ),
//                            ),
//                          ),
//                          Container(
//                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
//                            child: Text(
//                              "2,000 ",
//                              style:
//                                  TextStyle(fontSize: 25, color: Colors.purple),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                  const SizedBox(height: 40.0),
//                  Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: Column(
//                          children: <Widget>[
//                            Container(
//                              decoration: new BoxDecoration(
//                                  boxShadow: [
//                                    BoxShadow(
//                                      color: Colors.blue,
//                                      blurRadius: 2.0,
//                                    ),
//                                  ],
//                                  color: Colors.blue,
//                                  borderRadius: new BorderRadius.only(
//                                    topLeft: const Radius.circular(10.0),
//                                    topRight: const Radius.circular(10.0),
//                                    bottomLeft: const Radius.circular(10.0),
//                                    bottomRight: const Radius.circular(10.0),
//                                  )),
//                              height: 120,
//                              child: GestureDetector(
//                                child: FlatButton(
//                                  onPressed: () {},
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      ListTile(
//                                        title: Text(
//                                          "Steps \n9,850 ",
//                                          style: Theme.of(context)
//                                              .textTheme
//                                              .display1
//                                              .copyWith(
//                                                color: Colors.white,
//                                                fontSize: 22.0,
//                                              ),
//                                        ),
//                                        trailing: Icon(
//                                          FontAwesomeIcons.walking,
//                                          color: Colors.white,
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
//                            const SizedBox(height: 10.0),
//                          ],
//                        ),
//                      ),
//                      const SizedBox(width: 10.0),
//                      Expanded(
//                        child: Column(
//                          children: <Widget>[
//                            Container(
//                              decoration: new BoxDecoration(
//                                  boxShadow: [
//                                    BoxShadow(
//                                      color: Colors.red,
//                                      blurRadius: 2.0,
//                                    ),
//                                  ],
//                                  color: Colors.red,
//                                  borderRadius: new BorderRadius.only(
//                                    topLeft: const Radius.circular(10.0),
//                                    topRight: const Radius.circular(10.0),
//                                    bottomLeft: const Radius.circular(10.0),
//                                    bottomRight: const Radius.circular(10.0),
//                                  )),
//                              height: 120,
//                              child: GestureDetector(
//                                child: FlatButton(
//                                  onPressed: () {
//                                    Navigator.of(context)
//                                        .push(ScaleRoute(page: InputPage()));
//                                  },
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      ListTile(
//                                        title: Text(
//                                          "BMI ",
//                                          style: Theme.of(context)
//                                              .textTheme
//                                              .display1
//                                              .copyWith(
//                                                color: Colors.white,
//                                                fontSize: 22.0,
//                                              ),
//                                        ),
//                                        trailing: Icon(
//                                          FontAwesomeIcons.heartbeat,
//                                          color: Colors.white,
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
//                            const SizedBox(height: 10.0),
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
//                  ClipRRect(
//                    borderRadius: new BorderRadius.circular(20.0),
//                    child: Container(
//                      padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
//                      color: Colors.black,
//                      child: ListTile(
//                        title: Text(
//                          "Today's Workout",
//                          style: TextStyle(
//                              color: Colors.white, fontWeight: FontWeight.bold),
//                        ),
//                        trailing: Icon(Icons.add_circle_outline,
//                            color: Colors.white, size: 25.0),
//                        onTap: () {
////                  Navigator.push(context, new MaterialPageRoute(builder: (context) => ListOfExercises()));
//                          Navigator.of(context)
//                              .push(ScaleRoute(page: ListOfExercises()));
//                        },
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
//                  ClipRRect(
//                    borderRadius: new BorderRadius.circular(20.0),
//                    child: Container(
////              color: Color.fromRGBO(222,222,222,100),
//                      color: Color.fromRGBO(222, 222, 222, 100),
//
//                      child: Container(
//                        child: RaisedButton(
//                          splashColor: Colors.grey,
//                          child: ListTile(
//                            title: Text(
//                              "Today's Nutrition",
//                              style: TextStyle(
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                            trailing: Icon(Icons.add_circle_outline,
//                                color: Colors.white, size: 25.0),
//                            onTap: () {
//                              Navigator.of(context)
//                                  .push(ScaleRoute(page: Lunch()));
//                            },
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
//
//                  Column(
//                    children: <Widget>[
//
//                      Container(
//                        height: 40,
//                        width: 150,
//                        color: Colors.grey,
//                        child: Center(child: Text("Weight Chart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
//
//                      ),
//                      Container(
//                          height: 200, width: 400, child: Graph()),
//                    ],
//                  ),
//
//
//                  SizedBox(height: 20),
//                  Container(
//                    child: Column(
//                      children: <Widget>[
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: ReusableCard(
//                                color: kActiveCardColor,
//                                cardChild: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    SizedBox(height: 20),
//                                    Text(
//                                      'ADD YOUR WEIGHT',
//                                      style: kLabelStyle,
//                                    ),
//                                    Text(
//                                      '$weight',
//                                      style: kNumberStyle,
//                                    ),
//                                    Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceAround,
//                                      children: <Widget>[
//                                        RoundIconButton(
//                                          icon: Icons.remove,
//                                          onPressed: () {
//                                            setState(() {
//                                              if (weight > 1) weight=weight-.5;
//                                            });
//                                          },
//                                        ),
//                                        RoundIconButton(
//                                          icon: Icons.add,
//                                          onPressed: () {
//                                            setState(() {
//                                              weight=weight+0.5;
//                                            });
//                                          },
//                                        ),
//                                      ],
//                                    ),
//                                    SizedBox(height: 20),
//                                    ClipRRect(
//                                      borderRadius:
//                                          new BorderRadius.circular(40.0),
//                                      child: SizedBox(
//                                        height: 50,
//                                        width: 200,
//                                        child: RaisedButton(
//                                          child: Text("Save"),
//                                          onPressed: () {
//                                            Fluttertoast.showToast(msg: 'You successfully submitted your weight',
//                                                toastLength: Toast.LENGTH_SHORT,
//                                                gravity: ToastGravity.CENTER,
//                                                timeInSecForIos: 1,
//                                                backgroundColor: Colors.green,
//                                                textColor: Colors.white,
//                                                fontSize: 16.0
//                                            );
//                                          },
//                                          color: Colors.black,
//                                          textColor: Colors.white,
//                                          splashColor: Colors.grey,
//                                        ),
//                                      ),
//                                    ),
//                                    SizedBox(height: 20)
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fit_kit/fit_kit.dart';
import 'package:ifitmash/components/StepCount.dart';
import 'package:ifitmash/screens/Workout.dart' as prefix0;
import 'package:ifitmash/screens/cal_in_take/BLDlist.dart';
import 'package:ifitmash/screens/workout/list_of_exercises.dart';
import 'package:ifitmash/components/CalBurnCircle.dart';
import 'package:ifitmash/components/fadeRoute.dart';
import 'package:ifitmash/screens/cal_in_take/Lunch.dart';
import 'package:ifitmash/screens/profile.dart';
import 'package:ifitmash/components/graph.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ifitmash/about.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ifitmash/components/reusable_card.dart';
import 'package:ifitmash/components/round_icon_button.dart';
import 'package:ifitmash/constants.dart';
import 'package:ifitmash/input_page/input_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
final DBRef=FirebaseDatabase.instance.reference();
DateTime _now = DateTime.now();
class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

    SharedPreferences sharedPreferences;
  String userData;
    List<dynamic> stepData = new List();
  String email;
  double weight = 70;
    List<dynamic> currentWeight = new List();
  @override
  @protected
  @mustCallSuper
  void initState() {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      userData = sharedPreferences.getString('user_name');
      email = sharedPreferences.getString('email');
      print(userData);
      // will be null if never previously saved
      if (userData == null) {
        userData = "";
        persist(userData); // set an initial value
      }
      setState(() {});
    });
    SchedulerBinding.instance.addPostFrameCallback((_) => loadData());
  }
  loadData() {
    read();
    readAll();
    readData();
  }
  void read() async {
    stepData = await FitKit.read(
      DataType.WEIGHT,
      DateTime.now().subtract(Duration(days: 5)),
      DateTime.now(),
    );
     print("jefbjefbjefj");
     print(stepData);
  }
  void testingFitKit() async {}
  void readAll() async {
    if (await FitKit.requestPermissions(DataType.values)) {
      for (DataType type in DataType.values) {
        stepData = await FitKit.read(
          type,
          DateTime.now().subtract(Duration(days: 5)),
          DateTime.now(),
        );
         print(stepData);
      }
    }
   // SchedulerBinding.instance.addPostFrameCallback((_) => loadData());
  }
//  loadData() {
//    read();
//    readAll();
//  }
//
//  void read() async {
//    stepData = await FitKit.read(
//      DataType.STEP_COUNT,
//      DateTime.now().subtract(Duration(days: 365)),
//      DateTime.now(),
//    );
//     print("jefbjefbjefj");
//     print(stepData);
//  }
//
//  void testingFitKit() async {}
//
//  void readAll() async {
//    if (await FitKit.requestPermissions(DataType.values)) {
//      for (DataType type in DataType.values) {
//        final results = await FitKit.read(
//          type,
//          DateTime.now().subtract(Duration(days: 365)),
//          DateTime.now(),
//        );
//         print(results);
//      }
//    }
//  }
    void persist(String value) {
    setState(() {
      userData = value;
    });
    sharedPreferences?.setString(spKey, value);
  }
  final TextStyle whiteText = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }
  @override
  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,5,10,10),
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

                  ListTile(
                    title:Text("Welcome "+'${userData}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 )),

                    trailing:InkWell(
                      child: Icon(
                        Icons.info,
                        size: 30,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => AboutApp()));
                      },
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Center(child: RadialProgress())),
                          Container(
                            padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => Profile()));
                              },
                              child: Container(
                                  width: 120.0,
                                  height: 120.0,
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
                      SizedBox(width: 10),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                            child: Text(
                              "Calorie Burned",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                            child: Text(
                              "480",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Container(
                            height: 2.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                            child: Text(
                              "Calorie In Take",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                            child: Text(
                              "2,000 ",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.purple),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          '${stepData.toString()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: 22.0,
                                              ),
                                        ),
                                        trailing: Icon(
                                          FontAwesomeIcons.walking,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
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
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(ScaleRoute(page: InputPage()));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                          "BMI ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .display1
                                              .copyWith(
                                                color: Colors.white,
                                                fontSize: 22.0,
                                              ),
                                        ),
                                        trailing: Icon(
                                          FontAwesomeIcons.heartbeat,
                                          color: Colors.white,
                                        ),
                                      ),
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
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                      color: Colors.black,
                      child: ListTile(
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
//              color: Color.fromRGBO(222,222,222,100),
                      color: Color.fromRGBO(222, 222, 222, 100),

                      child: Container(
                        child: RaisedButton(
                          splashColor: Colors.grey,
                          child: ListTile(
                            title: Text(
                              "Today's Nutrition",
                              style: TextStyle(
                                  color: Colors.black,
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Column(
                    children: <Widget>[

                      Container(
                        alignment: Alignment.center,
                          height: 240, width: 500, child: Graph()),

                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ReusableCard(
                              color: kActiveCardColor,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 20),
                                  Text('$currentWeight'),
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
                                        onPressed: () {
                                          setState(() {
                                            if (weight > 1) weight=weight-.5;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 80,
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
                                    new BorderRadius.circular(40.0),
                                    child: SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: RaisedButton(
                                        child: Text("Save"),
                                        onPressed: () {
                                          readData();
                                          writeData();
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
                    ],
                  ),


                  Container(
                    child: Column(
                      children: <Widget>[

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void writeData(){
    setState(() {
      DBRef.child("1").set({
        'user':email,
        'weight':weight
//        'date':DateTime.now();
      });
    });
  }
  void readData(){
    DBRef.once().then((DataSnapshot dataSnapshot){
      setState(() {
        currentWeight=dataSnapshot.value;
      });
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      print(currentWeight);

    });
  }
}