import 'package:flutter/material.dart';
import 'package:weather_app/aboutapp.dart';
import 'package:weather_app/homescreen.dart';
import 'package:weather_app/location.dart';

class Navigatornya extends StatefulWidget {
  @override
  State<Navigatornya> createState() => _Navigatornya();
}

class _Navigatornya extends State<Navigatornya> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    locationw(),
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
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(60, 71, 100, 1.0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          iconSize: 23,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_rounded),
              label: 'Medan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_rounded),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_rounded),
              label: 'About App',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Color.fromRGBO(135, 206, 235, 1.0),
          backgroundColor: Colors.transparent,
        ),
      ),
      backgroundColor: Color.fromRGBO(18, 29, 59, 1.0),
    );
  }
}
