import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

        child: Center(
          child: Column(

            children: <Widget>[


              SizedBox(height: 20),
              Container(child: Text("Assigned Workout"),),

              SizedBox(height: 200),
              Divider(color: Colors.grey),

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
            ],
          ),
        ),

    );
  }
}
