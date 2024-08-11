import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final Widget child;
  const MyListView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }
}
