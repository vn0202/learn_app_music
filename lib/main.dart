import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_app/models/lyric.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/models/translation.dart';
import 'package:music_app/providers/user_preferences.dart';
import 'package:music_app/routes/route_names.dart';
import 'package:music_app/themes/app_theme.dart';
import 'package:music_app/routes/route_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(SongAdapter())
    ..registerAdapter(TranslationAdapter())
    ..registerAdapter(LyricAdapter());
  await Hive.openBox("songBox");

  var box = Hive.box("songBox");
  await box.clear();
  final userPreferenceProvider = UserPreferencesProvider();

  runApp(
    ChangeNotifierProvider(
      create: (_) => userPreferenceProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Learn',
      initialRoute: RouteNames.profileSettings,
      onGenerateRoute: RouteConfig.generateRoute,
      theme: lightTheme,
      themeMode: ThemeMode.system,
    );
  }
}
