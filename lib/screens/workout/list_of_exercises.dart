import 'dart:convert';
import 'dart:math';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import '../../components/ExerciseInput.dart';
import '../../components/ExerciseInput.dart';
import 'exerciseDetails.dart';
import 'package:ifitmash/components/home_fragment_service.dart';
import 'package:ifitmash/components/AppConfig.dart';
import 'package:http/http.dart' as http;
final HomeService homeservice = new HomeService();
class ListOfExercises extends StatelessWidget {
 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
   return new Scaffold(
     body: new MyHomePage(),
   );
 }
}


class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;

 @override
 _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 List<dynamic> originalResponse = new List();
 List<dynamic> filteredList = new List();

 List data;
 bool loading = true;
 var items = List<String>();

 @override
 @protected
 @mustCallSuper
 void initState() {
//    items.addAll(exercises);
   SchedulerBinding.instance.addPostFrameCallback((_) => loadData());
 }

 loadData() {
   getWorkoutData();
 }


 getWorkoutData() async {
   http.Response response =
   await http.get('http://super.ifitmash.club/admin/workout/search?search=Work');
   data = json.decode(response.body);

//   for(var i=0;i<data.length;i++) {
//     print(data[i]);
//   }
   print("data length is" + data.length.toString());

   setState(() {
     originalResponse = data;
   });
//   debugPrint(data['data']);
 }


 TextEditingController editingController = TextEditingController();

//  final exercises = ['dumbles','cardio','leg press','crunches','low leg pull in','Crunch',
//    'Resisted Crunch','Inclined Crunch with Feet Attached',
//    'Crunch with Leg Curl',
//    'Sit-Up with Feet Attached',
//    'Sit-Up with Cable',
//    'Trunk Rotation',
//    'Jacknife Sit-Up',
//    'High Leg Pull-In',
//   'Low Leg Pull-In',
//    'Side Plank'
//  ];

 void filterSearchResults(String query) {

   if(query == null || query == '') {
     print("no data here");
     return;
   }

   print(" filter search " + query);
   print(" orig length is" + originalResponse.length.toString());

   setState(() {
     filteredList.clear();
   });

   List<dynamic> temp = new List();
     for(var i=0;i<originalResponse.length; i++) {
       AppConfig.id=originalResponse[i]['id'];
         if(originalResponse[i]['exercise'].contains(query)) {
           temp.add(originalResponse[i]);
           print("contains item" + query + " -- " + originalResponse[i]['exercise']);
         } else {
           print("not contains item " + query + " -- " + originalResponse[i]['exercise']);
         }
     }

   print("search ended");
     setState(() {
       filteredList = temp;
     });


 }

 @override
 Widget build(BuildContext context) {

   return  Scaffold(
//      appBar: AppBar(
//        title:Text("Exercises"),
//        backgroundColor: Colors.black,
//      ),
     body: Container(
       child: Column(
         children: <Widget>[
           Padding(
             padding: const EdgeInsets.fromLTRB(12,30,10,10),
             child: Container(
               child: ClipRRect(
                 borderRadius: new BorderRadius.circular(50.0),
                 child: TextField(
                   onChanged: (value) {
                     filterSearchResults(value);
                   },
                   controller: editingController,
                   decoration: InputDecoration(
                       border: InputBorder.none,
                       filled: true,
                       fillColor: Color.fromRGBO(222,222,222,100),
//                        contentPadding: EdgeInsets.only(left: 30, bottom: 0, top: 15, right: 0),
                       hintText: "Search",
                       prefixIcon: Icon(Icons.search),
                   ),
                 ),
               ),
             ),

           ),
           Divider(height:1),

           Expanded(
             child: AnimationLimiter(
               child: ListView.builder(
                 shrinkWrap: true,
                 itemCount: filteredList.length,
                 itemBuilder: (context, index) {


                   return AnimationConfiguration.staggeredList(
                     position: index,
                     duration: const Duration(milliseconds: 1000),
                     child: SlideAnimation(
                       verticalOffset: 50.0,
                       child: FadeInAnimation(
                         child: ListTile(
                           onTap: (){
                             Navigator.push(
                                 context,
                                 new MaterialPageRoute(
                                     builder: (BuildContext context) =>
                                     new ExerciseInput()));
                           },
                           title: Text('${filteredList[index]['exercise']}'),
                           trailing: Icon(Icons.add_circle_outline,color: Colors.black,),

                         ),
                       ),
                     ),
                   );

                 },
               ),
             ),
           ),
         ],
       ),
     ),
   );
 }

}



// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:math';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:flutter/material.dart';
// import 'exerciseDetails.dart';
// import 'package:ifitmash/components/home_fragment_service.dart';
// import 'package:ifitmash/components/AppConfig.dart';
// final HomeService homeservice = new HomeService();
// class ListOfExercises extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new MyHomePage(),
//     );
//   }
// }


// class MyHomePage extends StatefulWidget {
// //  MyHomePage({Key key, this.title}) : super(key: key);
// //  final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   List<dynamic> notList = new List();
//   Map data;
//   bool loading = true;
//   var items = List<String>();
//   @override
//   @protected
//   @mustCallSuper
//   void initState() {
// //    items.addAll(exercises);
//     SchedulerBinding.instance.addPostFrameCallback((_) => loadData());
//   }

//   loadData() {
//     getWorkoutData();
//   }


//   getWorkoutData() async {
//     http.Response response =
//     await http.get('https://ifitmash.club/api/searchExercise');
//     data = json.decode(response.body);
//     setState(() {
//       notList = data['data'];
//     });
//     debugPrint(response.body);
//   }

//   TextEditingController editingController = TextEditingController();

//   final exercises = ['dumbles','cardio','leg press','crunches','low leg pull in','Crunch',
//     'Resisted Crunch','Inclined Crunch with Feet Attached',
//     'Crunch with Leg Curl',
//     'Sit-Up with Feet Attached',
//     'Sit-Up with Cable',
//     'Trunk Rotation',
//     'Jacknife Sit-Up',
//     'High Leg Pull-In',
//     'Low Leg Pull-In',
//     'Side Plank'
//   ];





//   void filterSearchResults(String query) {
//     List<String> dummySearchList = List<String>();
//     dummySearchList.addAll(exercises);
//     if(query.isNotEmpty) {
//       List<String> dummyListData = List<String>();
//       dummySearchList.forEach((item) {
//         if(item.contains(query)) {
//           dummyListData.add(item);
//         }
//       });
//       setState(() {
//         items.clear();
//         items.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         items.clear();
//         items.addAll(exercises);
//       });
//     }

//   }

//   @override
//   Widget build(BuildContext context) {

//     return  Scaffold(
// //      appBar: AppBar(
// //        title:Text("Exercises"),
// //        backgroundColor: Colors.black,
// //      ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12,30,10,10),
//               child: Container(
//                 child: ClipRRect(
//                   borderRadius: new BorderRadius.circular(50.0),
//                   child: TextField(
//                     onChanged: (value) {
//                       filterSearchResults(value);
//                     },
//                     controller: editingController,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       filled: true,
//                       fillColor: Color.fromRGBO(222,222,222,100),
// //                        contentPadding: EdgeInsets.only(left: 30, bottom: 0, top: 15, right: 0),
//                       hintText: "Search",
//                       prefixIcon: Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//               ),

//             ),
//             Divider(height:1),

//             Expanded(
//               child: AnimationLimiter(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: items.length,
//                   itemBuilder: (context, index) {


//                     return AnimationConfiguration.staggeredList(
//                       position: index,
//                       duration: const Duration(milliseconds: 1000),
//                       child: SlideAnimation(
//                         verticalOffset: 50.0,
//                         child: FadeInAnimation(
//                           child: ListTile(
//                             onTap: (){
//                               Navigator.push(
//                                   context,
//                                   new MaterialPageRoute(
//                                       builder: (BuildContext context) =>
//                                       new ExerciseDetail()));
//                             },
//                             title: Text('${items[index]}'),
//                             trailing: Icon(Icons.add_circle_outline,color: Colors.black,),

//                           ),
//                         ),
//                       ),
//                     );

//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }


