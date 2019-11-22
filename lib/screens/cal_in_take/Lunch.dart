import 'dart:convert';
import 'lunchdetails.dart';
import 'package:flutter/material.dart';

import 'package:ifitmash/components/CalBurnCircle.dart';


class Lunch extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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

  final lunch = ['daal','paneer','gobhi','bhindi','chicken korma','mutton','veg biryani','chicken biryani'
  'aloo','nutrie','paneer bhurji','kadhai paneer','matar paneer','mushroom','daal makhni','daal fry'
  ];


  var items = List<String>(

  );

  @override
  void initState() {
    items.addAll(lunch);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(lunch);
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
        items.addAll(lunch);
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
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
//import 'dart:async';
//import 'dart:convert';
//import 'dart:io';
//
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//
//import 'lunchdetails.dart';
//
//class MovieList extends StatelessWidget {
//  /// Method to get movies from the backend
//  Future<List<Movie>> getMovies() async {
//    final String url =
//        'http://api.themoviedb.org/3/movie/top_rated?api_key=9bc617f38b9d1d072ab43573f3b1d632';
//    var httpClient = new HttpClient();
//    try {
//      // Make the call
//      var request = await httpClient.getUrl(Uri.parse(url));
//      var response = await request.close();
//      if (response.statusCode == HttpStatus.ok) {
//        var json = await response.transform(utf8.decoder).join();
//        return createMovieList(json);
//      } else {
//        print("Failed http call.");
//      }
//    } catch (exception) {
//      print(exception.toString());
//    }
//    return null;
//  }
//
//  /// Method to parse information from the retrieved data
//  List<Movie> createMovieList(String resultString) {
//    List results = getResultsList(resultString);
//
//    List<Movie> list = new List();
//    for (int i = 0; i < results.length; i++) {
//      list.add(createMovieObject(results[i]));
//    }
//    return list;
//  }
//
//  /// Method to create a movie object.
//  Movie createMovieObject(objectItem) {
//    String title = objectItem["title"];
//    String posterPath = objectItem["poster_path"];
//    String backdropImage = objectItem["backdrop_path"];
//    String originalTitle = objectItem["original_title"];
//    double voteAverage = objectItem["vote_average"];
//    String overview = objectItem["overview"];
//    String releaseDate = objectItem["release_date"];
//
//    return new Movie(title, posterPath, backdropImage, originalTitle,
//        voteAverage, overview, releaseDate);
//  }
//
//  List getResultsList(String resultString) {
//    // Decode the json response
//    var data = json.decode(resultString);
//    // Get the result list
//    return data["results"];
//  }
//
//  List<Widget> createMovieCardItem(List<Movie> movies, BuildContext context) {
//    // Children list for the list.
//    List<Widget> listElementWidgetList = new List<Widget>();
//    if (movies != null) {
//      var lengthOfList = movies.length;
//      for (int i = 0; i < lengthOfList; i++) {
//        Movie movie = movies[i];
//        // Image URL
//        var imageURL = "https://image.tmdb.org/t/p/w500/" + movie.posterPath;
//        // List item created with an image of the poster
//        var listItem = new GridTile(
//            footer: new GestureDetector(
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      new MaterialPageRoute(
//                          builder: (BuildContext context) =>
//                          new MovieDetail(movie)));
//                },
//                child: new GridTileBar(
//                  backgroundColor: Colors.black45,
//                  title: new Text(movie.title),
//                )),
//            child: new GestureDetector(
//              onTap: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (BuildContext context) =>
//                        new MovieDetail(movie)));
//              },
//              child: new Image.network(imageURL, fit: BoxFit.cover),
//            ));
//        listElementWidgetList.add(listItem);
//      }
//    }
//    return listElementWidgetList;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new FutureBuilder(
//        future: getMovies(),
//        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//          if (!snapshot.hasData)
//            // Shows progress indicator until the data is load.
//            return new MaterialApp(
//                home: new Scaffold(
//                  body: new Center(
//                    child: new CircularProgressIndicator(),
//                  ),
//                ));
//          // Shows the real data with the data retrieved.
//          List movies = snapshot.data;
//          return new CustomScrollView(
//            primary: false,
//            slivers: <Widget>[
//              new SliverPadding(
//                padding: const EdgeInsets.all(10.0),
//                sliver: new SliverGrid.count(
//                  crossAxisSpacing: 10.0,
//                  mainAxisSpacing: 10.0,
//                  crossAxisCount: 2,
//                  children: createMovieCardItem(movies, context),
//                ),
//              ),
//            ],
//          );
//        });
//  }
