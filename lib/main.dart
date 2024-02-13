import 'package:flutter/material.dart';
import 'package:idi_rabotai123/routes/routes.dart';
import 'package:idi_rabotai123/themes.dart';

void main() {
  runApp(const MainApp());
}
asd
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
