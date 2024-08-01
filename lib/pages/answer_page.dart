import 'package:ai_teacher/utils/answer_generation.dart';
import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/src/api.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  Future<GenerateContentResponse> response = getResults();

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
          child: FutureBuilder<GenerateContentResponse>(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(data: snapshot.data!.text ?? '');
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator(
            color: Colors.black,
          );
        },
      )),
    );
  }
}
