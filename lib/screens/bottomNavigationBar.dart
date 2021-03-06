import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'Workout.dart';
import 'profile.dart';
import 'package:ifitmash/screens/cal_in_take/BLDlist.dart';

class bottomNavigationBar  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _bottomNavigationBarState();
  }
}
class _bottomNavigationBarState extends State<bottomNavigationBar > {
  int _selectedPage = 0;
  final _pageOptions = [
    Dashboard(),
    BldList(),
    Workout(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/Icons/Dashboard.png",height: 30,width: 30,),
              title: Text('Dashboard',style: TextStyle(color: Colors.black)),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/Icons/apple.png",height: 30,width: 30),
              title: Text('Nutrition',style: TextStyle(color: Colors.black)),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/Icons/gym.png",height: 30,width: 30),
              title: Text('Workout',style: TextStyle(color: Colors.black)),
            ),
            BottomNavigationBarItem(
                icon: Image.asset("assets/Icons/user.png",height: 30,width: 30,),
                title: Text('Profile',style: TextStyle(color: Colors.black))
            )
          ],
        ),
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}