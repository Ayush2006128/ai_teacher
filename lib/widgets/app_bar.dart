import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final Widget title;
  @override
  final Color? backgroundColor;
  @override
  final List<Widget> actions;

  MyAppBar({
    Key? key,
    required this.title,
    this.backgroundColor,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }
}
