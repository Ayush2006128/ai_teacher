import 'package:ai_teacher/widgets/list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SavedAnswersPage extends StatefulWidget {
  const SavedAnswersPage({super.key});

  @override
  State<SavedAnswersPage> createState() => _SavedAnswersPageState();
}

class _SavedAnswersPageState extends State<SavedAnswersPage> {
  final List<String> _docIds = [];

  Future getSavedAnswers() async {
    // get saved answers from firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection("/answers").get().then(
      (snapshot) {
        for (var document in snapshot.docs) {
          setState(() {
            _docIds.add(document.reference.id);
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getSavedAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _docIds.isNotEmpty
          ? MyListView(
              child: Text(_docIds[0]),
            )
          : Lottie.asset("assets/ghost_loading.json"),
    );
  }
}
