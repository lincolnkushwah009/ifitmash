import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class LunchDetails extends StatelessWidget {
  // Movie object to handle.


  // Constructor for the class.

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Lunch"),
        ),
        body: new ListView(
            children: <Widget>[
              new Image.asset("assets/image/lunch.jpg"),
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
                              "Lunch item",
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Code to create the view for release date.
                          new Text(
                            "Tasty food",
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
                  child: new Text("good quality food with delicious taste good quality food with delicious taste good quality food with delicious taste good quality food with delicious taste",
                    softWrap: true,
                  )
              )
            ]
        )
    );
  }
}
class Movie {

  String title;
  String posterPath;
  String backdropPath;
  String originalTitle;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie(this.title,
      this.posterPath,
      this.backdropPath,
      this.originalTitle,
      this.voteAverage,
      this.overview,
      this.releaseDate);
}
