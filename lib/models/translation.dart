import 'package:music_app/models/lyric.dart';

class Translation {
  final String language;
  final List<Lyric> lyrics;
  Translation({required this.language, required this.lyrics});
}
