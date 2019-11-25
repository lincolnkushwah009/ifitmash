import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifitmash/screens/Login_With_Number.dart';
import 'screens/bottomNavigationBar .dart';



class LoginWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: EmailLogin(),
    );
  }
}

class EmailLogin extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _EmailLoginState();
  }
}

class _EmailLoginState extends State<EmailLogin> {


  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFEEEEEE),
                      Color(0xFF424242)
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('assets/image/logo.png'),
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 32,
                          right: 32
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,new MaterialPageRoute(builder: (context)=>LoginWithNumber()));
                        },
                        child: Text('Login With Number',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4,left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.email,
                            color: Colors.grey,
                          ),
                          hintText: 'Email',
                        ),
                      ),
                    ),


                    Spacer(),

                    InkWell(
                      onTap: (){
                        Navigator.push(context,new MaterialPageRoute(builder: (context)=>bottomNavigationBar()));
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width/1.2,
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
                          child: Text('Send OTP'.toUpperCase(),
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
            )

          ],
        ),
      ),
    );
  }
}
