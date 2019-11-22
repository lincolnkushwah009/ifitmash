import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'Nutrition.dart';
import 'profile.dart';
import 'Workout.dart';

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
    Nutrition(),
    Workout(),
    Profile()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Nutrition'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            title: Text('Workout'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}