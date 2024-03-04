import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:idi_rabotai123/database/firebaseAuth/user_service.dart';
import 'package:idi_rabotai123/routes/routes.dart';
import 'package:idi_rabotai123/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDXeH2Y1cLDUu0NTwziq9Nco1tYF4JAQDs",
          appId: "1:1097676678341:android:a88a41b50ad2e88e23fcac",
          messagingSenderId: '1097676678341',
          projectId: 'flutter-job-8569b',
          storageBucket: 'flutter-job-8569b.appspot.com'));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().currentUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
