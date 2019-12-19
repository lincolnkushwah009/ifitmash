import 'package:ifitmash/input_page/input_page_styles.dart';
import 'package:ifitmash/screens/bottomNavigationBar.dart';
import 'package:ifitmash/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BmiAppBar extends StatefulWidget {
  @override
  @override
  _BmiAppBarState createState() => _BmiAppBarState();
}
const String sKey = 'myBool';
class _BmiAppBarState extends State<BmiAppBar> {
  SharedPreferences sharedPreferences;
  String userData;
  String email;
  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      userData = sharedPreferences.getString('user_name');
      email = sharedPreferences.getString('email');
      print(userData);
      // will be null if never previously saved
      if (userData == null) {
        userData = "";
        persist(userData); // set an initial value
      }
      setState(() {});
    });
  }

  void persist(String value) {
    setState(() {
      userData = value;
    });
    sharedPreferences?.setString(sKey, value);
  }
//  final bool isInputPage;
  static const String wavingHandEmoji = "\uD83D\uDC4B";
  static const String whiteSkinTone = "\uD83C\uDFFB";

//   const BmiAppBar({Key key, this.isInputPage = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        height: appBarHeight(context),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(screenAwareSize(16.0, context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLabel(context),
              _buildIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildIcon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenAwareSize(11.0, context)),

      child: InkWell(
        onTap: (){
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => bottomNavigationBar()));
        },
        child: SvgPicture.asset(
          'images/user.svg',
          height: screenAwareSize(25.0, context),
          width: screenAwareSize(25.0, context),
        ),
      ),
    );
  }

  RichText _buildLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(fontSize: 34.0),
        children: [
          TextSpan(
            text: "Hi "+'${userData }'  " Your BMI",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
//          TextSpan(text: isInputPage ? getEmoji(context) : ""),
        ],
      ),
    );
  }

  String getEmoji(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? wavingHandEmoji
        : wavingHandEmoji + whiteSkinTone;
  }
}
