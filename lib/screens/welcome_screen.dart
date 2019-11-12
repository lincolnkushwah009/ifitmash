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
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync:this,
    );
    animation=ColorTween(begin: Colors.red,end: Colors.blue).animate(controller);
    controller.forward();
    controller.addListener((){
      setState(() {
      });
      print(animation.value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/image/logo.png'),
                    height: 60,
                  ),
                ),
                SizedBox(height: 20),
                TypewriterAnimatedTextKit(
                  text:['IFitMesh'],
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Log In',
            color: Colors.lightBlueAccent,
            onpressed: (){
              Navigator.push(context,new MaterialPageRoute(builder: (context)=>LoginScreen()));            },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onpressed: (){
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>RegistrationScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}