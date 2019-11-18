//import 'package:flutter/material.dart';
////import 'components/rounded_button.dart';
//import 'screens/bottomNavigationBar .dart';
//class LoginScreen extends StatefulWidget {
//
//  static String id='login-screen';
//  @override
//  _LoginScreenState createState() => _LoginScreenState();
//}
//
//class _LoginScreenState extends State<LoginScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.blueGrey,
//      body: Padding(
//        padding: EdgeInsets.symmetric(horizontal: 24.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            Hero(
//              tag: 'logo',
//              child: Container(
//                height: 200.0,
//                child: Image.asset('assets/image/logo.png'),
//              ),
//            ),
//            SizedBox(
//              height: 48.0,
//            ),
//            TextField(
//              onChanged: (value) {
//                //Do something with the user input.
//              },
//              decoration: InputDecoration(
//                hintText: 'Enter your email',
//                contentPadding:
//                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                border: OutlineInputBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//                enabledBorder: OutlineInputBorder(
//                  borderSide:
//                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//                focusedBorder: OutlineInputBorder(
//                  borderSide:
//                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//              ),
//            ),
//            SizedBox(
//              height: 8.0,
//            ),
//            TextField(
//              onChanged: (value) {
//                //Do something with the user input.
//              },
//              decoration: InputDecoration(
//                hintText: 'Enter your password.',
//                contentPadding:
//                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                border: OutlineInputBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//                enabledBorder: OutlineInputBorder(
//                  borderSide:
//                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//                focusedBorder: OutlineInputBorder(
//                  borderSide:
//                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
//                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                ),
//              ),
//            ),
//            SizedBox(
//              height: 24.0,
//            ),
//            GestureDetector(
//              onTap: () {
//                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new bottomNavigationBar()));
//
//              },
//              child: Container(
//                height: 40.0,
//                child: Material(
//                  borderRadius: BorderRadius.circular(20.0),
//                  shadowColor: Colors.greenAccent,
//                  color: Colors.green,
//                  elevation: 7.0,
//                  child: Center(
//                    child: Text(
//                      'LOGIN',
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold,
//                          fontFamily: 'Montserrat'),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifitmash/screens/signUp.dart';
import 'screens/bottomNavigationBar .dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Challenge',
      theme: ThemeData(
          primarySwatch: Colors.amber
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  // f45d27
  // f5851f

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFF00),
                      Color(0xFFFFD600)
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('assets/image/logo.png'),
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 32,
                          right: 32
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,new MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                        },
                        child: Text('Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, right: 32
                      ),
                      child: Text('Forgot Password ?',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new bottomNavigationBar()));
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFFF00),
                              Color(0xFFFFD600)
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          )
                      ),
                      child: Center(
                        child: Text('Login'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
