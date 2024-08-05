// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class NavBar extends NavigationBar {
  final List<NavigationDestination> items;
  final int currentIndex;
  final void Function(int)? onTap;

  NavBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
  }) : super(
          destinations: items,
          onDestinationSelected: onTap,
        );

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      backgroundColor: Colors.white,
      destinations: items,
      onDestinationSelected: onTap,
    );
  }
}
