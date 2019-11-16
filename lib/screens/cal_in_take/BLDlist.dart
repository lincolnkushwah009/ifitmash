import 'package:flutter/material.dart';
import 'package:ifitmash/screens/cal_in_take/Breakfast.dart';
import 'package:ifitmash/screens/cal_in_take/Dinner.dart';
import 'package:ifitmash/screens/cal_in_take/EveningSnack.dart';
import 'package:ifitmash/screens/cal_in_take/Lunch.dart';
import 'package:ifitmash/screens/cal_in_take/Morning_Snack.dart';

class BldList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children:  <Widget>[

          Card(

            child: InkWell(
              onTap: () {
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>Breakfast()));

                print('Breakfast');
              },
              child: ListTile(
                title: Text('Breakfast'),
                subtitle: Text('0 of 244 Cal'),
                trailing: Icon(Icons.more_horiz,color: Colors.blueAccent,),
              ),
            ),
          ),
          Card(

            child: InkWell(
              onTap: () {
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>MorningSnack()));

                print('Morning Snack');
              },
              child: ListTile(
                title: Text('Morning Snack'),
                subtitle: Text('0 of 244 Cal'),
                trailing: InkWell(

                    child: Icon(Icons.more_horiz,color: Colors.blueAccent,)),
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
                title: Text('Lunch'),
                subtitle: Text('0 of 599 Cal'),
                trailing: Icon(Icons.more_horiz,color: Colors.blueAccent,),
              ),
            ),
          ),
          Card(

            child: InkWell(
              onTap: () {
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>EveningSnack()));

                print('Evening Snack');
              },
              child: ListTile(
                title: Text('Evening Snack'),
                subtitle: Text('0 of 244 Cal'),
                trailing: Icon(Icons.more_horiz,color: Colors.blueAccent,),
              ),
            ),
          ),
          Card(

            child: InkWell(
              onTap: () {
                Navigator.push(context,new MaterialPageRoute(builder: (context)=>Dinner()));

                print('Dinner');
              },
              child: ListTile(
                title: Text('Dinner'),
                subtitle: Text('0 of 599 Cal'),
                trailing: Icon(Icons.more_horiz,color: Colors.blueAccent,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

