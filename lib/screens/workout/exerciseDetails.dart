import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class ExerciseDetail extends StatelessWidget {
  // Movie object to handle.


  // Constructor for the class.

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: new Text("Exercises",style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: Colors.white,
        ),
        body: new ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),

                child: ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: new Image.asset("assets/image/gym.jpg")),
              ),
              new Container(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: new Row(
                  children: [
                    // First child in the Row for the name and the
                    // Release date information.
                    new Expanded(
                      // Name and Release date are in the same column
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 15),
                                      filled: true,
                                      fillColor: Color.fromRGBO(222,222,222,100),
                                      hintText: 'Slow'
                                  ),

                                ),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 20,
                        ),
                          Container(
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 15),
                                      filled: true,
                                      fillColor: Color.fromRGBO(222,222,222,100),
                                      hintText: 'Time',
                                      suffixText: "Min",
                                      suffixStyle: TextStyle(
                                          color: Colors.black
                                      )
                                  ),

                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 15),
                                      filled: true,
                                      fillColor: Color.fromRGBO(222,222,222,100),
                                      hintText: 'Distance',
                                      suffixText: "Km",
                                      suffixStyle: TextStyle(
                                          color: Colors.black
                                      )
                                  ),

                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Divider()
                                  ),

                                  Text("OR"),

                                  Expanded(
                                      child: Divider()
                                  ),
                                ]
                            ),
                          ),

                          Container(
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: Container(
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10, bottom: 15, top: 15, right: 15),
                                      filled: true,
                                      fillColor: Color.fromRGBO(222,222,222,100),
                                      hintText: 'Enter calories burnt directly',
                                      suffixText: "Cal",
                                      suffixStyle: TextStyle(
                                          color: Colors.black
                                      )
                                  ),

                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 40,
                          ),

                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xDD000000),
                                      Color(0xDD000000)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50)
                                  )
                              ),
                              child: Center(
                                child: Text('Track'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ]
        )
    );
  }
}