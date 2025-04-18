import 'package:flutter/material.dart';
import 'package:music_app/models/lyric.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/services/song_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LyricsPlayerSection extends StatefulWidget {
  final YoutubePlayerController? videoPlayerController;
  final Song song;
  final String? selectedLanguage;
  const LyricsPlayerSection({
    super.key,
    required this.videoPlayerController,
    required this.song,
    this.selectedLanguage,
  });

  @override
  State<LyricsPlayerSection> createState() => _LyricsPlayerSectionState();
}

class _LyricsPlayerSectionState extends State<LyricsPlayerSection> {
  List<Lyric>? lyricsFuture;
  List<Lyric>? lyricsTranslatedFuture;
  late Future<void> initializeVideoPlayerFuture;
  late ScrollController _scrollController;
  bool isEnd = false;

  YoutubePlayerController? _controller;
  int _currentLyricIndex = -1;

  @override
  void didUpdateWidget(covariant LyricsPlayerSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedLanguage != oldWidget.selectedLanguage) {
      _updateTranslatedLyric(widget.selectedLanguage);
    }
  }

  Future<void> _updateTranslatedLyric(String? language) async {
    if (language != null) {
      final translated = await SongServices.getTranslated(
        widget.song,
        language,
      );
      setState(() {
        lyricsTranslatedFuture = translated;
      });
    } else {
      setState(() {
        lyricsTranslatedFuture = [];
      });
    }
  }

  @override
  void initState() {
    initializeVideoPlayerFuture = _initFutureState();
    _controller = widget.videoPlayerController;
    _controller!.addListener(videoListener);
    _scrollController = ScrollController();
    super.initState();
  }

  Future<void> _initFutureState() async {
    try {
      lyricsFuture = await SongServices.getLyrics(widget.song);
      if (widget.selectedLanguage != null) {
        lyricsTranslatedFuture = await SongServices.getTranslated(
          widget.song,
          widget.selectedLanguage!,
        );
      } else {
        lyricsTranslatedFuture = [];
      }
    } catch (e) {
      lyricsFuture = [];
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(videoListener);
    _scrollController.dispose();
    super.dispose();
  }

  void videoListener() {
    final currentTimeMs = _controller!.value.position.inMilliseconds;
    final PlayerState playerState = _controller!.value.playerState;
    if (playerState == PlayerState.ended) {
      isEnd = true;
    }
    if (playerState == PlayerState.playing && isEnd == true) {
      setState(() {
        _currentLyricIndex = -1;
        isEnd = false;
      });
    }
    if (currentTimeMs < lyricsFuture![0].timeMs) {
      return;
    }
    if (_currentLyricIndex == -1) {
      setState(() {
        _currentLyricIndex = 0;
      });
    }

    if (_controller!.value.isPlaying) {
      for (var i = _currentLyricIndex + 1; i < lyricsFuture!.length; i++) {
        if (currentTimeMs >= lyricsFuture![i].timeMs) {
          if (i != _currentLyricIndex) {
            setState(() {
              _currentLyricIndex = i;
            });
            _scrollController.animateTo(
              _currentLyricIndex * 70.5,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          }
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Expanded(
            child: SizedBox(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: lyricsFuture?.length,
                controller: _scrollController,

                itemBuilder:
                    (context, index) =>
                        lyricsFuture!.isNotEmpty
                            ? GestureDetector(
                              onTap:
                                  () => {
                                    setState(() {
                                      _currentLyricIndex = index;
                                    }),
                                    _controller!.seekTo(
                                      Duration(
                                        milliseconds:
                                            lyricsFuture![index].timeMs,
                                      ),
                                    ),
                                    _scrollController.animateTo(
                                      _currentLyricIndex! * 70.5,
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      curve: Curves.easeInOut,
                                    ),
                                  },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color:
                                          _currentLyricIndex == index
                                              ? AppColors.primary
                                              : AppColors.borderLyric,
                                      width: 0.5,
                                    ),
                                  ),
                                  color:
                                      _currentLyricIndex == index
                                          ? AppColors.background
                                          : AppColors.bgLyrics,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 12,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      lyricsFuture![index].content,
                                      style: AppTextTheme
                                          .lightTextTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,

                                            color:
                                                _currentLyricIndex == index
                                                    ? AppColors.primary
                                                    : Colors.white,
                                            fontSize: 16,
                                          ),
                                    ),
                                    SizedBox(height: 6),

                                    Text(
                                      lyricsTranslatedFuture?.elementAtOrNull(
                                                index,
                                              ) !=
                                              null
                                          ? lyricsTranslatedFuture
                                                  ?.elementAtOrNull(index)!
                                                  .content ??
                                              ""
                                          : "",
                                      style: AppTextTheme
                                          .lightTextTheme
                                          .titleSmall!
                                          .copyWith(
                                            color:
                                                _currentLyricIndex == index
                                                    ? AppColors.primary
                                                    : Colors.white,
                                            fontSize: 16,
                                          ),
                                    ),
                                    SizedBox(height: 6),
                                  ],
                                ),
                              ),
                            )
                            : const Center(child: Text('No lyrics available')),
              ),
            ),
          );
        }
      },
    );
  }
}
