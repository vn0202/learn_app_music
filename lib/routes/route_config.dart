import 'package:flutter/material.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/pages/add_songs/add_song.dart';
import 'package:music_app/pages/author/sign_in.dart';
import 'package:music_app/pages/author/sign_up.dart';
import 'package:music_app/pages/genre/genre.dart';
import 'package:music_app/pages/home/home.dart';
import 'package:music_app/pages/song/song_detail_page.dart';
import 'package:music_app/pages/users/profile.dart';
import 'package:music_app/pages/users/profile_settings.dart';
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

      case RouteNames.genre:
        final args = route.arguments as Map<String, dynamic>;
        final Genre genre = args['genre'] as Genre;

        return MaterialPageRoute(builder: (_) => GenrePage(genre: genre));

      case RouteNames.add:
        return MaterialPageRoute(builder: (_) => AddSongPage());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => Profile());

      case RouteNames.profileSettings:
        return MaterialPageRoute(builder: (_) => ProfileSettings());

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
