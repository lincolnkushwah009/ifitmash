import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Nutrition extends StatefulWidget {
  _NutritionPageState createState() => _NutritionPageState();
}
class _NutritionPageState extends State<Nutrition> {
  List categoryList;
  Map data;

  getQuestions() async {
    http.Response response =
    await http.get('https://staging.ifitmash.club/api/getFatsecretDetails');
    data = json.decode(response.body);
    setState(() {
      categoryList = data['data'];
    });
    debugPrint(response.body);
  }

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(75, 0, 180, 100),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categoryList == null ? 0 : categoryList.length,

        itemBuilder: (BuildContext context, int index){
          print("food");
          print(categoryList);

          return GestureDetector(

            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.yellow)),
              child: Card(
                margin: EdgeInsets.all(0),
                color: Color.fromRGBO(31, 0, 65, 100),
                elevation: 8,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.graphic_eq,
                    color: Colors.white,
                    size: 70,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${categoryList[index]["foodname"]}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ]),
              ),
            ),
          );
        } ,
      ),
    );
  }
}