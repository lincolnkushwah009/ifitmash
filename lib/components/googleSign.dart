// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:oauth2/oauth2.dart' as oauth2;

// final authorizationEndpoint =
//     Uri.parse("https://accounts.google.com/o/oauth2/auth");
// final tokenEndpoint =
//     Uri.parse("https://accounts.google.com/o/oauth2/token");


// final identifier = "32682138333-qq6463f3rvmjhkctigsbihv2v3gnkleb.apps.googleusercontent.com";
// final secret = "dQlNjam9e4N8FRtPKA4FRoE3";


// final redirectUrl = Uri.parse("https://www.getpostman.com/oauth2/callback");



// Future<oauth2.Client> getClient() async {
//   var exists = await credentialsFile.exists();

//   if (exists) {
//     var credentials = new oauth2.Credentials.fromJson(
//         await credentialsFile.readAsString());
//     return new oauth2.Client(credentials,
//         identifier: identifier, secret: secret);
//   }

  
//   var grant = new oauth2.AuthorizationCodeGrant(
//       identifier, authorizationEndpoint, tokenEndpoint,
//       secret: secret);

 
//   await redirect(grant.getAuthorizationUrl(redirectUrl));
  
 
//   var request = await listen(redirectUrl);

  
//   return await grant.handleAuthorizationResponse(request.uri.queryParameters);
// }

// main() async {
//   var client = await getClient();

  
//   var result = client.read("https://www.googleapis.com/auth/fitness.activity.read");

  
//   await credentialsFile.writeAsString(client.credentials.toJson());

//   print(result);
// }
import 'dart:async';
import 'dart:ffi';

import 'package:fit_kit/fit_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
const String spKey = 'myBool';
class _MyAppState extends State<MyApp> {
  double _energy=0.0;
  int _totalSteps = 0;
   SharedPreferences sharedPreferences;
  String stepData;
  String calorieBurned;
  String dob;
  String height;
  String weight;
  String gender;
  String _results = 'Unknown';

  @override
  void initState() {
    // SharedPreferences.getInstance().then((SharedPreferences sp) {
    //   sharedPreferences = sp;
    //   stepData = sharedPreferences.getString('step_count');
    //   calorieBurned = sharedPreferences.getString('energy');
    //   // will be null if never previously saved
    //   setState(() {});
    // });
    super.initState();
    readAll();
  }
  Future<void> readAll() async {
    String results = "";

    try {
      final permissions = await FitKit.requestPermissions(DataType.values);
      if (!permissions) {
        results = "User declined permissions";
      } else {
        DateTime toTime= new DateTime.now();
        DateTime fromTime= new DateTime(toTime.year, toTime.month, toTime.day); 
        final results = await FitKit.read( DataType.STEP_COUNT,fromTime,toTime );
        final calories =await FitKit.read(DataType.ENERGY, fromTime, toTime);
var stepCounts=results.forEach((result) => _totalSteps += result.value.round());
         print(_totalSteps); 
var energyData=calories.forEach((calorie) => _energy += calorie.value.round());
print(_energy);

//         for (DataType type in DataType.values) {
//           final data = await FitKit.read(
//             type,
//             fromTime,
//             toTime
//             // DateTime.now().subtract(Duration(days: 365)),  DateTime.now(), 
              
//           );

// print(fromTime);
// print(toTime);

//           final result = "$type = ${data.forEach((result) => _totalSteps += result.value.round()) }\n\n\n";
//           results += result;
//           debugPrint(result);
//           // final result = await FitKit.readLast(DataType.STEP_COUNT); 
//         }
      }
    } catch (e) {
      results = 'Failed to read all values. $e';
    }

    if (!mounted) return;

    setState(() {
      _results = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(_totalSteps.toString() + '\n'+_energy.toString()),
              FlatButton(
                onPressed: () => readAll(),
                child: Text("Reload"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}