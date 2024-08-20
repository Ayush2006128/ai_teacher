import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lottie/lottie.dart';

class ViewAnswer extends StatefulWidget {
  const ViewAnswer({super.key});

  @override
  State<ViewAnswer> createState() => _ViewAnswerState();
}

class _ViewAnswerState extends State<ViewAnswer> {
  // get results from firestore
  Future getResults(id) async {
    final result =
        await FirebaseFirestore.instance.collection("/answers").doc(id).get();
    return result;
  }

  // delete results from firestore
  Future deleteResults(id) async {
    await FirebaseFirestore.instance.collection("/answers").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Answer Page'),
        actions: [
          IconButton(
              onPressed: () {
                deleteResults(id);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_rounded))
        ],
      ),
      body: Center(
          child: FutureBuilder(
        future: getResults(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(
                data: snapshot.data!.data()!["text"].toString(),
                selectable: true);
          } else {
            return Lottie.asset("assets/ghost_loading.json");
          }
        },
      )),
    );
  }
}
