import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

class ModelClass {
  final GenerativeModel model;
  final String? prompt;
  final File? image;
  ModelClass(this.model, this.prompt, this.image);

  Future<GenerateContentResponse> generate() async {
    return await model.generateContent(Content.multi([
      TextPart(prompt ?? ''),
      DataPart('image/png', image!.readAsBytesSync()),
    ]) as Iterable<Content>);
  }
}
