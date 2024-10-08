import 'package:ai_teacher/pages/saved_answers.dart';
import 'package:ai_teacher/utils/answer_generation.dart';
import 'package:ai_teacher/widgets/add_image.dart';
import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:ai_teacher/widgets/image_widget.dart';
import 'package:ai_teacher/widgets/nav_bar.dart';
import 'package:ai_teacher/widgets/prompt_image_container.dart';
import 'package:ai_teacher/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [
    const HomePage(),
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
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              selectedIcon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.book,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.book_outlined,
                color: Colors.black,
              ),
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
  Future<void> _addImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        imagePicked.add(pickedImage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PromptImageContainer(
              imagePicked: imagePicked
                  .map((xFile) => ImageWidget(imagePicked: imagePicked))
                  .toList(),
              imgPicker: AddImage(onTap: _addImage),
              width: 0.8,
              height: 0.5,
            ),
          ),
          const SizedBox(height: 10),
          SubmitButton(
            isDisabled: imagePicked.isEmpty,
          ),
        ],
      ),
    );
  }
}
