import 'package:flutter/material.dart';
import 'package:music_app/components/song/lyrics_section.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SongDetailPage extends StatefulWidget {
  const SongDetailPage({super.key});

  final String videoId = "kPa7bsKwL-c";

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage> {
  late YoutubePlayerController _controller;
  // ignore: prefer_typing_uninitialized_variables
  var currentLyricIndex;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
    _controller.addListener(videoListener);
    currentLyricIndex = 0;

    super.initState();
  }

  void videoListener() {
    if (_controller.value.isPlaying) {
      setState(() {
        currentLyricIndex = _controller.value.position.inSeconds;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          LyricsSection(),
        ],
      ),
    );
  }
}
