import 'package:flutter/material.dart';
import 'package:ifitmash/screens/cal_in_take/Lunch.dart';

class BldList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children:  <Widget>[

          Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 25),
              height: 180.0,
              child: ListView(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15,60,10,5),
                    child: Text(
                      '1 Days Sprint',
                      style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,

                      ),
                    ),
                    height: 130.0,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                        image: DecorationImage(
                            image: new NetworkImage(
                                "https://www.holidify.com/blog/wp-content/uploads/2016/09/32e0e0c315e456df4459a7244b09a113.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(width: 15.0),

                  Container(
                    padding: EdgeInsets.fromLTRB(5,60,10,5),
                    child: Text(
                      '2 Days Sprint',
                      style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    height: 190.0,
                    width:200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                        image: DecorationImage(
                            image: new NetworkImage(
                                "https://www.kent.co.in/blog/wp-content/uploads/2017/08/UltimateVeggiePlatter1.jpg"),
                            fit: BoxFit.fill)),
                  ),

                  SizedBox(width: 15.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(5,60,10,5),
                    child: Text(
                      '3 Days Sprint',
                      style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    height: 190.0,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                        image: DecorationImage(
                            image: new NetworkImage(
                                "https://img1.exportersindia.com/product_images/bc-full/dir_126/3751763/south-indian-food-1495910817-2204324.jpeg"),
                            fit: BoxFit.fill)),
                  ),

                ],
              )),

          Card(

            child: InkWell(

              child: ListTile(
                leading: Icon(Icons.add_circle,color: Colors.black),
                title: Text('Breakfast'),
                trailing: Text("0")
              ),
            ),
          ),
          Card(

            child: InkWell(
              onTap: () {
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>Lunch()));

                print('Morning Snack');
              },
              child: ListTile(
                leading: Icon(Icons.add_circle,color: Colors.black),
                title: Text('Morning Snack'),
                trailing: Text("0")
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>Lunch()));

                print('Lunch');
              },
              child: ListTile(
                leading: Icon(Icons.add_circle,color: Colors.black),
                title: Text('Lunch'),
                trailing:  Text('0'),
              ),
            ),
          ),

          Card(

            child: InkWell(
              onTap: () {
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>Lunch()));
                print('Dinner');
              },
              child: ListTile(
                leading: Icon(Icons.add_circle,color: Colors.black),
                title: Text('Dinner'),
                trailing: Text("0"),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>Lunch()));
                print('Evening Snack');
              },
              child: ListTile(
                leading: Icon(Icons.add_circle,color: Colors.black),
                title: Text('Snack/Others'),
                trailing: Text("0"),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

