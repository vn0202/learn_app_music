import 'package:flutter/material.dart';
import 'package:music_app/components/song/item.dart';
import 'package:music_app/enums/song_item_layout.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/services/song_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class ListSongs extends StatefulWidget {
  final String title;
  final SongServices songServices = SongServices();
  ListSongs({super.key, required this.title});

  @override
  State<ListSongs> createState() => _ListSongsState();
}

class _ListSongsState extends State<ListSongs> {
  late Future<List<Song>> _futureSongs;

  @override
  void initState() {
    super.initState();
    _futureSongs = SongServices().fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    return FutureBuilder(
      future: _futureSongs,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No songs found.'));
        }
        for (var song in snapshot.data!) {
          children.add(
            SongItem(song: song, layout: SongItemLayout.verticalLarger),
          );
        }
        return Container(
          margin: EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 24, 0, 12),

                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(spacing: 12, children: children),
              ),
            ],
          ),
        );
      },
    );
  }
}
