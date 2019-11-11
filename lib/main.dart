import 'package:flutter/material.dart';
import 'login.dart';
import 'package:ifitmash/components/splashScreen.dart';
void main(){
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/Login': (BuildContext context) => new Login()
    },
  ));
}
