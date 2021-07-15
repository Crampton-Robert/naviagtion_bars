import 'package:flutter/material.dart';
import 'package:naviagtion_bars/navigation/side_nav.dart';
import 'bottom_nav.dart';

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var selectedValue;
  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, orientation) {
         if (MediaQuery
             .of(context).size.width > 600) {

           return SideRail();


         } else {


        return BottomNavigationBarController();

         }
       }
    );
  }
}
