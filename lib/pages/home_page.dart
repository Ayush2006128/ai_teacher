import 'dart:io';

import 'package:ai_teacher/pages/saved_answers.dart';
import 'package:ai_teacher/services/gemini.dart';
import 'package:ai_teacher/widgets/add_image.dart';
import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:ai_teacher/widgets/nav_bar.dart';
import 'package:ai_teacher/widgets/prompt_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
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

  Future<void> _addImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePicked.add(pickedImage);
      });
    }
  }

  Future<void> _getResults() async {
    final apiKey = dotenv.get('API_KEY');
    ModelClass modelClass = ModelClass(
        GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey),
        "explain this problem.",
        File(imagePicked[0].path));

    final response = await modelClass.generate();
    print(response.text);
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
              imagePicked: imagePicked,
              imgPicker: AddImage(onTap: _addImage),
              width: 0.8,
              height: 0.5,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _getResults,
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black),
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
