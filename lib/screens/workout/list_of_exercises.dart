import 'dart:math';

import 'package:flutter/material.dart';
import 'exerciseDetails.dart';

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
  TextEditingController editingController = TextEditingController();

  final exercises = ['dumbles','cardio','leg press','crunches','low leg pull in','Crunch',
    'Resisted Crunch','Inclined Crunch with Feet Attached',
    'Crunch with Leg Curl',
    'Sit-Up with Feet Attached',
    'Sit-Up with Cable',
    'Trunk Rotation',
    'Jacknife Sit-Up',
    'High Leg Pull-In',
   'Low Leg Pull-In',
    'Side Plank'
  ];


  var items = List<String>();

  @override
  void initState() {
    items.addAll(exercises);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(exercises);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(exercises);
      });
    }

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
              padding: const EdgeInsets.all(12.0),
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
                        contentPadding: EdgeInsets.only(left: 30, bottom: 0, top: 15, right: 0),

                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),

            ),
            Divider(height:1),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new ExerciseDetail()));
                    },
                    title: Text('${items[index]}'),
                    trailing: Icon(Icons.add_circle_outline,color: Colors.black,),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

