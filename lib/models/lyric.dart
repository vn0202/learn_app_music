import 'package:hive/hive.dart';
import 'package:music_app/core/hive/hive_ids.dart';
part 'lyric.g.dart';

@HiveType(typeId: HiveIds.lyric)
class Lyric extends HiveObject {
  @HiveField(0)
  final int timeMs;
  @HiveField(1)
  final int durationMs;
  @HiveField(2)
  final String content;

  Lyric({
    required this.timeMs,
    required this.durationMs,
    required this.content,
  });

  int get timeInSeconds => (timeMs / 1000).round();
  factory Lyric.fromJson(Map<String, dynamic> json) {
    return Lyric(
      timeMs: json['timeMs'] as int,
      durationMs: json['durationMs'] as int,
      content: json['content'] as String,
    );
  }
  @override
  String toString() {
    return 'Lyric(timeMs: $timeMs, durationMs: $durationMs, content: $content,)';
  }
}
