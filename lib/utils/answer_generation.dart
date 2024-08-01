import 'dart:io';

import 'package:ai_teacher/services/gemini.dart';
import 'package:ai_teacher/utils/constant.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

List<XFile> imagePicked = [];

GenerateContentResponse? response;

Future<GenerateContentResponse> getResults() async {
  final apiKey = dotenv.get('API_KEY');
  ModelClass modelClass = ModelClass(
      GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey),
      Prompt,
      File(imagePicked[0].path));
  return await modelClass.generate();
}
