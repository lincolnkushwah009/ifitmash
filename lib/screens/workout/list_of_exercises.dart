import 'dart:convert';
import 'dart:math';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/material.dart';
import 'exerciseDetails.dart';
import 'package:ifitmash/components/home_fragment_service.dart';
import 'package:ifitmash/components/AppConfig.dart';
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
  List<dynamic> notList = new List();
  bool loading = true;
  var items = List<String>();
  @override
  @protected
  @mustCallSuper
  void initState() {
    items.addAll(exercises);
    SchedulerBinding.instance.addPostFrameCallback((_) => loadData());
  }

  loadData() {
    loadOfferData();
  }


  void loadOfferData() async {
    var url = AppConfig.apiUrl + AppConfig.workout;
    Map<String, String> headers = {};
    Map<String, String> body = {
      'search_value': '650'
    };
    var data = await homeservice.getProductLoadData(url, headers, body, context);
    print(data);
    Map<String, dynamic> _data = json.decode(data);
    // notList = _data['logs'];
    print("workout data");
    print(notList);
    setState(()
    {
      if(_data['data'] != null)
        notList = _data['data'];
      loading = false;
    });
  }


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
                  itemCount: items.length,
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
                                      new ExerciseDetail()));
                            },
                            title: Text('${items[index]}'),
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

