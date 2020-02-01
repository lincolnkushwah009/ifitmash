import 'dart:convert';

import 'lunchdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Lunch extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: new MyHomePage()),
    );
  }
}


class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List foodList;
  Map data;
  TextEditingController editingController = TextEditingController();
  getFoodData() async {
    http.Response response =
    await http.get('https://staging.ifitmash.club/api/getFatsecretDetails');
    data = json.decode(response.body);
    setState(() {
      foodList = data['data'];
    });
    debugPrint(response.body);
  }
  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  @override
  void initState() {
    super.initState();
    getFoodData();
//    items.addAll(data["data"]);

//    items.addAll("${foodList[index]["foodname"]}");
  }


//  final lunch = ['daal','paneer','gobhi','bhindi','chicken korma','mutton','veg biryani','chicken biryani'
//  'aloo','nutrie','paneer bhurji','kadhai paneer','matar paneer','mushroom','daal makhni','daal fry'
//  ];

//
//  var items = List<String>(
//
//  );

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(foodList[data["foodname"]]);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        foodList.clear();
        foodList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        foodList.clear();
        foodList.addAll(data["foodname"]);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                itemCount: foodList.length,
                itemBuilder: (BuildContext context, int index) {
                  print("food");
                  print(foodList);
                  return ListTile(

                    title: Text("${foodList[index]["foodname" ]}"),
                    subtitle: Text("Protien ${foodList[index]["protien" ]}"),
                    onTap: (){
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              LunchDetails()));},
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
