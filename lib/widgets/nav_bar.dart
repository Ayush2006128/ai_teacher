// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class NavBar extends BottomNavigationBar {
  @override
  final List<BottomNavigationBarItem> items;
  @override
  final int currentIndex;
  @override
  final void Function(int)? onTap;

  NavBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
  }) : super(items: items, onTap: onTap);

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      showSelectedLabels: false,
      backgroundColor: Colors.white,
      items: items,
      onTap: onTap,
    );
  }
}
