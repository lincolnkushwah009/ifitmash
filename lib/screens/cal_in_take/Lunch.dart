
import 'lunchdetails.dart';
import 'package:flutter/material.dart';



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
