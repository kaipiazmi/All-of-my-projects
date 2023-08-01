import 'package:flutter/material.dart';
import 'package:kos_kosan/pages/Home_Screen.dart';
import 'package:kos_kosan/pages/Setting_Screen.dart';
import 'package:kos_kosan/pages/Bookmark.dart';

class Navigatornya extends StatefulWidget {
  @override
  State<Navigatornya> createState() => _Navigatornya();
}

class _Navigatornya extends State<Navigatornya> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    BookmarkScreen(),
    SettingScreen(),
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
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          iconSize: 23,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'Penanda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Pengaturan',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color.fromARGB(255, 35, 111, 224),
          unselectedItemColor: Color.fromARGB(255, 59, 54, 98),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
