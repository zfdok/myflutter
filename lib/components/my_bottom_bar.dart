import 'package:flutter/material.dart';
 
class MyBottomBar extends BottomNavigationBarItem{
  MyBottomBar(String name,Icon icon,Icon activeIcon):super(
    icon: icon,
    activeIcon:activeIcon,
    title:Text(name)
  );
}