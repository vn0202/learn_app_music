import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/pages/home.dart';
import 'package:music_app/pages/song/song_detail_page.dart';
import 'package:music_app/routes/route_names.dart';

class RouteConfig {
  static Route<dynamic> generateRoute(RouteSettings route) {
    switch (route.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RouteNames.songDetail:
        final args = route.arguments as Map<String, dynamic>;
        final Song song = args['song'] as Song;

        return MaterialPageRoute(builder: (_) => SongDetailPage(song: song));

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
