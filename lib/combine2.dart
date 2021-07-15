import 'package:flutter/material.dart';

import '../1.dart';
import '../2.dart';
import '../3.dart';

class NavigationBarController extends StatefulWidget {

  @override
  _NavigationBarControllerState createState() => _NavigationBarControllerState();
}

class _NavigationBarControllerState extends State<NavigationBarController> {

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



  int _selectedIndex = 0;



bool _isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width >= 1240;
}

bool _isMediumScreen(BuildContext context) {
  return MediaQuery.of(context).size.width >= 600;
}

  @override
  Widget build(BuildContext context) {

    if (_isLargeScreen(context)) {
      return Row(
        children: [
          Drawer(
            child: Column(
              children: [
                  ListTile(
                  title: Text("Home"),
                  ),
              ],
            ),
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Scaffold(
              body: pages[_selectedIndex],
            ),
          ),
        ],
      );
    }

    // Show a navigation rail
    if (_isMediumScreen(context)) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(

              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.directions_walk),
                  selectedIcon: Icon(Icons.directions_walk),
                  label: Text('Walk'),

                ),
                NavigationRailDestination(
                  icon: Icon(Icons.location_on),
                  selectedIcon: Icon(Icons.location_on),
                  label: Text('Location'),
                ),
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.grey[300],
            ),
            Expanded(
              child: pages[_selectedIndex],
            ),
          ],
        ),
      );
    }

    // Show a bottom app bar
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity), title: Text('Discover')),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded), title: Text('Calendar')),
        ],
      ),
          );
  }

}

