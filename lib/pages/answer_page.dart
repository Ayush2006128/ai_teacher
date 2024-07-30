import 'package:ai_teacher/utils/answer_generation.dart';
import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: const Text('AI Teacher'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_left_rounded))
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: response != null
              ? Markdown(data: response!.text ?? '')
              : const CircularProgressIndicator(
                  color: Colors.black,
                ),
        ));
  }
}
