import 'package:flutter/material.dart';
import 'package:music_app/components/song/list_songs.dart';
import 'package:music_app/components/song/list_songs_vertical.dart';
import 'package:music_app/pages/home/list_genre.dart';
import 'package:music_app/pages/home/list_genre_chip.dart';
import 'package:music_app/widgets/inc/footer.dart';
import '../widgets/inc/appbar.dart';
import '../components/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "helo"),
      bottomNavigationBar: Footer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              MyBanner(),
              SizedBox(height: 24),
              ListGenre(),

              ListGenreChip(),
              ListSongsVertical(title: "Newest Songs"),
              ListSongs(title: "Favorite Songs"),

              ListSongsVertical(title: "Top Viewed"),

              // ListSongs(),
            ],
          ),
        ),
      ),
    );
  }
}
