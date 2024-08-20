import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final List<Widget> children;
  const MyListView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) {
        return children[index];
      },
    );
  }
}
