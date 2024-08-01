import 'package:ai_teacher/firebase_options.dart';
import 'package:ai_teacher/pages/answer_page.dart';
import 'package:ai_teacher/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AI Teacher",
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/answer_page': (context) => const AnswerPage(),
      },
    );
  }
}
