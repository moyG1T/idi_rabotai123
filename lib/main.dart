import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:idi_rabotai123/routes/routes.dart';
import 'package:idi_rabotai123/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDXeH2Y1cLDUu0NTwziq9Nco1tYF4JAQDs",
          appId: appId,
          messagingSenderId: messagingSenderId,
          projectId: projectId));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      initialRoute: '/',
      routes: routes,
    );
  }
}
