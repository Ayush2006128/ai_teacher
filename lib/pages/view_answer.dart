import 'dart:io';

import 'package:ai_teacher/models/response_model.dart';
import 'package:ai_teacher/widgets/app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_native_html_to_pdf/flutter_native_html_to_pdf.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:path_provider/path_provider.dart';

class ViewAnswer extends StatefulWidget {
  const ViewAnswer({super.key});

  @override
  State<ViewAnswer> createState() => _ViewAnswerState();
}

class _ViewAnswerState extends State<ViewAnswer> {
  ResponseModel? responseModel;

  // get results from firestore
  Future getResults(id) async {
    final result =
        await FirebaseFirestore.instance.collection("/answers").doc(id).get();
    setState(() {
      responseModel = ResponseModel(text: result.data()!['text']);
    });
    return result;
  }

  // delete results from firestore
  Future deleteResults(id) async {
    await FirebaseFirestore.instance.collection("/answers").doc(id).delete();
  }

  Future<File?> saveAsPdf(String text, String id) async {
    // save as pdf
    final htmlContent = md.markdownToHtml(text);
    final flutterNativeHtmlToPdf =
        FlutterNativeHtmlToPdf(); // Create an instance

    final directory = await getApplicationDocumentsDirectory();
    final result = await flutterNativeHtmlToPdf.convertHtmlToPdf(
        html: htmlContent, targetDirectory: directory.path, targetName: id);
    return result;
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Answer Deleted'),
                ),
              );
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_rounded),
          ),
          IconButton(
              onPressed: () {
                saveAsPdf(responseModel!.text.toString(), id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Answer Downloaded'),
                  ),
                );
              },
              icon: const Icon(Icons.download_outlined)),
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
            return Lottie.asset("assets/bulb.json");
          }
        },
      )),
    );
  }
}
