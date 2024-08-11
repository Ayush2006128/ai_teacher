import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SavedAnswersPage extends StatefulWidget {
  const SavedAnswersPage({super.key});

  @override
  State<SavedAnswersPage> createState() => _SavedAnswersPageState();
}

class _SavedAnswersPageState extends State<SavedAnswersPage> {
  final List _docIds = [];

  Future getSavedAnswers() async {
    // get saved answers from firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection("/answers").get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              setState(() {
                _docIds.add(document.reference.id);
              });
            },
          ),
        );
    return _docIds;
  }

  @override
  Widget build(BuildContext context) {
    print(_docIds[0]);
    return Center(
      child: _docIds.isNotEmpty
          ? const Text("Saved Answers")
          : Lottie.asset("assets/ghost_loading.json"),
    );
  }
}
