import 'package:flutter/material.dart';

class Nutrition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child:Center(

        child: Column(



          children: <Widget>[
            SizedBox(height: 20),
            Container(child: Text("Assigned Nutrition"),),

            SizedBox(height: 100),
            Divider(color: Colors.grey),

            Container(
              child:  ClipRRect(
                borderRadius: new BorderRadius.circular(40.0),
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: RaisedButton(child: Text("Add Nutrition"),
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
