import 'package:flutter/material.dart';

import '../1.dart';
import '../2.dart';
import '../3.dart';

class BottomNavigationBarController extends StatefulWidget {

  @override
  _BottomNavigationBarControllerState createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState extends State<BottomNavigationBarController> {

  final List<Widget> pages = [

    CalendarMain(
       PageStorageKey('Page3'),
    ),
    Tabbar(
      PageStorageKey('Page2'),
    ),
    DiscoverMain(PageStorageKey('Page1'),
    ),

  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(
          icon: Icon(Icons.local_activity), title: Text('Discover')),
      BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_rounded), title: Text('Calendar')),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}

