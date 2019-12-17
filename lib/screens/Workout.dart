import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8,20,8,0),
            child: Column(

              children: <Widget>[


                SizedBox(height: 20),
                Container(
                    alignment: Alignment.topLeft,

                    child: Text("Welcome Vipin" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),) ),
                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                    child: Text(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla enim purus, finibus a commodo fermentum, semper non eros. Mauris a turpis dolor. Aenean facilisis purus mi, et consectetur urna condimentum vel.")),

                SizedBox(height: 20),

                ClipRRect(
                  borderRadius: new BorderRadius.circular(10.0),

                  child: Container(
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),

                        child: SizedBox(
                          height: 50,
                          width: 350,
                          child: RaisedButton(child: Text("Create my own workout plan"),
                            onPressed: (){

                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            splashColor: Colors.grey,

                          ),
                        ),
                      )

                ),
                ListTile(
                    leading: Text("Recommended for you"),
                    trailing: Text('View More'),

                ),

                Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                    height: 180.0,
                    child: ListView(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(

                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),

                            child: Image.network('https://img.maximummedia.ie/joe_co_uk/eyJkYXRhIjoie1widXJsXCI6XCJodHRwOlxcXC9cXFwvbWVkaWEtam9lY291ay5tYXhpbXVtbWVkaWEuaWUuczMuYW1hem9uYXdzLmNvbVxcXC93cC1jb250ZW50XFxcL3VwbG9hZHNcXFwvMjAxOVxcXC8wOFxcXC8wNTExMzg0NVxcXC9TY3JlZW5zaG90LTIwMTktMDgtMDUtYXQtMTEuMzguMjMucG5nXCIsXCJ3aWR0aFwiOjY0MCxcImhlaWdodFwiOjM2MCxcImRlZmF1bHRcIjpcImh0dHBzOlxcXC9cXFwvd3d3LmpvZS5jby51a1xcXC9hc3NldHNcXFwvaW1hZ2VzXFxcL2pvZWNvdWtcXFwvbm8taW1hZ2UucG5nP2lkPTBhODk3NjFkMGEzYzZmNTFmN2Q2XCIsXCJvcHRpb25zXCI6W119IiwiaGFzaCI6ImNkMDMxMzRjNjZjYjNhYzNkY2IzMGU3MTgxM2U1YmJkNTQ2OWZlZWQifQ==/screenshot-2019-08-05-at-11-38-23.png')),
                        SizedBox(width: 15.0),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Image.network('https://cdn.mos.cms.futurecdn.net/XLSscxW9r9FT2dG2FTWPTA-1366-80.jpg')),
                        SizedBox(width: 15.0),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Image.network('https://media.suara.com/pictures/653x366/2017/03/07/85046-ilustrasi-lelaki-sedang-nge-gym.jpg')),
                        SizedBox(width: 15.0),


                      ],
                    )),
              ],
            ),
          ),
        ),

    );
  }
}


/*
Container(
                     padding: EdgeInsets.fromLTRB(10, 250, 10, 10),
                    child:  ClipRRect(
                      borderRadius: new BorderRadius.circular(40.0),
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: RaisedButton(child: Text("Add Workout"),
                          onPressed: (){

                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          splashColor: Colors.grey,
                        ),
                      ),
                    )
                ),
 */