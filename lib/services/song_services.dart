import 'package:hive/hive.dart';
import 'package:music_app/models/lyric.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/models/translation.dart';

class SongServices {
  Future<List<Song>> fetchSongs() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final fakeJson = [
        {
          "id": 1,
          "videoId": "AWKUF7xhuIw",
          "name": "As long as you love me",
          "singer": "Backstreet Boy",
          "imagePath": "https://picsum.photos/200/300",
        },
        {
          "id": 2,
          "videoId": "kPa7bsKwL-c",
          "name": "25 minutes",
          "singer": "Michael To Learn Rock",
          "imagePath": "https://picsum.photos/200/300",
        },
        {
          "id": 3,
          "videoId": "kPa7bsKwL-c",
          "name": "Sugar",
          "singer": "Maroon 5",
          "imagePath": "https://picsum.photos/200/300",
        },
        {
          "id": 4,
          "videoId": "kPa7bsKwL-c",
          "name": "Perfect",
          "singer": "Ed Sheeran",
          "imagePath": "https://picsum.photos/200/300",
        },
        {
          "id": 5,
          "videoId": "kPa7bsKwL-c",
          "name": "As long as you love me",
          "singer": "Backstreet Boy",
          "imagePath": "https://picsum.photos/200/300",
        },
      ];

      return fakeJson.map((item) => Song.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<Song> getSong(int songId) async {
    var songBox = Hive.box("songBox");
    Song? song = songBox.get("song_$songId");
    if (song != null) {
      return song;
    }
    var listSongs = await fetchSongs();
    var songMatch = listSongs.firstWhere(
      (song) => song.id == songId.toString(),
      orElse: () => throw Exception("Song not found"),
    );
    songBox.put("song_$songId", songMatch);
    return songMatch;
  }

  static Future<List<Lyric>> getLyrics(Song _song) async {
    var songId = _song.id;
    var songBox = Hive.box("songBox");
    Song? song = songBox.get("song_$songId");
    if (song != null) {
      if (song.lyrics != null) {
        return song.lyrics!;
      }
    }
    song ??= _song;

    await Future.delayed(const Duration(seconds: 2));
    final fakeJson = [
      {
        "timeMs": 1000,
        "durationMs": 1000,
        "content": "If I have to live without you near me",
      },
      {
        "timeMs": 3000,
        "durationMs": 2000,
        "content": "The day  will all be empty",
      },
      {
        "timeMs": 5000,
        "durationMs": 3000,
        "content": "The night seems so long and lonely",
      },
      {
        "timeMs": 7000,
        "durationMs": 4000,
        "content": "With you I see forever so clearly",
      },
      {
        "timeMs": 8000,
        "durationMs": 3000,
        "content": "I might have been in love before",
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
      },
      {
        "timeMs": 12000,
        "durationMs": 4000,
        "content": "They will take us where we want to go",
      },
      {
        "timeMs": 13000,
        "durationMs": 4000,
        "content": "Hold me now",
        "translated": "Ôm tôi bây giờ",
      },
      {"timeMs": 14000, "durationMs": 4000, "content": "Touch me now"},
      {
        "timeMs": 15000,
        "durationMs": 4000,
        "content": "I don't want to live without you",
      },
      {
        "timeMs": 17000,
        "durationMs": 4000,
        "content": "Nothing's gonna change my love for you",
      },
      {
        "timeMs": 18000,
        "durationMs": 4000,
        "content": "You ought to know by now how much I love you",
      },
      {
        "timeMs": 20000,
        "durationMs": 4000,
        "content": "One thing you can be sure of",
      },
      {
        "timeMs": 22000,
        "durationMs": 4000,
        "content": "Nothing's gonna change my love for you",
      },
    ];

    var lyric = fakeJson.map((item) => Lyric.fromJson(item)).toList();
    song.lyrics = lyric;
    songBox.put("song_${song.id}", song);
    return lyric;
  }

  static Future<List<Lyric>> getTranslated(Song _song, String language) async {
    var songBox = Hive.box("songBox");
    var songId = _song.id;
    Song? song = songBox.get("song_$songId");
    if (song != null && song.tranlations != null) {
      var translation = song.tranlations!;
      if (translation[language] != null) {
        return translation[language]?.lyrics ?? [];
      }
    }
    song ??= _song;
    await Future.delayed(const Duration(seconds: 2));
    // get translated lyrics from remote and save it into songBox
    final fakeJsonVi = [
      {
        "timeMs": 1000,
        "durationMs": 1000,
        "content": "Nếu tôi phải sống mà không có bạn bên cạnh",
      },
      {
        "timeMs": 3000,
        "durationMs": 2000,
        "content": "Ngày đó sẽ trở nên trống rỗng",
      },
      {
        "timeMs": 5000,
        "durationMs": 3000,
        "content": "Đêm dường như dài và cô đơn",
      },
      {
        "timeMs": 7000,
        "durationMs": 4000,
        "content": "Với bạn, tôi thấy mãi mãi thật rõ ràng",
      },
      {
        "timeMs": 8000,
        "durationMs": 3000,
        "content": "Có lẽ tôi đã từng yêu trước đây",
      },
      {
        "timeMs": 9000,
        "durationMs": 4000,
        "content": "Nhưng chưa bao giờ cảm thấy mạnh mẽ như thế này",
      },
      {
        "timeMs": 10000,
        "durationMs": 3000,
        "content":
            "Những giấc mơ của chúng ta còn trẻ và cả hai chúng ta đều biết",
      },
      {
        "timeMs": 12000,
        "durationMs": 4000,
        "content": "Chúng sẽ đưa chúng ta đến nơi chúng ta muốn đến",
      },
      {"timeMs": 13000, "durationMs": 4000, "content": "Ôm tôi ngay bây giờ"},
      {
        "timeMs": 14000,
        "durationMs": 4000,
        "content": "Chạm vào tôi ngay bây giờ",
      },
      {
        "timeMs": 15000,
        "durationMs": 4000,
        "content": "Tôi không muốn sống mà không có bạn",
      },
      {
        "timeMs": 17000,
        "durationMs": 4000,
        "content": "Không gì có thể thay đổi tình yêu của tôi dành cho bạn",
      },
      {
        "timeMs": 18000,
        "durationMs": 4000,
        "content": "Bạn nên biết bây giờ tôi yêu bạn nhiều như thế nào",
      },
      {
        "timeMs": 20000,
        "durationMs": 4000,
        "content": "Một điều bạn có thể chắc chắn",
      },
      {
        "timeMs": 22000,
        "durationMs": 4000,
        "content": "Không gì có thể thay đổi tình yêu của tôi dành cho bạn",
      },
    ];
    final fakeJsonKo = [
      {"timeMs": 1000, "durationMs": 1000, "content": "당신이 내 곁에 없으면 살아야 한다면"},
      {"timeMs": 3000, "durationMs": 2000, "content": "그날은 텅 비게 될 것입니다"},
      {"timeMs": 5000, "durationMs": 3000, "content": "밤이 너무 길고 외로워 보입니다"},
      {
        "timeMs": 7000,
        "durationMs": 4000,
        "content": "당신과 함께라면 영원을 너무나도 분명히 볼 수 있습니다",
      },
      {"timeMs": 8000, "durationMs": 3000, "content": "아마도 나는 전에 사랑에 빠졌을 것입니다"},
      {
        "timeMs": 9000,
        "durationMs": 4000,
        "content": "하지만 이렇게 강렬하게 느껴본 적은 없습니다",
      },
      {
        "timeMs": 10000,
        "durationMs": 3000,
        "content": "우리의 꿈은 아직 젊고 우리 둘 다 알고 있습니다",
      },
      {
        "timeMs": 12000,
        "durationMs": 4000,
        "content": "그것들은 우리가 가고 싶은 곳으로 우리를 데려갈 것입니다",
      },
      {"timeMs": 13000, "durationMs": 4000, "content": "지금 나를 안아주세요"},
      {"timeMs": 14000, "durationMs": 4000, "content": "지금 나를 만져주세요"},
      {"timeMs": 15000, "durationMs": 4000, "content": "나는 당신 없이 살고 싶지 않습니다"},
      {
        "timeMs": 17000,
        "durationMs": 4000,
        "content": "내가 당신을 얼마나 사랑하는지 이제 알았으면 좋겠습니다",
      },
      {
        "timeMs": 18000,
        "durationMs": 4000,
        "content": "당신을 향한 내 사랑은 변하지 않을 것입니다",
      },
      {"timeMs": 20000, "durationMs": 4000, "content": "당신이 확신할 수 있는 한 가지"},
      {
        "timeMs": 22000,
        "durationMs": 4000,
        "content": "당신을 향한 내 사랑은 변하지 않을 것입니다",
      },
    ];

    final fakeJsonJapanese = [
      {"timeMs": 1000, "durationMs": 1000, "content": "あなたがそばにいないと生きていけないなら"},
      {"timeMs": 3000, "durationMs": 2000, "content": "その日は空っぽになるでしょう"},
      {"timeMs": 5000, "durationMs": 3000, "content": "夜はとても長くて孤独に感じます"},
      {"timeMs": 7000, "durationMs": 4000, "content": "あなたと一緒にいると永遠がはっきりと見えます"},
      {"timeMs": 8000, "durationMs": 3000, "content": "以前に恋をしたことがあるかもしれません"},
      {"timeMs": 9000, "durationMs": 4000, "content": "でもこんなに強く感じたことはありません"},
      {
        "timeMs": 10000,
        "durationMs": 3000,
        "content": "私たちの夢はまだ若く、私たち二人とも知っています",
      },
      {
        "timeMs": 12000,
        "durationMs": 4000,
        "content": "それらは私たちが行きたい場所に連れて行ってくれるでしょう",
      },
      {"timeMs": 13000, "durationMs": 4000, "content": "今すぐ私を抱きしめてください"},
      {"timeMs": 14000, "durationMs": 4000, "content": "今すぐ私に触れてください"},
      {"timeMs": 15000, "durationMs": 4000, "content": "あなたなしでは生きたくありません"},
      {"timeMs": 17000, "durationMs": 4000, "content": "あなたへの私の愛は変わりません"},
      {
        "timeMs": 18000,
        "durationMs": 4000,
        "content": "今、私がどれだけあなたを愛しているか知ってほしい",
      },
      {"timeMs": 20000, "durationMs": 4000, "content": "あなたが確信できる唯一のこと"},
      {"timeMs": 22000, "durationMs": 4000, "content": "あなたへの私の愛は変わりません"},
    ];

    var fakeJson = switch (language) {
      "vi" => fakeJsonVi,
      "ko" => fakeJsonKo,
      "ja" => fakeJsonJapanese,

      _ => fakeJsonJapanese,
    };
    var translatedLyric = Translation.fromJson({
      "language": language,
      "lyrics": fakeJson,
    });

    song.tranlations?[language] = translatedLyric;
    songBox.put("song_${song.id}", song);

    return translatedLyric.lyrics;
  }

  static Future<List<Lyric>> getLyricsV2(int songId) async {
    await Future.delayed(const Duration(seconds: 2));
    final fakeJson = [
      {
        "timeMs": 1000,
        "durationMs": 1000,
        "content": "If I have to live without you near me",
        "translations": {
          "fr": "Si je dois vivre sans toi près de moi",
          "zh": "如果我必须没有你在我身边生活",
          "ja": "あなたがそばにいないと生きていけないなら",
          "ko": "당신이 내 곁에 없으면 살아야 한다면",
        },
      },
      {
        "timeMs": 3000,
        "durationMs": 2000,
        "content": "The day will all be empty",
        "translations": {
          "fr": "La journée sera vide",
          "zh": "这一天将是空虚的",
          "ja": "その日は空っぽになるでしょう",
          "ko": "그날은 텅 비게 될 것입니다",
        },
      },
      {
        "timeMs": 5000,
        "durationMs": 3000,
        "content": "The night seems so long and lonely",
        "translations": {
          "fr": "La nuit semble si longue et solitaire",
          "zh": "夜晚显得如此漫长和孤独",
          "ja": "夜はとても長くて孤独に感じます",
          "ko": "밤이 너무 길고 외로워 보입니다",
        },
      },
      {
        "timeMs": 7000,
        "durationMs": 4000,
        "content": "With you I see forever so clearly",
        "translations": {
          "fr": "Avec toi, je vois l'éternité si clairement",
          "zh": "和你在一起，我看到了如此清晰的永恒",
          "ja": "あなたと一緒にいると永遠がはっきりと見えます",
          "ko": "당신과 함께라면 영원을 너무나도 분명히 볼 수 있습니다",
        },
      },
    ];

    return fakeJson.map((json) => Lyric.fromJson(json)).toList();
  }
}
