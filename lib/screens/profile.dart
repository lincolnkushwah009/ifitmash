import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(

      child: Column(children: [

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 200, 0),
          child: Text(
              "Profle",style: TextStyle(
            fontSize: 40
          ),),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 0),

          child: Container(
            height: 70,
            child: Card(
                color: Colors.white10,
                elevation: 0,
                margin: EdgeInsets.only(top: 0),
                child: ListTile(
                  leading:ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://i.pravatar.cc/100',
                      ),
                    ),
                  title: Text(
                    "John doe",
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    "johndoe@gmail.com",
                    style: TextStyle(color: Colors.grey),
                  ),

                )
            ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 220, 0),
          child: Container(
            child: Text("Activity goals"),
          ),
        ),

        Divider(
          height: 40
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: <Widget>[

              const Expanded(

                child: TextField(
                  decoration: InputDecoration(

                      labelText: 'Move Minutes',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,

                ),

              ),
              SizedBox(width: 10,),

              const Expanded(

                child: TextField(
                  decoration: InputDecoration(

                      labelText: 'Heart Points',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,

                ),

              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 230, 0),
          child: Container(
            child: Text("About You"),
          ),
        ),
        Divider(
            height: 40
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            children: <Widget>[

              const Expanded(

                  child: TextField(
                    decoration: InputDecoration(

                        labelText: 'Gender',
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.number,

                  ),

              ),
              SizedBox(width: 10,),

              const Expanded(

                child: TextField(
                  decoration: InputDecoration(

                      labelText: 'Birthday',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,

                ),

              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            children: <Widget>[

              const Expanded(

                child: TextField(
                  decoration: InputDecoration(

                      labelText: 'Weight',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,

                ),

              ),
              SizedBox(width: 10,),

              const Expanded(

                child: TextField(
                  decoration: InputDecoration(

                      labelText: 'Height',
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,

                ),

              )
            ],
          ),
        ),


      ]),

    );
  }
}


