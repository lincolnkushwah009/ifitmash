import 'package:flutter/material.dart';
import 'package:ifitmash/login_with_email.dart';
import 'package:ifitmash/screens/Dashboard.dart';
import 'Login_With_Number.dart';
import '../components/rounded_button.dart';


class WelcomeScreen extends StatefulWidget {
  static String id='welcome-screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(

          decoration: BoxDecoration(



            // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.9],
                colors: [
//                  Color(0xFF424242),
                  Colors.black,
                  Colors.black


                ],
              ),

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/image/logo.png'),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              SizedBox(
                  height: 20.0
              ),
              InkWell(
                onDoubleTap: (){
                  Navigator.push(context,new MaterialPageRoute(builder: (context)=>Dashboard()));
                },
                  child: Center(child: Text("#powered by Ifitmash",style: TextStyle(color: Colors.white,letterSpacing: 5),))),

              SizedBox(
                height: 48.0
              ),



//              Padding(
//                padding: const EdgeInsets.all(15.0),
//                child: FlatButton(
//                  splashColor: Colors.grey,
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(18.0),
//                      side: BorderSide(color: Colors.white)
//                  ),
//                  onPressed:(){
//                    Navigator.push(context,new MaterialPageRoute(builder: (context)=>LoginWithEmail()));                } ,
//                  child: (
//                      Text("Login With Email",style: TextStyle(color: Colors.white),)
//                  ),
//                ),
//              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 60,
                  child: FlatButton(
                    splashColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.white)
                    ),
                    onPressed:(){
                      Navigator.push(context,new MaterialPageRoute(builder: (context)=>LoginWithNumber()));
                    } ,
                    child: (
                    Text("Login With Number",style: TextStyle(color: Colors.white),)
                    ),
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}