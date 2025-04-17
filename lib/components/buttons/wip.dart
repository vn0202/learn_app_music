import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Lyric {
  final String content;
  final int timestamp;

  Lyric({required this.content, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {'content': content, 'timestamp': timestamp};
  }

  static Lyric fromMap(Map<String, dynamic> map) {
    return Lyric(content: map['content'], timestamp: map['timestamp']);
  }
}

class Song {
  final String title;
  final String artist;
  final List<Lyric> lyrics;

  Song({required this.title, required this.artist, required this.lyrics});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'artist': artist,
      'lyrics': lyrics.map((lyric) => lyric.toMap()).toList(),
    };
  }

  static Song fromMap(Map<String, dynamic> map) {
    return Song(
      title: map['title'],
      artist: map['artist'],
      lyrics:
          (map['lyrics'] as List)
              .map((lyricMap) => Lyric.fromMap(lyricMap))
              .toList(),
    );
  }
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  await Hive.openBox<Map>('songBox');
}

Future<void> saveSong(Song song) async {
  final songBox = Hive.box<Map>('songBox');
  await songBox.add(song.toMap());
}
