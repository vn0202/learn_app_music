class Lyric {
  final int timeMs;
  final int durationMs;
  final String content;
  final Map<String, String>? translations;

  Lyric({
    required this.timeMs,
    required this.durationMs,
    required this.content,
    this.translations,
  });

  int get timeInSeconds => (timeMs / 1000).round();
  factory Lyric.fromJson(Map<String, dynamic> json) {
    return Lyric(
      timeMs: json['timeMs'] as int,
      durationMs: json['durationMs'] as int,
      content: json['content'] as String,
      translations: Map<String, String>.from(json['translations']) ?? {},
    );
  }
  @override
  String toString() {
    return 'Lyric(timeMs: $timeMs, durationMs: $durationMs, content: $content,)';
  }
}
