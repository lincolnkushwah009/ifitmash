import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ExerciseDetail extends StatelessWidget {
  // Movie object to handle.


  // Constructor for the class.

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Exercises"),
        ),
        body: new ListView(
            children: <Widget>[
              new Image.asset("assets/image/gym.jpg"),
              new Container(
                padding: const EdgeInsets.all(32.0),
                child: new Row(
                  children: [
                    // First child in the Row for the name and the
                    // Release date information.
                    new Expanded(
                      // Name and Release date are in the same column
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Code to create the view for name.
                          new Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: new Text(
                              "exercises",
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Code to create the view for release date.
                          new Text(
                            "Think of your workouts as important meetings…",
                            style: new TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Icon to indicate the rating.
                    new Icon(
                      Icons.star,
                      color: Colors.red[500],
                    ),
                    new Icon(Icons.star),
                  ],
                ),
              ),
              new Container(
                  padding: const EdgeInsets.all(32.0),
                  child: new Text("Those who think they have not time for bodily exercise will sooner or later have to find time for illness.,Those who think they have not time for bodily exercise will sooner or later have to find time for illness.",
                    softWrap: true,
                  )
              )
            ]
        )
    );
  }
}