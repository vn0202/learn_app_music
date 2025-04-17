import 'package:hive/hive.dart';
import 'package:music_app/core/hive/hive_ids.dart';
import 'package:music_app/models/lyric.dart';
part 'translation.g.dart';

@HiveType(typeId: HiveIds.translation)
class Translation extends HiveObject {
  @HiveField(0)
  final String language;
  @HiveField(1)
  final List<Lyric> lyrics;
  Translation({required this.language, required this.lyrics});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      language: json['language'],
      lyrics:
          (json['lyrics'] as List<dynamic>)
              .map((lyric) => Lyric.fromJson(lyric))
              .toList(),
    );
  }
}
