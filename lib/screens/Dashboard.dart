import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fit_kit/fit_kit.dart';
import 'package:ifitmash/components/StepCount.dart';
import 'package:ifitmash/screens/cal_in_take/BLDlist.dart';
import 'package:ifitmash/screens/workout/list_of_exercises.dart';
import 'package:ifitmash/components/CalBurnCircle.dart';
import 'package:ifitmash/screens/profile.dart';
import 'package:ifitmash/components/graph.dart';

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
                       onTap: (){
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
                                  image: new NetworkImage(
                                      "https://i.pravatar.cc/100"),
                              ),
                          )),
                     ),
                   ),
                  Container(
                      child: Center(child: CalBurn())),
                ],
              ),
              SizedBox(width: 15),
              Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 50,
                    child: Card(
                        elevation: 8,
                        child: Center
                          (child: Text("Cal in Take "))),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 100,
                    height: 50,
                    child: Card(
                        elevation: 8, child: Center(child: Text("Cal Burn"))),
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
                      height: 190,
                      child: GestureDetector(
                        child: FlatButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "9,850",
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
                              Column(children: <Widget>[
                                Text(
                                  'Steps',
                                  style: whiteText,
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 2.0,
                            ),
                          ],
                          color: Colors.green,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(10.0),
                              topRight: const Radius.circular(10.0),
                              bottomRight: const Radius.circular(10.0),
                              bottomLeft: const Radius.circular(10.0))),
                      height: 120,
                      child: GestureDetector(
                        child: FlatButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "BMI",
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.heartbeat,
                                  color: Colors.white,
                                ),
                              ),
                              Column(children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(110, 20, 5, 0),
                                  child: Icon(Icons.add_circle_outline),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
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
                              bottomRight: const Radius.circular(10.0))),
                      height: 120,
                      child: GestureDetector(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => BldList()));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "2,430",
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                ),
                                trailing: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 30),
                                  child: Icon(
                                    FontAwesomeIcons.fire,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(children: <Widget>[
                                Text(
                                  'Calories Intake',
                                  style: whiteText,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(110, 10, 5, 0),
                                  child: Icon(Icons.add_circle_outline),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: new BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pinkAccent,
                              blurRadius: 2.0,
                            ),
                          ],
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.only(
                              topRight: const Radius.circular(10.0),
                              topLeft: const Radius.circular(10.0),
                              bottomRight: const Radius.circular(10.0),
                              bottomLeft: const Radius.circular(10.0))),
                      height: 190,
                      child: GestureDetector(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => ListOfExercises()));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Workout",
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                      ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.road,
                                  color: Colors.white,
                                ),
                              ),
                              Column(children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(110, 90, 5, 0),
                                  child: Icon(Icons.add_circle_outline),
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),

         Container(

             height: 200,
             width: 400,
             child: Nutrition()),


          SizedBox(height: 30),

          Container(
                child: Row(
                  children: <Widget>[
                    Container(

                      child: Text("weight",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(width: 230),
                    Container(
                      child: Text("C State"
                      ),
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

                        labelText: 'Add Weight',
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,

                  ),

                ),
                SizedBox(width: 10,),

                RaisedButton(child: Text("Save"),
                  onPressed: (){},
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
