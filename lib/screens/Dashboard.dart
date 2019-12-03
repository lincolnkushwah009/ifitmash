import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fit_kit/fit_kit.dart';
import 'package:ifitmash/components/StepCount.dart';
import 'package:ifitmash/components/fadeRoute.dart';
import 'package:ifitmash/screens/Nutrition.dart';
import 'package:ifitmash/screens/cal_in_take/BLDlist.dart';
import 'package:ifitmash/screens/workout/list_of_exercises.dart';
import 'package:ifitmash/components/CalBurnCircle.dart';
import 'package:ifitmash/screens/profile.dart';
import 'package:ifitmash/components/graph.dart';
import 'package:ifitmash/about.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void read() async {
    final results = await FitKit.read(
      DataType.HEART_RATE,
      DateTime.now().subtract(Duration(days: 5)),
      DateTime.now(),
    );
  }

  void testingFitKit() async {}

  final TextStyle whiteText = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Icon(
                Icons.info,
                size: 30,
              ),
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => AboutApp()));
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
                    padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Profile()));
                      },
                      child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage("assets/image/elon.jpeg"),
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
                      style: TextStyle(fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: Text(
                      "480",
                      style: TextStyle(fontSize: 18,
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: Text(

                      "Calorie In Take",
                      style: TextStyle(fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                    child: Text(
                      "2,000 ",
                      style: TextStyle(fontSize: 19
                          ,color: Colors.purple
                      ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Steps \n9,850 ",
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
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
            height: 20,
          ),


          ClipRRect(
            borderRadius: new BorderRadius.circular(20.0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
              color: Color.fromRGBO(222,222,222,100),
              child: ListTile(

                title: Text(
                  "Today's Workout",
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.add_circle_outline,
                    color: Colors.black, size: 25.0),
                onTap: (){
//                  Navigator.push(context, new MaterialPageRoute(builder: (context) => ListOfExercises()));
                  Navigator.of(context).push(ScaleRoute(page: ListOfExercises()));
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
              color: Colors.black,

              child: Container(
                child: RaisedButton(
                  splashColor: Colors.grey,
                  child: ListTile(

                    title: Text(
                      "Today's Nutrition",
                      style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.add_circle_outline,
                        color: Colors.white, size: 25.0),
                    onTap: (){
//                      Navigator.push(
//                          context,
//                          new MaterialPageRoute(
//                              builder: (context) => BldList()));
                      Navigator.of(context).push(ScaleRoute(page: BldList()));

                    },
                  ),
                ),
              ),
            ),
          ),


          SizedBox(
            height: 20,
          ),


          Container(height: 200, width: 400, child: Graph()),
          SizedBox(height: 30),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "weight",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(width: 230),
                Container(
                  child: Text("C State"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Add Weight', border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  child: Text("Save"),
                  onPressed: () {},
                  color: Colors.black,
                  textColor: Colors.white,
                  splashColor: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
