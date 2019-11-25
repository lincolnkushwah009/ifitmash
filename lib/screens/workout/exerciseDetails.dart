import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:ifitmash/components/graph.dart';

class ExerciseDetail extends StatefulWidget {
  // Movie object to handle.
  @override
  _ExerciseDetailState createState() => _ExerciseDetailState();
}
class _ExerciseDetailState extends State<ExerciseDetail> {
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  // Constructor for the class.
  var sets = [
    "1",
    "2",
    "3",
    "4"
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(


        appBar: new AppBar(

          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: new Text("Exercises",style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: Colors.white,
        ),
        body: new ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),

                child: ClipRRect(
                    borderRadius: new BorderRadius.circular(10.0),
                    child: new Image.asset("assets/image/gym.jpg")),
              ),
              new Container(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: new Row(
                  children: [
                    // First child in the Row for the name and the
                    // Release date information.
                    new Expanded(
                      // Name and Release date are in the same column
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: new BorderRadius.circular(10.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(16.0),
                                      child: DropDownFormField(
                                        titleText: 'Enter no. of sets',
                                        hintText: 'Please choose one',
                                        value: _myActivity,
                                        onSaved: (value) {
                                          setState(() {
                                            _myActivity = value;
                                          });
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _myActivity = value;
                                          });
                                        },
                                        dataSource: [
                                          {
                                            "display": "1",
                                            "value": "Running",
                                          },
                                          {
                                            "display": "2",
                                            "value": "Climbing",
                                          },
                                          {
                                            "display": "3",
                                            "value": "Walking",
                                          },
                                          {
                                            "display": "4",
                                            "value": "Swimming",
                                          },

                                        ],
                                        textField: 'display',
                                        valueField: 'value',
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: RaisedButton(
                                        child: Text('GO'),
                                        onPressed: (){
                                          Navigator.push(context, new MaterialPageRoute(builder: (context) => Nutrition()));
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Text(_myActivityResult),
                                    )
                                  ],
                                ),
                              )
                            ),
                          ),
                        SizedBox(
                          height: 20,
                        ),

                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xDD000000),
                                      Color(0xDD000000)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50)
                                  )
                              ),
                              child: Center(
                                child: Text('GO'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ]
        )
    );
  }
}