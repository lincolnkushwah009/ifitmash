import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'landscape.dart';
import 'profile.dart';

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
    Landscape(),
    Profile()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),


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
            icon: Icon(Icons.mail),
            title: Text('Messages'),
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