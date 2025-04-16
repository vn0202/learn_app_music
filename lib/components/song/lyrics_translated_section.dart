import 'package:flutter/material.dart';
import 'package:music_app/models/lyric.dart';
import 'package:music_app/services/song_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class LyricTranslatedSection extends StatefulWidget {
  const LyricTranslatedSection({super.key});

  @override
  State<LyricTranslatedSection> createState() => _LyricTranslatedSectionState();
}

class _LyricTranslatedSectionState extends State<LyricTranslatedSection> {
  late Future<List<Lyric>> _lyricsFuture;
  int? selectedIndex;

  @override
  void initState() {
    _lyricsFuture = SongServices.getLyrics(10);
    super.initState();
    // Initialize the lyricsFuture with a method to fetch lyrics
    // lyricsFuture = SongServices.getLyrics(10);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _lyricsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: const EdgeInsets.all(24),

          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lyrics",
                style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "[English]",
                      style: AppTextTheme.lightTextTheme.titleSmall!.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "[Vietnamese]",
                      style: AppTextTheme.lightTextTheme.titleSmall!.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                padding: const EdgeInsets.only(top: 12),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final isSelectedIndex = selectedIndex == index;
                  final textColor =
                      isSelectedIndex
                          ? AppColors.primary
                          : AppColors.textPrimary;

                  return Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Text(
                              snapshot.data![index].content,
                              style: AppTextTheme.lightTextTheme.titleSmall!
                                  .copyWith(color: textColor),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Text(
                              snapshot.data![index].translated,
                              style: AppTextTheme.lightTextTheme.titleSmall!
                                  .copyWith(color: textColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
