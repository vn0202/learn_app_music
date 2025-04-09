import 'package:flutter/material.dart';
import 'package:music_app/pages/home.dart';
import 'package:music_app/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      themeMode: ThemeMode.system, // tự động chuyển theo hệ thống

      home: const HomePage(),
    );
  }
}
