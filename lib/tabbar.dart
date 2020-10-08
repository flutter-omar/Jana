import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:janaapp/homescreen.dart';

import 'myorder.dart';
import 'personalpage.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _currentIndex = 1;

  void _onTabChanged(int index) => this.setState(() => _currentIndex = index);
  List<Widget> _tabWidgets = [PersonalPage(), HomeScreen(), Myorder()];
  final _selectedBgColor =  Color(0xBBBBD242);
  final _unselectedBgColor = Colors.white;
  final _selectedItemColor = Colors.white;
  final _unselectedItemColor = Colors.black;
  Color _getBgColor(int index) =>
      _currentIndex == index ? _selectedBgColor : _unselectedBgColor;
  Color _getItemColor(int index) =>
      _currentIndex == index ? _selectedItemColor : _unselectedItemColor;
  Widget _buildIcon(IconData iconData, String text, int index) => Container(
    width:double.infinity,
    height: kBottomNavigationBarHeight,
    child: Material(
      color: _getBgColor(index),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData,color: _getItemColor(index),),
            Text(text,
                style: TextStyle(fontSize: 12, color: _getItemColor(index))),
          ],
        ),
        onTap: () => _onTabChanged(index),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _tabWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: (index) => this._onTabChanged(index),
        items: [
           BottomNavigationBarItem(
              icon:  _buildIcon(Icons.person_outline,"صفحتي الشخصية",0),
              title: SizedBox.shrink(),),
          new BottomNavigationBarItem(
              icon: _buildIcon(
                Icons.home,
                  "الرئيسية",1
              ),
              title:SizedBox.shrink()),
          new BottomNavigationBarItem(

              icon: _buildIcon(Icons.inbox, "طلباتي",2),
              title: SizedBox.shrink()),
        ],
      ),
    );
  }
}
