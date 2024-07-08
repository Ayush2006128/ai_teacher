import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavBar extends BottomNavigationBar {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  @override
  final void Function(int)? onTap;

  NavBar({
    Key? key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
  }) : super(key: key, items: items, onTap: onTap);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: items,
      onTap: onTap,
    );
  }
}
