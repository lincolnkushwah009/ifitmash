import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fit_kit/fit_kit.dart';
import 'package:ifitmash/components/radial_progress.dart';


class Dashboard  extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard > {


  void read() async {
    final results = await FitKit.read(
      DataType.HEART_RATE,
      DateTime.now().subtract(Duration(days: 5)),
      DateTime.now(),
    );
    print(results);
  }

  void readAll() async {
    if (await FitKit.requestPermissions(DataType.values)) {
      for (DataType type in DataType.values) {
        final results = await FitKit.read(
          type,
          DateTime.now().subtract(Duration(days: 5)),
          DateTime.now(),
        );
        print(results);
      }
    }
  }
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          RadialProgress(),
          const SizedBox(height: 25.0),

          Row(
            children: <Widget>[
              Expanded(

                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                          boxShadow: [BoxShadow(
                            color: Colors.blue,
                            blurRadius: 10.0,
                          ),],
                        color: Colors.blue,

                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0),
                        )
                      ),
                      height: 190,

                      child: GestureDetector(

                        child: FlatButton(
                          onPressed: (){},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "9,850",
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.walking,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                  children:<Widget>[

                                    Text(
                                      'Steps',
                                      style: whiteText,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(110, 80, 5, 0),
                                      child: Icon(Icons.add_circle_outline),
                                    ),
                                  ]
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: new BoxDecoration(
                          boxShadow: [BoxShadow(
                            color: Colors.green,
                            blurRadius: 10.0,
                          ),],
                        color: Colors.green,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0)
                        )                   
                      ),
                      height: 120,

                      child: GestureDetector(
                        child: FlatButton(
                          onPressed: (){},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "BMI",
                                  style:
                                  Theme
                                      .of(context)
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
<<<<<<< HEAD
                              Padding(
                                padding: const EdgeInsets.fromLTRB(110, 20, 5, 0) ,
                                child: Icon(
                                  Icons.add_circle_outline
                                ),
=======
                              Column(
                                  children:<Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(110, 20, 5, 0),
                                      child: Icon(Icons.add_circle_outline),
                                    ),
                                  ]
>>>>>>> ab99747e448ae90ca14e2c18135c2e516f3ceedd
                              )
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
                          boxShadow: [BoxShadow(
                            color: Colors.red,
                            blurRadius: 10.0,
                          ),],
                        color: Colors.red,
                        borderRadius: new BorderRadius.only(
                          topLeft:const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0)
                        )
                      ),
                      height: 120,

                      child: GestureDetector(
                        child: FlatButton(
                          onPressed: (){},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "2,430",
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.fire,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                children:<Widget>[

                                  Text(
                                  'Calories Intake',
                                  style: whiteText,
                                ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(110, 20, 5, 0),
                                    child: Icon(Icons.add_circle_outline),
                                  ),
                                ]
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(

                      decoration: new BoxDecoration(
                          boxShadow: [BoxShadow(
                            color: Colors.yellow,
                            blurRadius: 10.0,
                          ),],
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(10.0),
                          topLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0)
                        )
                      ),
                      height: 190,
                      child: GestureDetector(
                        child: FlatButton(
                          onPressed: (){},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Workout",
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.road,
                                  color: Colors.black,
                                ),
                              ),
<<<<<<< HEAD
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'workout',
                                ),
                              ),
=======
                              Column(
                                  children:<Widget>[

                                    Text(
                                      'Workout',
                                      style: whiteText,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(110, 70, 5, 0),
                                      child: Icon(Icons.add_circle_outline),
                                    ),
                                  ]
                              )
>>>>>>> ab99747e448ae90ca14e2c18135c2e516f3ceedd
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          )
        ],
      ),

    );
  }

}

//_____________________________________________________________________________________

