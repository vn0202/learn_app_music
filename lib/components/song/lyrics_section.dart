import 'package:flutter/material.dart';
import 'package:music_app/models/lyric.dart';
import 'package:music_app/services/song_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class LyricsSection extends StatefulWidget {
  const LyricsSection({super.key});

  @override
  State<LyricsSection> createState() => _LyricsSectionState();
}

class _LyricsSectionState extends State<LyricsSection> {
  late Future<List<Lyric>> _lyricsFuture;

  @override
  void initState() {
    _lyricsFuture = SongServices.getLyrics(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _lyricsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
            decoration: BoxDecoration(color: AppColors.bgLyrics),
            height: 400,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder:
                  (context, index) =>
                      snapshot.hasData
                          ? GestureDetector(
                            onTap: () => {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].content),
                                  SizedBox(height: 12),
                                  Text(
                                    snapshot.data![index].translated,
                                    style: AppTextTheme
                                        .lightTextTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                  ),
                                  SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      snapshot.data![index].timeMs.toString(),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Container(height: 1, color: Colors.grey),
                                ],
                              ),
                            ),
                          )
                          : const Center(child: Text('No lyrics available')),
            ),
          );
        }
      },
    );
  }
}
