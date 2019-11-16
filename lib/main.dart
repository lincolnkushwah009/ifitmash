import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:ifitmash/components/splashScreen.dart';
void main(){
  runApp(new MaterialApp(

    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/Login': (BuildContext context) => new WelcomeScreen()
    },
  ));
}
