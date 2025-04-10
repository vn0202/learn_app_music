import 'package:flutter/material.dart';
import 'package:music_app/components/song/item.dart';
import 'package:music_app/components/song/list_songs.dart';
import 'package:music_app/components/song/list_songs_vertical.dart';
import 'package:music_app/enums/song_item_layout.dart';
import 'package:music_app/pages/home/list_genre.dart';
import 'package:music_app/pages/home/list_genre_chip.dart';
import '../widgets/inc/appbar.dart';
import '../components/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "helo"),
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
              ListSongsVertical(),
              ListSongs(),
              ListSongsVertical(),

              // ListSongs(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewestSongs extends StatelessWidget {
  const NewestSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return SongItem(
      title: "As long as you love me",
      subtitle: "Backstreet Boy",
      imagePath: "https://picsum.photos/200/300",
      layout: SongItemLayout.verticalLarger,
    );
  }
}
