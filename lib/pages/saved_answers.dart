import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SavedAnswersPage extends StatelessWidget {
  const SavedAnswersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/ghost_loading.json"),
    );
  }
}
