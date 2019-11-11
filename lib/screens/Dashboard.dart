import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fit_kit/fit_kit.dart';


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
          _buildHeader(),
          const SizedBox(height: 50.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
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
                              Padding(

                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Steps',
                                  style: whiteText,
                                ),

                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(120, 20, 5, 20) ,
                                child: Icon(
                                  Icons.add
                                ),
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

                      decoration: BoxDecoration(
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
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Calories Intake',
                                  style: whiteText,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(

                      decoration: BoxDecoration(
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
                                    fontSize: 21.0,
                                    color: Colors.black,
                                  ),
                                ),
                                trailing: Icon(
                                  FontAwesomeIcons.road,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'workout',
                                ),
                              ),
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
  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            backgroundColor: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Overall\nDaily Progress",
                style:TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "45% to go",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ],
          ),
        )
      ],
    );
  }

}


//_____________________________________________________________________________________

