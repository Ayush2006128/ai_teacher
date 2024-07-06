import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: const Text('AI Teacher'),
          actions: const [],
          backgroundColor: Colors.transparent),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
