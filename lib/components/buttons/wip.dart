class Song {
  final String title;
  final String singer;
  final int viewCount;
  final Duration duration;
  final List<Translation> translations;

  Song({
    required this.title,
    required this.singer,
    required this.viewCount,
    required this.duration,
    required this.translations,
  });
}

class Translation {
  final String language;
  final List<Lyric> lyrics;

  Translation({required this.language, required this.lyrics});
}

class Lyric {
  final int timeMs;
  final int durationMs;
  final String content;

  Lyric({
    required this.timeMs,
    required this.durationMs,
    required this.content,
  });
}
