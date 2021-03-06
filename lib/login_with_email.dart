import 'dart:convert';
import 'package:ifitmash/screens/Dashboard.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifitmash/screens/OTPverifacation.dart';
import 'package:ifitmash/screens/bottomNavigationBar.dart';

import 'package:ifitmash/screens/Login_With_Number.dart';
import 'package:dio/dio.dart';


import 'components/JsonUser.dart';


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
  bool showSpinner=false;

  final _formKey = GlobalKey<FormState>();

  static var uri = "https://staging.ifitmash.club/api";

  static BaseOptions options = BaseOptions(
      baseUrl: uri,
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
        return false;
      });
  static Dio dio = Dio(options);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailController = TextEditingController();


  bool isLoading = false;

  Future<dynamic> _loginUser(String input) async {
    try {
      Options options = Options(
//        contentType: ContentType.parse('application/json'),
      );

      Response response = await dio.post('/emaillogin',
          data: {"input": input},
          options: options);
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
      } else
        throw Exception('Authentication Error');
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
          exception.type == DioErrorType.CONNECT_TIMEOUT) {
        throw Exception(
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
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
//                        Color(0xFFEEEEEE),
                        Color(0xDD000000),
                        Color(0xDD000000)
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
                          onTap: () {
                            // Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginWithNumber()));
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => Dashboard()));

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

              Form(
                key: _formKey,
                child: Flexible(
                  child: Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              labelText: "Email",
                              labelStyle: new TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.grey)),
                              hintStyle: new TextStyle(
                                inherit: true,
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),

                            ),
                            onSaved: (String val) {},
                          ),
                        ),





                        Spacer(),

                        GestureDetector(

                          onTap: () async {

                            if (_formKey.currentState.validate()) {
                              setState(() => showSpinner = true);
                              var res = await _loginUser(
                                  _emailController.text);
                              setState(() => showSpinner = false);

                              JsonUser user = JsonUser.fromJson(res);

                              if (user != null) {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            Otp(email: user.input,)));
                                print(user);
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("incorrect email")));
                              }
                            }
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
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}