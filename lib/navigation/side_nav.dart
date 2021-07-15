import 'package:flutter/material.dart';

import '../3.dart';
import '../1.dart';
import '../2.dart';

class SideRail extends StatefulWidget {
  @override
  State<SideRail> createState() => _SideRail();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SideRail extends State<SideRail> {

  int _selectedIndex = 0;

  var list = [

    CalendarMain(
      PageStorageKey('Page3'),
    ),
    Tabbar(
      PageStorageKey('Page2'),
    ),
    DiscoverMain(
      PageStorageKey('Page1'),
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Stack(
              children: <Widget>[
                list[_selectedIndex],
                Positioned(
                  top: 0,
                  left: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: NavigationRail(
                        selectedIndex: _selectedIndex,

                        onDestinationSelected: (int index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        labelType: NavigationRailLabelType.none,


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
                      ),
                    ),
                ),
              ],
            )),
      ),
    );
  }
}


