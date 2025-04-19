import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:music_app/core/hive/hive_ids.dart';
import 'package:music_app/models/lyric.dart';
import 'package:music_app/models/translation.dart';
import 'package:music_app/routes/route_names.dart';
part 'song.g.dart';

@HiveType(typeId: HiveIds.song)
class Song extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imagePath;
  @HiveField(3)
  final String singer;
  @HiveField(4)
  List? availableTranslations;
  @HiveField(5)
  Map<String, Translation>? tranlations;
  @HiveField(6)
  List<Lyric>? lyrics;
  Song({
    required this.name,
    required this.imagePath,
    required this.singer,
    required this.id,
    this.tranlations,
    this.availableTranslations,
    this.lyrics,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    Map<String, Translation> parsedTranslations = {};
    if (json['tranlations'] != null) {
      (json['tranlations'] as Map<String, dynamic>).forEach((key, value) {
        parsedTranslations[key] = Translation.fromJson(value);
      });
    }
    List<Lyric> parsedLyrics =
        (json['lyrics'] as List<dynamic>?)
            ?.map((item) => Lyric.fromJson(item as Map<String, dynamic>))
            .toList() ??
        [];
    return Song(
      id: json['id'].toString(),
      name: json['name'] ?? 'N/A',
      imagePath: json['imagePath'] ?? '',
      singer: json['singer'] ?? "N/A",
      tranlations: parsedTranslations,
      lyrics: parsedLyrics,
      availableTranslations: json['availableTranslations'] ?? [],
    );
  }

  void navigatorToSongDetailPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      RouteNames.songDetail,
      arguments: {'song': this},
    );
  }
}
