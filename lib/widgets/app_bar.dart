// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final Widget title;
  @override
  final Color? backgroundColor;
  @override
  final List<Widget> actions;

  MyAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    required this.actions,
  });

  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }
}
