import 'package:flutter/material.dart';

BottomNavigationBarItem buttomNavbarItem(
  final Widget navIcon,
  final String title,
) {
  return BottomNavigationBarItem(
    icon: navIcon,
    label: title,
  );
}
