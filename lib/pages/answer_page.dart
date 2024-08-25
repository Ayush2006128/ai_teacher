import 'package:ai_teacher/models/response_model.dart';
import 'package:ai_teacher/utils/answer_generation.dart';
import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({super.key});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  // get result
  Future<GenerateContentResponse> response = getResults();

  // upload response to firebase storage
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  ResponseModel? responseModel;

  @override
  void initState() {
    super.initState();
    response.then((value) {
      setState(() {
        responseModel = ResponseModel(text: value.text ?? '');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('AI Teacher'),
        actions: [
          IconButton(
              onPressed: () async {
                // saving result in firebase
                await firestore
                    .collection("/answers")
                    .doc()
                    .set({"text": responseModel!.text.toString()});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Answer Saved'),
                  ),
                );
              },
              icon: const Icon(Icons.save_rounded))
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Center(
          child: FutureBuilder<GenerateContentResponse>(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              data: snapshot.data!.text ?? '',
              selectable: true,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Lottie.asset("assets/bulb.json");
        },
      )),
    );
  }
}
