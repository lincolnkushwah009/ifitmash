import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:ifitmash/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';





class Profile extends StatefulWidget {
  @override

  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  String  email;
  String gender;


  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    email = prefs.getString("name");
    setState(() {
      email;
      gender;

      print(email+"djsnflkndknfsndklfdlnlfndsfnsd");
      print(gender+"dfdnmdfmmmmmmmmmmmmmmmmm...................");

    });
  }

  @override
  void initState() {
    super.initState();
    email = "";

    getSharedPrefs();
  }


//  @override
//
//  Widget build(BuildContext context) {
//    return SingleChildScrollView(
//      child: Column(children: [
//
//
//
//        Padding(
//          padding: const EdgeInsets.fromLTRB(0,20,10,0),
//          child: GestureDetector(
//            onTap: (){
//              Navigator.push(context,
//                  new MaterialPageRoute(builder: (context) => WelcomeScreen()));
//            },
//            child: Container(
//              alignment: Alignment.topRight,
//              height: 30,
//              child:Image.asset("assets/Icons/shutdown.png"),
//            ),
//          ),
//        ),
//
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0,0,5,0),
//           child: Container(
//              alignment: Alignment.topRight,
//              height: 30,
//              child:Text("Logout"),
//            ),
//         ),
//
//
//        Padding(
//          padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
//          child: Text(
//            "Profle",
//            style: TextStyle(fontSize: 40),
//          ),
//        ),
//        Padding(
//          padding: EdgeInsets.only(left: 5, right: 5, top: 0),
//          child: Container(
//            height: 70,
//            child: Card(
//                color: Colors.white10,
//                elevation: 0,
//                margin: EdgeInsets.only(top: 0),
//                child: ListTile(
//                  leading: ClipRRect(
//                    borderRadius: BorderRadius.circular(50),
//                    child: Image.asset(
//                      "assets/image/elon.png",
//                    ),
//                  ),
//                  title: Text(
//                    "John doe",
//                    style: TextStyle(color: Colors.black),
//                  ),
//                  subtitle: Text(
//                    "johndoe@gmail.com",
//                    style: TextStyle(color: Colors.grey),
//                  ),
//                )),
//          ),
//        ),
//
//
//
//        Padding(
//          padding: const EdgeInsets.fromLTRB(0, 30, 230, 0),
//          child: Container(
//            child: Text("About You"),
//          ),
//        ),
//        Divider(height: 40),
//        Padding(
//          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//          child: Row(
//            children: <Widget>[
//
//
//              const Expanded(
//                child: TextField(
//                  decoration: InputDecoration(
//                      labelText: 'Gender', border: OutlineInputBorder()),
//                  keyboardType: TextInputType.text,
//                ),
//              ),
//              SizedBox(
//                width: 10,
//              ),
//              const Expanded(
//                child: TextField(
//
//                  decoration: InputDecoration(
//                      labelText: 'Birthday', border: OutlineInputBorder()),
//                  keyboardType: TextInputType.datetime,
//                ),
//              )
//            ],
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//          child: Row(
//            children: <Widget>[
//              const Expanded(
//                child: TextField(
//                  decoration: InputDecoration(
//                      labelText: 'Weight', border: OutlineInputBorder()),
//                  keyboardType: TextInputType.number,
//                ),
//              ),
//              SizedBox(
//                width: 10,
//              ),
//              const Expanded(
//                child: TextField(
//                  decoration: InputDecoration(
//                      labelText: 'Height', border: OutlineInputBorder()),
//                  keyboardType: TextInputType.number,
//                ),
//              ),
//            ],
//          ),
//        ),
//        SizedBox(height: 40),
//        ClipRRect(
//          borderRadius: new BorderRadius.circular(40.0),
//          child: SizedBox(
//            height: 50,
//            width: 300,
//            child: RaisedButton(
//              child: Text("Save"),
//              onPressed: () {},
//              color: Colors.black,
//              textColor: Colors.white,
//              splashColor: Colors.grey,
//            ),
//          ),
//        ),
//
//
//      ]),
//    );
//
//
//  }




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


              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Gender', border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              const Expanded(
                child: TextField(

                  decoration: InputDecoration(
                      labelText: 'Birthday', border: OutlineInputBorder()),
                  keyboardType: TextInputType.datetime,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            children: <Widget>[
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Weight', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Height', border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
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
