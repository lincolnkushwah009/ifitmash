import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ifitmash/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


const List<String> gender = const <String>[
  'MALE',
  'FEMALE',
  'Others'
];


class updateProfile extends StatefulWidget {
  @override

  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<updateProfile> {
  int _selectedHour = 0, _selectedMinute = 0;
  int _changedNumber = 0, _selectedNumber = 1;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 600),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: ScaleAnimation(
                    child: widget,
                  ),
                ),
                children: [



                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,20,10,0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) => WelcomeScreen()));
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        height: 30,
                        child:Image.asset("assets/Icons/shutdown.png"),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,5,0),
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 30,
                      child:Text("Logout"),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),

                    child: Text(
                      "Profle",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5, top: 0),
                    child: Container(
                      height: 70,
                      child: Card(
                          color: Colors.white10,
                          elevation: 0,
                          margin: EdgeInsets.only(top: 0),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/image/elon.png",
                              ),
                            ),
                            title: Text(
                              "John doe",
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(
                              "johndoe@gmail.com",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 230, 0),
                    child: Container(
                      child: Text("About You"),
                    ),
                  ),
                  Divider(height: 40),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 200.0,
                                      child: CupertinoPicker(
                                        backgroundColor: Colors.white,
                                          itemExtent: 32.0,
                                          onSelectedItemChanged: (int index) {
                                            setState(() {
                                              _selectedIndex = index;
                                            });
                                          },
                                          children: new List<Widget>.generate(
                                              gender.length, (int index) {
                                            return new Center(
                                              child: new Text(gender[index]),
                                            );
                                          })),
                                    );
                                  });
                            }

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            height: 55,
                            width: 165,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10,15,0,0),
                              child: Text(
                                gender[_selectedIndex],
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          height: 55,
                          width: 165,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,15,0,0),
                            child: Text('dob',style: TextStyle(fontSize:18,color: Colors.grey),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 200.0,
                                      child: CupertinoPicker(
                                          backgroundColor: Colors.white,
                                          itemExtent: 32.0,
                                          onSelectedItemChanged: (int index) {
                                            setState(() {
                                              _selectedHour = index;
                                            });
                                          },
                                          children: new List<Widget>.generate(200,
                                                  (int index) {
                                                return new Center(
                                                  child: new Text('${index+1}'),
                                                );
                                              })),
                                    );
                                  });
                            }

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            height: 55,
                            width: 165,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10,15,0,0),
                              child:  Text(
                                '${_selectedHour+1}',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          height: 55,
                          width: 165,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,15,0,0),
                            child: Text('height',style: TextStyle(fontSize:18,color: Colors.grey),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: new BorderRadius.circular(40.0),
                    child: SizedBox(
                      height: 50,
                      width: 300,
                      child: RaisedButton(
                        child: Text("Save"),
                        onPressed: () {},
                        color: Colors.black,
                        textColor: Colors.white,
                        splashColor: Colors.grey,
                      ),
                    ),
                  ),


                ]),
          ),
        ),
      ),
    );
  }

}