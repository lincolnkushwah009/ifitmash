import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'updateProfile.dart';
import 'package:ifitmash/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';


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
      body: SafeArea(
        child: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.lightBlue[200].withOpacity(0.8)),
              clipper: getClipper(),
            ),
            Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 20,
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topCenter,
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
//                            color: Colors.blueAccent[200],
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/7_avatar-512.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
//                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ])),
                    Container(
                        height: 30.0,
                        width: 95.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.black,
                          color: Colors.grey,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                    Text(
                      '${userData}',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    Container(
                      padding: new EdgeInsets.all(20.0),
                      child: new Center(
                        child: new Column(
                          children: <Widget>[
                            new Card(

                              child: new Container(
                                child: new Column(
                                  children: <Widget>[
                                    new ListTile(
                                      leading: Image.asset("assets/Icons/sexual.png",height: 20,width: 20,),

                                      title: Text(
                                          '${gender}',
                                          style: TextStyle(
                                            color: Colors.blueGrey,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                      child: Divider(height: 2,),
                                    ),                                ListTile(
                                      leading:  Image.asset("assets/Icons/birthday.png",height: 20,width: 20,),

                                      title: Text(
                                          '${dob}',
                                          style: TextStyle(
                                            color: Colors.blueGrey,)),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                      child: Divider(height: 2,),
                                    ),
                                    ListTile(
                                      leading:  Image.asset("assets/Icons/height.png",height: 20,width: 20,),
                                      title: Text(
                                          "${height}",
                                          style: TextStyle(
                                            color: Colors.blueGrey,)),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                      child: Divider(height: 2,),
                                    ),
                                    ListTile(
                                      leading: Image.asset("assets/Icons/scale.png",height: 20,width: 20,),

                                      title: Text(
                                          '${weight}',
                                          style: TextStyle(
                                            color: Colors.blueGrey,)),

                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
//                          Navigator.push(context, new MaterialPageRoute(builder: (context) => null()));

                      },
                      child: Container(
                        child: Text("LOGOUT",style: TextStyle(fontWeight:FontWeight.bold,letterSpacing: 4,fontSize: 15)),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }



}
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 3.5);
    path.lineTo(size.width + 165, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}


//
//  child: AnimationLimiter(
//  child: Column(
//  children: AnimationConfiguration.toStaggeredList(
//  duration: const Duration(milliseconds: 600),
//  childAnimationBuilder: (widget) => SlideAnimation(
//  horizontalOffset: 50.0,
//  child: FlipAnimation(
//  child: widget,
//  ),
//  ),
//  children: [
//
//  Padding(
//  padding: const EdgeInsets.fromLTRB(0,20,10,0),
//  child: GestureDetector(
//  onTap: ()async{
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  await prefs.remove('email');
//  await Future.delayed(Duration(seconds: 2));
//  Navigator.of(context).pushAndRemoveUntil(
//  // the new route
//  MaterialPageRoute(
//  builder: (BuildContext context) => WelcomeScreen(),
//  ),
//
//
//
//  // this function should return true when we're done removing routes
//  // but because we want to remove all other screens, we make it
//  // always return false
//  (Route route) => false,
//  );
//  },
//  child: Container(
//  alignment: Alignment.topRight,
//  height: 30,
//  child:Image.asset("assets/Icons/shutdown.png"),
//  ),
//  ),
//  ),
//
//  Padding(
//  padding: const EdgeInsets.fromLTRB(0,0,5,0),
//  child: Container(
//  alignment: Alignment.topRight,
//  height: 30,
//  child:Text("Logout"),
//  ),
//  ),
//
//
//  Padding(
//  padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
//  child: Text(
//  "Profile",
//  style: TextStyle(fontSize: 40),
//  ),
//  ),
//  Padding(
//  padding: EdgeInsets.only(left: 5, right: 5, top: 0),
//  child: Container(
//  height: 70,
//  child: Card(
//  color: Colors.white10,
//  elevation: 0,
//  margin: EdgeInsets.only(top: 0),
//  child: ListTile(
//  leading: ClipRRect(
//  borderRadius: BorderRadius.circular(50),
//  child: Image.asset(
//  "assets/image/elon.png",
//  ),
//  ),
//  title: Text(
//  '${userData}',
//  style: TextStyle(color: Colors.black),
//  ),
//  subtitle: Text(
//  "${email}",
//  style: TextStyle(color: Colors.grey),
//  ),
//  )),
//  ),
//  ),
//
//  Padding(
//  padding: const EdgeInsets.fromLTRB(0, 30, 230, 0),
//  child: Container(
//  child: Text("About You"),
//  ),
//  ),
//  Divider(height: 40),
//  Padding(
//  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//  child: Row(
//  children: <Widget>[
//  Container(
//  decoration: BoxDecoration(
//  border: Border.all(color: Colors.grey)),
//  height: 55,
//  width: 165,
//  child: Padding(
//  padding: const EdgeInsets.fromLTRB(10,15,0,0),
//  child: Text('${gender}',style: TextStyle(fontSize:18,color: Colors.grey),),
//  ),
//  ),
//  SizedBox(
//  width: 10,
//  ),
//  Container(
//  decoration: BoxDecoration(
//  border: Border.all(color: Colors.grey)),
//  height: 55,
//  width: 165,
//  child: Padding(
//  padding: const EdgeInsets.fromLTRB(10,15,0,0),
//  child: Text('${dob}',style: TextStyle(fontSize:18,color: Colors.grey),),
//  ),
//  ),
//  ],
//  ),
//  ),
//  Padding(
//  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//  child: Row(
//  children: <Widget>[
//  Container(
//  decoration: BoxDecoration(
//  border: Border.all(color: Colors.grey)),
//  height: 55,
//  width: 165,
//  child: Padding(
//  padding: const EdgeInsets.fromLTRB(10,15,0,0),
//  child: Text('${height}',style: TextStyle(fontSize:18,color: Colors.grey),),
//  ),
//  ),
//  SizedBox(
//  width: 10,
//  ),
//  Container(
//  decoration: BoxDecoration(
//  border: Border.all(color: Colors.grey)),
//  height: 55,
//  width: 165,
//  child: Padding(
//  padding: const EdgeInsets.fromLTRB(10,15,0,0),
//  child: Text('${weight}',style: TextStyle(fontSize:18,color: Colors.grey),),
//  ),
//  ),
//  ],
//  ),
//  ),
//  SizedBox(height: 40),
//  ClipRRect(
//  borderRadius: new BorderRadius.circular(40.0),
//  child: SizedBox(
//  height: 50,
//  width: 300,
//  child: RaisedButton(
//  child: Text("Edit Profile"),
//  onPressed: () {
//  Navigator.push(context,new MaterialPageRoute(builder: (context)=>updateProfile()));
//  },
//  color: Colors.black,
//  textColor: Colors.white,
//  splashColor: Colors.grey,
//  ),
//  ),
//  ),
//  ]),
//  ),
//  ),


