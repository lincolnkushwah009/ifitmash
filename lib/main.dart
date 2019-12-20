import 'package:flutter/material.dart';
import 'package:ifitmash/input_page/height/height_styles.dart';
import 'screens/welcome_screen.dart';
import 'package:ifitmash/components/splashScreen.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/bottomNavigationBar.dart';

//
//Future<void> main() async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  var email = prefs.getString('email');
//  print(email);
//  runApp(MaterialApp(home: email == null ? Login() : Home()));
//}
void main() async{

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, //top bar color
        statusBarIconBrightness: Brightness.dark, //top bar icons
        systemNavigationBarColor: Colors.white, //bottom bar color
        systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
      )
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MaterialApp(home: email==null?MyApp():bottomNavigationBar())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: mainBlue,
        fontFamily: 'SF Pro Display',
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new WelcomeScreen()
      },
    );
  }
}
