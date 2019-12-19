
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifitmash/components/fadeRoute.dart';
import 'package:ifitmash/screens/workout/list_of_exercises.dart';

class Workout extends StatefulWidget {
  @override
  _WorkoutState createState() => _WorkoutState();
}
const String spKey = 'myBool';
class _WorkoutState extends State<Workout> {
  SharedPreferences sharedPreferences;
  String userData;
  String email;
  @override
  void initState() {
    super.initState();

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
  }

  void persist(String value) {
    setState(() {
      userData = value;
    });
    sharedPreferences?.setString(spKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(15,0,0,0),
              child: Text("Welcome "+'${userData}', style: TextStyle(fontSize: 25,
//                decoration: TextDecoration.underline,
//                decorationStyle: TextDecorationStyle.wavy,
              )),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Find Workout Plan',),
                Tab(text: 'Traning',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),

            ],
          ),
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body:  SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: Column(
                    children: <Widget>[

                      SizedBox(height: 10),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 80, 0),
                          child: Text(
                              " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla enim purus, finibus a commodo fermentum, semper non eros. Mauris a turpis dolor. Aenean facilisis purus mi, et consectetur urna condimentum vel.")),

                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15,0,15,0),
                        child: ClipRRect(

                            borderRadius: new BorderRadius.circular(10.0),
                            child: Container(
                              decoration:
                              BoxDecoration(border: Border.all(color: Colors.black)),
                              child: SizedBox(
                                height: 50,
                                width: 350,
                                child: RaisedButton(
                                  child: Text("Create my own workout plan"),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(ScaleRoute(page: ListOfExercises()));
                                  },
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  splashColor: Colors.grey,
                                ),
                              ),
                            )),
                      ),
                      ListTile(
                        leading: Text("Recommended for you"),
                        trailing: Text('View More'),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                          height: 180.0,
                          child: ListView(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '1 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://www.bodybuilding.com/images/2018/april/the-best-ab-workout-for-a-six-pack-header-830x467.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),

                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '2 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://cdn.mos.cms.futurecdn.net/XLSscxW9r9FT2dG2FTWPTA-1366-80.jpg"),
                                        fit: BoxFit.fill)),
                              ),

                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '3 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://cdn.muscleandstrength.com/sites/default/files/field/feature-wide-image/workout/the-amrap-workout-wide.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '4 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://media.suara.com/pictures/653x366/2017/03/07/85046-ilustrasi-lelaki-sedang-nge-gym.jpg"),
                                        fit: BoxFit.fill)),
                              )
                            ],
                          )),
                      ListTile(
                        leading: Text("Most Popular"),
                      ),
                      SizedBox(height: 10),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                          height: 180.0,
                          child: ListView(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '1 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://img.maximummedia.ie/joe_co_uk/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtam9lY291ay5tYXhpbXVtbWVkaWEuaWUuczMuYW1hem9uYXdzLmNvbVxcXC93cC1jb250ZW50XFxcL3VwbG9hZHNcXFwvMjAxOVxcXC8wOFxcXC8wNTExMzg0NVxcXC9TY3JlZW5zaG90LTIwMTktMDgtMDUtYXQtMTEuMzguMjMucG5nXCIsXCJ3aWR0aFwiOjY0MCxcImhlaWdodFwiOjM2MCxcImRlZmF1bHRcIjpcImh0dHBzOlxcXC9cXFwvd3d3LmpvZS5jby51a1xcXC9hc3NldHNcXFwvaW1hZ2VzXFxcL2pvZWNvdWtcXFwvbm8taW1hZ2UucG5nP2lkPTBhODk3NjFkMGEzYzZmNTFmN2Q2XCIsXCJvcHRpb25zXCI6W119IiwiaGFzaCI6ImNkMDMxMzRjNjZjYjNhYzNkY2IzMGU3MTgxM2U1YmJkNTQ2OWZlZWQifQ==/screenshot-2019-08-05-at-11-38-23.png"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '2 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://cdn.mos.cms.futurecdn.net/XLSscxW9r9FT2dG2FTWPTA-1366-80.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '3 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://cdn.muscleandstrength.com/sites/default/files/field/feature-wide-image/workout/the-amrap-workout-wide.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '4 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://media.suara.com/pictures/653x366/2017/03/07/85046-ilustrasi-lelaki-sedang-nge-gym.jpg"),
                                        fit: BoxFit.fill)),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
        )
    );
  }
}

class SecondScreen extends StatefulWidget {

  @override
  @override
  _SecondScreenState createState() => _SecondScreenState();
}
const String sKey = 'myBool';
class _SecondScreenState extends State<SecondScreen> {
  SharedPreferences sharedPreferences;
  String userData;
  String email;
  @override
  void initState() {
    super.initState();

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
  }

  void persist(String value) {
    setState(() {
      userData = value;
    });
    sharedPreferences?.setString(spKey, value);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body:  SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Welcome "+'${userData}',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                          )),
                      SizedBox(height: 20),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                          child: Text(
                              " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla enim purus, finibus a commodo fermentum, semper non eros. Mauris a turpis dolor. Aenean facilisis purus mi, et consectetur urna condimentum vel.")),

                      SizedBox(height: 20),
                      ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: Container(
                            decoration:
                            BoxDecoration(border: Border.all(color: Colors.black)),
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: RaisedButton(
                                child: Text("Create my own workout plan"),
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(ScaleRoute(page: ListOfExercises()));
                                },
                                color: Colors.white,
                                textColor: Colors.black,
                                splashColor: Colors.grey,
                              ),
                            ),
                          )),
                      ListTile(
                        leading: Text("Recommended for you"),
                        trailing: Text('View More'),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                          height: 180.0,
                          child: ListView(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '1 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://www.bodybuilding.com/images/2018/april/the-best-ab-workout-for-a-six-pack-header-830x467.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),

                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '2 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://cdn.mos.cms.futurecdn.net/XLSscxW9r9FT2dG2FTWPTA-1366-80.jpg"),
                                        fit: BoxFit.fill)),
                              ),

                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '3 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://cdn.muscleandstrength.com/sites/default/files/field/feature-wide-image/workout/the-amrap-workout-wide.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '4 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://media.suara.com/pictures/653x366/2017/03/07/85046-ilustrasi-lelaki-sedang-nge-gym.jpg"),
                                        fit: BoxFit.fill)),
                              )
                            ],
                          )),
                      ListTile(
                        leading: Text("Most Popular"),
                      ),
                      SizedBox(height: 10),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                          height: 180.0,
                          child: ListView(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '1 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://img.maximummedia.ie/joe_co_uk/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtam9lY291ay5tYXhpbXVtbWVkaWEuaWUuczMuYW1hem9uYXdzLmNvbVxcXC93cC1jb250ZW50XFxcL3VwbG9hZHNcXFwvMjAxOVxcXC8wOFxcXC8wNTExMzg0NVxcXC9TY3JlZW5zaG90LTIwMTktMDgtMDUtYXQtMTEuMzguMjMucG5nXCIsXCJ3aWR0aFwiOjY0MCxcImhlaWdodFwiOjM2MCxcImRlZmF1bHRcIjpcImh0dHBzOlxcXC9cXFwvd3d3LmpvZS5jby51a1xcXC9hc3NldHNcXFwvaW1hZ2VzXFxcL2pvZWNvdWtcXFwvbm8taW1hZ2UucG5nP2lkPTBhODk3NjFkMGEzYzZmNTFmN2Q2XCIsXCJvcHRpb25zXCI6W119IiwiaGFzaCI6ImNkMDMxMzRjNjZjYjNhYzNkY2IzMGU3MTgxM2U1YmJkNTQ2OWZlZWQifQ==/screenshot-2019-08-05-at-11-38-23.png"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '2 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://cdn.mos.cms.futurecdn.net/XLSscxW9r9FT2dG2FTWPTA-1366-80.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '3 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://cdn.muscleandstrength.com/sites/default/files/field/feature-wide-image/workout/the-amrap-workout-wide.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 15.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(5,60,10,5),
                                child: Text(
                                  '4 Days Sprint',
                                  style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                height: 190.0,
                                width: MediaQuery.of(context).size.width - 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: new NetworkImage(
                                            "https://media.suara.com/pictures/653x366/2017/03/07/85046-ilustrasi-lelaki-sedang-nge-gym.jpg"),
                                        fit: BoxFit.fill)),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
        )
    );
  }
}

