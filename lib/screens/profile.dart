import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'updateProfile.dart';
import 'package:ifitmash/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  @override

  _ProfileState createState() => _ProfileState();
}
const String spKey = 'myBool';

class _ProfileState extends State<Profile> {
  SharedPreferences sharedPreferences;
  String userData;
  String email;
  String dob;
  String height;
  String weight;
  String gender;


//  @override
//  void initState() {
//    super.initState();
//    getValuesForProfile();
//  }

//  void getValuesForProfile(){
//    getValues() async {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      final phone = prefs.getString('phone') ?? "";
//      final email = prefs.getString('email') ?? "";
//      userData=prefs.get('user_name')??"";
//      print(phone);
//      print(email);
//      print(userData);
//    }
//    getValues();
//    }

  @override
  void initState() {
    super.initState();

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

  void persist(String value) {
    setState(() {
      userData = value;

    });
    sharedPreferences?.setString(spKey, value);
  }

    Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 600),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FlipAnimation(
                    child: widget,
                  ),
                ),
                children: [

//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(0,20,10,0),
//                    child: GestureDetector(
//                      onTap: (){
//                        Navigator.of(context).pushReplacementNamed('/Login');
//                      },
//                      child: Container(
//                        alignment: Alignment.topRight,
//                        height: 30,
//                        child:Image.asset("assets/Icons/shutdown.png"),
//                      ),
//                    ),
//                  ),
//
//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(0,0,5,0),
//                    child: Container(
//                      alignment: Alignment.topRight,
//                      height: 30,
//                      child:Text("Logout"),
//                    ),
//                  ),


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
                              '${userData}',
                              style: TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(
                              "${email}",
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
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          height: 55,
                          width: 165,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,15,0,0),
                            child: Text('${gender}',style: TextStyle(fontSize:18,color: Colors.grey),),
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
                            child: Text('${dob}',style: TextStyle(fontSize:18,color: Colors.grey),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          height: 55,
                          width: 165,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,15,0,0),
                            child: Text('${height}',style: TextStyle(fontSize:18,color: Colors.grey),),
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
                            child: Text('${weight}',style: TextStyle(fontSize:18,color: Colors.grey),),
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
                        child: Text("Edit Profile"),
                        onPressed: () {
                          Navigator.push(context,new MaterialPageRoute(builder: (context)=>updateProfile()));
                        },
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
