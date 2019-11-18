import 'package:flutter/material.dart';
import 'package:ifitmash/login_screen.dart';
import 'signUp.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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

      body: Container(

        decoration: BoxDecoration(



          // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Color(0xFFFFFF00),
                Color(0xFFFFD600)
              ],
            ),

        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 150),
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('assets/image/logo.png'),
                      height: 60,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text:['IFitMash'],
                    textStyle: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0
              ),
              RoundedButton(title: 'Log In',
              color: Colors.black,
              onpressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>LoginScreen())); },
              ),
              RoundedButton(
                title: 'Register',
                color: Colors.black,
                onpressed: (){
                  Navigator.push(context,new MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                },
              )
            ],
          ),
        ),

      ),
    );
  }
}