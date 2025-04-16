import 'package:flutter/material.dart';
import 'package:music_app/models/lyric.dart';
import 'package:music_app/services/song_services.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LyricsPlayerSection extends StatefulWidget {
  final YoutubePlayerController? videoPlayerController;
  const LyricsPlayerSection({super.key, required this.videoPlayerController});

  @override
  State<LyricsPlayerSection> createState() => _LyricsPlayerSectionState();
}

class _LyricsPlayerSectionState extends State<LyricsPlayerSection> {
  late List<Lyric> lyricsFuture;
  late Future<void> initializeVideoPlayerFuture;
  late ScrollController _scrollController;

  YoutubePlayerController? _controller;
  int? _currentLyricIndex;
  @override
  void initState() {
    initializeVideoPlayerFuture = _initFutureState();
    _controller = widget.videoPlayerController;
    _controller!.addListener(videoListener);
    _scrollController = ScrollController();
    super.initState();
  }

  Future<void> _initFutureState() async {
    lyricsFuture = await SongServices.getLyrics(10);
  }

  @override
  void dispose() {
    _controller?.removeListener(videoListener);
    _scrollController.dispose();
    super.dispose();
  }

  void videoListener() {
    var currentLyricIndex =
        _currentLyricIndex == null ? 0 : _currentLyricIndex!;
    if (_controller!.value.isPlaying) {
      if (_controller!.value.position.inSeconds >
              lyricsFuture[currentLyricIndex].timeInSeconds &&
          currentLyricIndex < lyricsFuture.length) {
        setState(() {
          if (_currentLyricIndex == null) {
            _currentLyricIndex = 0;
          } else {
            _currentLyricIndex = _currentLyricIndex! + 1;
            _scrollController.animateTo(
              _currentLyricIndex! * 61.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          }
        });
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
                itemCount: lyricsFuture.length,
                controller: _scrollController,

                itemBuilder:
                    (context, index) =>
                        lyricsFuture.isNotEmpty
                            ? GestureDetector(
                              onTap:
                                  () => {
                                    setState(() {
                                      _currentLyricIndex = index;
                                    }),
                                    _controller!.seekTo(
                                      Duration(
                                        milliseconds:
                                            lyricsFuture[index].timeMs,
                                      ),
                                    ),
                                    _scrollController.animateTo(
                                      _currentLyricIndex! * 61.0,
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
                                      lyricsFuture[index].content,
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
                                      lyricsFuture[index].translated,
                                      style: AppTextTheme
                                          .lightTextTheme
                                          .titleSmall!
                                          .copyWith(
                                            color:
                                                _currentLyricIndex == index
                                                    ? AppColors.primary
                                                    : Colors.white,
                                            fontSize: 12,
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
