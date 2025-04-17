import 'package:flutter/material.dart';
import 'package:music_app/components/buttons/game_button.dart';
import 'package:music_app/components/report.dart';
import 'package:music_app/components/song/lyrics_player_section.dart';
import 'package:music_app/components/user_like_reaction.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/models/vocabulary/vocabularies_section.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:music_app/widgets/inc/footer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailPage extends StatefulWidget {
  final Song song;
  const SongDetailPage({super.key, required this.song});

  final String videoId = "kPa7bsKwL-c";

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  late YoutubePlayerController _controller;
  late Song song = widget.song;
  String? _selectedLanguage;

  Future<void> _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString("user_selected_language") ?? "ko";
    });
  }

  Future<void> _saveSelectedLanguage(String? language) async {
    final prefs = await SharedPreferences.getInstance();
    if (language != null) {
      await prefs.setString("user_selected_language", language);
    } else {
      await prefs.remove("user_selected_language");
    }
  }

  int? currentLyricIndex;
  @override
  void initState() {
    _loadSelectedLanguage();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
    currentLyricIndex = 0;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<Map<String, String?>> translatedLanguages = [
    {"language_code": null, "label": "Off", 'flag': ''},

    {
      "language_code": "en",
      "label": "English",
      "flag": "assets/images/flags/american.png",
    },
    {
      "language_code": "vi",
      "label": "Vietnamese",
      "flag": "assets/images/flags/vietname.png",
    },
    {
      "language_code": "ja",
      "label": "Japanese",
      "flag": "assets/images/flags/japan.png",
    },
    {
      "language_code": "ko",
      "label": "Korean",
      "flag": "assets/images/flags/south_korea.webp",
    },
  ];
  // ignore: prefer_typing_uninitialized_variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Footer(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 450,
              decoration: BoxDecoration(color: AppColors.bgLyrics),
              child: Column(
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: AppColors.primary,
                    progressColors: const ProgressBarColors(
                      playedColor: AppColors.primary,
                      handleColor: AppColors.primary,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      child: Column(
                        children: [
                          LyricsPlayerSection(
                            videoPlayerController: _controller,
                            selectedLanguage: _selectedLanguage,
                            song: song,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Row(
                    spacing: 4,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: DropdownButton(
                          value: _selectedLanguage,
                          underline: Container(),
                          items:
                              translatedLanguages.map((lang) {
                                return DropdownMenuItem(
                                  value: lang['language_code'],
                                  child: Row(
                                    children: [
                                      (lang['flag'] != ""
                                          ? Image.asset(
                                            lang['flag']!,
                                            width: 24,
                                            height: 24,
                                          )
                                          : SizedBox()),
                                      const SizedBox(width: 8),
                                      Text(lang['label']!),
                                    ],
                                  ),
                                );
                              }).toList(),

                          onChanged: (value) {
                            setState(() {
                              _selectedLanguage = value;
                            });
                            _saveSelectedLanguage(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  UserLikeReaction(videoId: "10"),

                  ReportVideo(showText: true, videoId: "10"),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.name,
                    style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      SizedBox(width: 100, child: Text("Singer")),
                      Text(song.singer),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      SizedBox(width: 100, child: Text("Album")),
                      Text("MLTR"),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      SizedBox(width: 100, child: Text("Viewed")),
                      Text("123,456,789"),
                    ],
                  ),
                  SizedBox(height: 24),

                  Text(
                    "Learn this song",
                    style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      GameButton(
                        borderColor: Color.fromARGB(255, 69, 162, 18),
                        text: Text(
                          "Quiz",
                          style: AppTextTheme.lightTextTheme.titleMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                        icon: Icon(Icons.quiz, color: Colors.white, size: 24),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 69, 162, 18),
                            Color.fromARGB(255, 20, 105, 56),
                          ],
                        ),
                      ),
                      GameButton(
                        borderColor: Color.fromARGB(255, 117, 181, 241),
                        text: Text(
                          "Writing",
                          style: AppTextTheme.lightTextTheme.titleMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                        icon: Icon(Icons.edit, color: Colors.white, size: 24),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 117, 181, 241),
                            Color.fromARGB(255, 70, 86, 204),
                          ],
                        ),
                      ),
                      GameButton(
                        borderColor: Color.fromARGB(255, 212, 227, 124),
                        text: Text(
                          "Translation",
                          style: AppTextTheme.lightTextTheme.titleMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                        icon: Icon(
                          Icons.translate,
                          color: Colors.white,
                          size: 24,
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 212, 227, 124),
                            Color.fromARGB(255, 125, 126, 99),
                          ],
                        ),
                      ),
                      GameButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: false,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                child: VocabulariesSection(),
                              );
                            },
                          );
                        },

                        borderColor: Color.fromARGB(255, 190, 115, 220),
                        text: Text(
                          "Vocabulary",
                          style: AppTextTheme.lightTextTheme.titleMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                        icon: Icon(
                          Icons.book_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 190, 115, 220),
                            Color.fromARGB(255, 173, 68, 179),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
