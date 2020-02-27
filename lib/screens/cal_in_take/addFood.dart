import 'package:flutter/material.dart';


class addFood extends StatefulWidget {
  @override
  _addFoodState createState() => _addFoodState();
}

class _addFoodState extends State<addFood> {

  void _brand() {

    showDialog<Null>(


      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          content:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 500,
              width: 400,
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(

                children: <Widget>[
                  Container(
                    color: Colors.grey[500],
                    child: ListTile(
                      leading: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.clear, size: 30)),

                      title: Text("Add New Food",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text("Select Brand Type"),
                      trailing: Icon(Icons.check, size: 30) ,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: new BoxDecoration(color: Colors.grey[300]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Text("A Brand/off the shelf product",style: TextStyle(fontSize: 16),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("Product Brands"),
                      subtitle: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "E.G.: Kraft or Burger King"
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("Restaurants & Chains"),
                      subtitle: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "E.G.: Kraft or Burger King"
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("Supermarket Brands"),
                      subtitle: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "E.G.: Kraft or Burger King"
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: new BoxDecoration(color: Colors.grey[300]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Text("None of the above?",style: TextStyle(fontSize: 16),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("My Custom food entry"),

                    ),
                  ),

                ],
              ),
            ),
          ),
        );

      },
    );
  }

  void _Nutrition() {

    showDialog<Null>
      (barrierDismissible: false,

      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          content:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 500,
              width: 600,
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(

                children: <Widget>[
                  Container(
                    color: Colors.grey[500],
                    child: ListTile(
                      leading: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.clear, size: 30)),

                      title: Text("Add New Food",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text("Select Brand Type"),
                      trailing: Icon(Icons.check, size: 30) ,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("Calories"),
                      subtitle: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Calories (Kcal)"
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("Total Protein"),
                      subtitle: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Total Proteinr (g)"
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("Total Fat"),
                      subtitle: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Total Fat (g)"
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("Total Carbohydrate"),
                      subtitle: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Total Carbohydrate (g)"
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title:Text("Total Fiber"),
                      subtitle: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Total Fiber (g)"
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomSheet: Container(
        color: Colors.white,
        child: (
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            RaisedButton(
              onPressed: (){},
              color: Colors.white,
              child: Text("CANCEL"),
            ),
            RaisedButton(
              onPressed: (){},
              textColor: Colors.white,
              color: Colors.green,
              child: Text("SAVE"),
            ),
          ],
        )
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
         title: Text("Add New Food"),
      ),
      body:Container(
        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                width: double.infinity,
                decoration: new BoxDecoration(color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,0,0),
                  child: Text("Brand & Product Name",style: TextStyle(fontSize: 16),),
                ),
              ),
              Divider(height: 1,color: Colors.black,),
             GestureDetector(
               onTap: _brand,
               child: Card(
                 child: ListTile(
                   title:Text("Brand"),
                   subtitle: Text("Enter Brand Name"),
                 ),
               ),
             ),
              Card(
                child: ListTile(
                  title:Text("Product"),
                  subtitle: new TextField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Product",

                  ),
                ),
              ),
              ),
              Container(
                height: 30,
                width: double.infinity,
                decoration: new BoxDecoration(color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,0,0),
                  child: Text("Add/Edit Serving Info",style: TextStyle(fontSize: 16),),
                ),
              ),
              Divider(height: 1,color: Colors.black,),
              GestureDetector(
                onTap: _Nutrition,
                child: Card(
                  child: ListTile(
                    title:Text("Nutrition Facts"),
                    subtitle: Text("Enter Nutrition Information"),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: double.infinity,
                decoration: new BoxDecoration(color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,0,0),
                  child: Text("Add/Edit Tags",style: TextStyle(fontSize: 16),),
                ),
              ),
              Divider(height: 1,color: Colors.black,),
              Card(
                child: ListTile(
                  title: Text("Add/Edit Tags"),
                  subtitle: new TextField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Product",

                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: null,
                  ),
                ),
              ),



            ],
          ),
        ),
      )
      );
    
  }
}
