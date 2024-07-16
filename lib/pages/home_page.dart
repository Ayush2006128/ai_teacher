import 'package:ai_teacher/pages/saved_answers.dart';
import 'package:ai_teacher/widgets/add_image.dart';
import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:ai_teacher/widgets/image_widget.dart';
import 'package:ai_teacher/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [
    HomePage(),
    const SavedAnswersPage(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: const Text('AI Teacher'),
          actions: const [],
          backgroundColor: Colors.transparent),
      bottomNavigationBar: NavBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Saved Answers',
            ),
          ]),
      body: _pages[_selectedIndex],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<XFile> imagePicked = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          AddImage(
            onTap: _addImage,
          ),
          ImageWidget(
            imagePicked: imagePicked,
          ),
        ],
      ),
    );
  }

  Future<void> _addImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePicked.add(pickedFile);
      });
    }
  }
}
