class Lyric {
  final int timeMs;
  final int durationMs;
  final String content;
  final String translated;

  Lyric({
    required this.timeMs,
    required this.durationMs,
    required this.content,
    required this.translated,
  });

  factory Lyric.fromJson(Map<String, dynamic> json) {
    return Lyric(
      timeMs: json['timeMs'] as int,
      durationMs: json['durationMs'] as int,
      content: json['content'] as String,
      translated: json['translated'] as String,
    );
  }
  @override
  String toString() {
    return 'Lyric(timeMs: $timeMs, durationMs: $durationMs, content: $content, translated: $translated)';
  }
}
