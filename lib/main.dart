import 'package:flutter/material.dart';
import 'package:music_app/pages/song/song_detail_page.dart';
import 'package:music_app/routes/route_names.dart';
import 'package:music_app/themes/app_theme.dart';
import 'package:music_app/routes/route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Learn',
      initialRoute: RouteNames.songDetail,
      onGenerateRoute: RouteConfig.generateRoute,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      home: SongDetailPage(), // tự động chuyển theo hệ thống
    );
  }
}
