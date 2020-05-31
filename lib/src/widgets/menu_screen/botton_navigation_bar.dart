import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:line_icons/line_icons.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onPositionChanged;

  MyBottomNavigationBar({this.currentIndex, this.onPositionChanged});

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar(
      style: SnakeBarStyle.floating,
      snakeShape: SnakeShape.circle,
      snakeColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      padding: EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
      currentIndex: currentIndex,
      onPositionChanged: onPositionChanged,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              LineIcons.pie_chart,
              size: 20,
            ),
            title: Text(
              'Stats',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              LineIcons.map,
              size: 20,
            ),
            title: Text(
              'Nearby',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              LineIcons.newspaper_o,
              size: 20,
            ),
            title: Text(
              'News',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              LineIcons.info_circle,
              size: 20,
            ),
            title: Text(
              'Info',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            )),
      ],
    );
  }
}
