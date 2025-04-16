import 'package:music_app/models/lyric.dart';
import 'package:music_app/models/song.dart';

class SongServices {
  Future<List<Song>> fetchSongs() async {
    await Future.delayed(Duration(seconds: 2));
    final fakeJson = [
      {
        "id": 1,
        "name": "As long as you love me",
        "singer": "Backstreet Boy",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 2,
        "name": "25 minutes",
        "singer": "Michael To Learn Rock",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 0,
        "name": "Sugar",
        "singer": "Maroon 5",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 1,
        "name": "Perfect",
        "singer": "Ed Sheeran",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 2,
        "name": "As long as you love me",
        "singer": "Backstreet Boy",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 3,
        "name": "My love",
        "singer": "Michael To Learn Rock",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 4,
        "name": "That why you go away",
        "singer": "Maroon 5",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 5,
        "name": "Die with your smile",
        "singer": "Ed Sheeran",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 6,
        "name": "Stronger",
        "singer": "Backstreet Boy",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 7,
        "name": "Impossible",
        "singer": "Michael To Learn Rock",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 8,
        "name": "Sugar",
        "singer": "Maroon 5",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 9,
        "name": "Perfect",
        "singer": "Ed Sheeran",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 10,
        "name": "As long as you love me",
        "singer": "Backstreet Boy",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 11,
        "name": "25 minutes",
        "singer": "Michael To Learn Rock",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 12,
        "name": "Sugar",
        "singer": "Maroon 5",
        "imagePath": "https://picsum.photos/200/300",
      },
      {
        "id": 13,
        "name": "Perfect",
        "singer": "Ed Sheeran",
        "imagePath": "https://picsum.photos/200/300",
      },
    ];

    return fakeJson.map((item) => Song.fromJson(item)).toList();
  }

  static Future<List<Lyric>> getLyrics(int songId) async {
    await Future.delayed(const Duration(seconds: 2));
    final fakeJson = [
      {
        "timeMs": 1000,
        "durationMs": 1000,
        "content": "If I have to live without you near me",
        "translated": "Nếu tôi phải sống mà không có bạn",
      },
      {
        "timeMs": 3000,
        "durationMs": 2000,
        "content": "The day  will all be empty",
        "translated": "Ngày mà tất cả sẽ trống rỗng",
      },
      {
        "timeMs": 5000,
        "durationMs": 3000,
        "content": "The night seems so long and lonely",
        "translated": "Đêm dài dường như cô đơn",
      },
      {
        "timeMs": 7000,
        "durationMs": 4000,
        "content": "With you I see forever so clearly",
        "translated": "Với bạn, tôi thấy mãi mãi rõ ràng",
      },
      {
        "timeMs": 8000,
        "durationMs": 3000,
        "content": "I might have been in love before",
        "translated": "Tôi có thể đã yêu trước đây",
      },
      {
        "timeMs": 9000,
        "durationMs": 4000,
        "content": "But it never felt this strong",
        "translated": "Nhưng nó chưa bao giờ cảm thấy mạnh mẽ như thế này",
      },
      {
        "timeMs": 10000,
        "durationMs": 3000,
        "content": "Our dreams are young and we both know",
        "translated": "Giấc mơ của chúng ta còn trẻ và chúng ta đều biết",
      },
      {
        "timeMs": 12000,
        "durationMs": 4000,
        "content": "They will take us where we want to go",
        "translated": "Chúng sẽ đưa chúng ta đến nơi chúng ta muốn đi",
      },
      {
        "timeMs": 13000,
        "durationMs": 4000,
        "content": "Hold me now",
        "translated": "Ôm tôi bây giờ",
      },
      {
        "timeMs": 14000,
        "durationMs": 4000,
        "content": "Touch me now",
        "translated": "Chạm vào tôi bây giờ",
      },
      {
        "timeMs": 15000,
        "durationMs": 4000,
        "content": "I don't want to live without you",
        "translated": "Tôi không muốn sống mà không có bạn",
      },
      {
        "timeMs": 17000,
        "durationMs": 4000,
        "content": "Nothing's gonna change my love for you",
        "translated": "Không có gì thay đổi tình yêu của tôi dành cho bạn",
      },
      {
        "timeMs": 18000,
        "durationMs": 4000,
        "content": "You ought to know by now how much I love you",
        "translated": "Bạn nên biết bây giờ tôi yêu bạn nhiều như thế nào",
      },
      {
        "timeMs": 20000,
        "durationMs": 4000,
        "content": "One thing you can be sure of",
        "translated": "Một điều bạn có thể chắc chắn",
      },
      {
        "timeMs": 22000,
        "durationMs": 4000,
        "content": "Nothing's gonna change my love for you",
        "translated": "Không có gì thay đổi tình yêu của tôi dành cho bạn",
      },
    ];

    return fakeJson.map((item) => Lyric.fromJson(item)).toList();
  }

  static Future<List<Lyric>> getLyricsBySongId(int songId) async {
    await Future.delayed(const Duration(seconds: 2));
    final fakeJson = [
      {"timeMs": 1000, "durationMs": 1000, "content": "Lời bài hát 1"},
      {"timeMs": 3000, "durationMs": 2000, "content": "Lời bài hát 2"},
    ];

    return fakeJson.map((item) => Lyric.fromJson(item)).toList();
  }

  static Future<List<Lyric>> getLyricsBySongIdAndLanguage(
    int songId,
    String language,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    final fakeJson = [
      {
        "timeMs": 1000,
        "durationMs": 1000,
        "content": "Lời bài hát 1",
        "translated": "Lời dịch 1",
      },
      {
        "timeMs": 3000,
        "durationMs": 2000,
        "content": "Lời bài hát 2",
        "translated": "Lời dịch 2",
      },
    ];

    return fakeJson.map((item) => Lyric.fromJson(item)).toList();
  }
}
