import 'package:flutter/material.dart';
import 'package:final_poject/pages/profile.dart';
import 'package:final_poject/pages/HomeScreen.dart';
import 'package:final_poject/pages/AboutApp.dart';

class Navigatornya extends StatefulWidget {
  @override
  State<Navigatornya> createState() => _Navigatornya();
}

class _Navigatornya extends State<Navigatornya> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(
      title: "Cook App",
    ),
    Aboutme(),
    AboutApp(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'About Me',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.touch_app),
              label: 'About App',
              backgroundColor: Colors.black),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      backgroundColor: Color.fromARGB(225, 54, 124, 225),
    );
  }
}
