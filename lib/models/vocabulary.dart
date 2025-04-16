import 'dart:convert';
import 'dart:math';

class Vocabulary {
  final String word;
  final String pronunciation;
  final String cefrLevel;
  final String partOfSpeech;
  final List<String> meaning;
  String get meaningString {
    return meaning.map((e) => "- $e").join("\n");
  }

  Vocabulary({
    required this.word,
    required this.pronunciation,
    required this.cefrLevel,
    required this.partOfSpeech,
    required this.meaning,
  });
  factory Vocabulary.fromJson(Map<String, dynamic> json) {
    return Vocabulary(
      word: json['word'] as String,
      pronunciation: json['pronunciation'] as String,
      cefrLevel: json['cefrLevel'] as String,
      partOfSpeech: json['partOfSpeech'] as String,

      meaning: List<String>.from(json['meaning']),
    );
  }
  static Future<List<Vocabulary>> fetchFromDatabase() async {
    // Simulating a delay as if fetching from a database
    await Future.delayed(Duration(seconds: 2));

    // Returning a fake list of Vocabulary objects
    return [
      Vocabulary(
        word: 'example',
        pronunciation: 'ɪɡˈzæmpəl',
        cefrLevel: 'B1',
        partOfSpeech: 'noun',
        meaning: [
          'a representative form or pattern',
          'something to be imitated',
        ],
      ),
      Vocabulary(
        word: 'flutter',
        pronunciation: 'ˈflʌtər',
        cefrLevel: 'A2',
        partOfSpeech: 'verb',
        meaning: [
          'to move quickly and lightly',
          'a framework for building apps',
        ],
      ),
      Vocabulary(
        word: 'flutter',
        pronunciation: 'ˈflʌtər',
        cefrLevel: 'A2',
        partOfSpeech: 'verb',
        meaning: [
          'to move quickly and lightly',
          'a framework for building apps',
        ],
      ),
      Vocabulary(
        word: 'flutter',
        pronunciation: 'ˈflʌtər',
        cefrLevel: 'A2',
        partOfSpeech: 'verb',
        meaning: [
          'to move quickly and lightly',
          'a framework for building apps',
        ],
      ),
      Vocabulary(
        word: 'flutter',
        pronunciation: 'ˈflʌtər',
        cefrLevel: 'A2',
        partOfSpeech: 'verb',
        meaning: [
          'to move quickly and lightly',
          'a framework for building apps',
        ],
      ),
      Vocabulary(
        word: 'flutter',
        pronunciation: 'ˈflʌtər',
        cefrLevel: 'A2',
        partOfSpeech: 'verb',
        meaning: [
          'to move quickly and lightly',
          'a framework for building apps',
        ],
      ),
      Vocabulary(
        word: 'flutter',
        pronunciation: 'ˈflʌtər',
        cefrLevel: 'A2',
        partOfSpeech: 'verb',
        meaning: [
          'to move quickly and lightly',
          'a framework for building apps',
        ],
      ),
      Vocabulary(
        word: 'flutter',
        pronunciation: 'ˈflʌtər',
        cefrLevel: 'A2',
        partOfSpeech: 'verb',
        meaning: [
          'to move quickly and lightly',
          'a framework for building apps',
        ],
      ),
    ];
  }
}
