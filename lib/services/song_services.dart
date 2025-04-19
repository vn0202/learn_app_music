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
          "videoId": "XAciTafsV8w",
          "name": "As long as you love me",
          "singer": "Backstreet Boy",
          "imagePath": "https://picsum.photos/200/300",
        },
        {
          "id": 2,
          "videoId": "XAciTafsV8w",
          "name": "25 minutes",
          "singer": "Michael To Learn Rock",
          "imagePath": "https://picsum.photos/200/300",
        },
        {
          "id": 3,
          "videoId": "XAciTafsV8w",
          "name": "Sugar",
          "singer": "Maroon 5",
          "imagePath": "https://picsum.photos/200/300",
        },
        {
          "id": 4,
          "videoId": "XAciTafsV8w",
          "name": "Perfect",
          "singer": "Ed Sheeran",
          "imagePath": "https://picsum.photos/200/300",
        },
        {
          "id": 5,
          "videoId": "XAciTafsV8w",
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

  Future<List<Song>> suggestionSong(String value) async {
    final allSongs = await fetchSongs();

    return allSongs.where((song) {
      return song.name.toLowerCase().contains(value);
    }).toList();
  }

  Future<Song?> getSong(songId) async {
    var songBox = Hive.box("songBox");
    Song? song = songBox.get("song_$songId");
    if (song != null) {
      return song;
    }
    var listSongs = await fetchSongs();
    return listSongs.first;
    // try {
    //   var songMatch = listSongs.firstWhere(
    //     (song) => song.id == songId.toString(),
    //     orElse: () => throw Exception("Song not found"),
    //   );
    //   songBox.put("song_$songId", songMatch);
    //   return songMatch;
    // } catch (e) {
    //   return null;
    // }
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
        "timeMs": 1380,
        "durationMs": 7150,
        "content": "2 a.m. and the rain is falling",
      },
      {
        "timeMs": 8530,
        "durationMs": 7060,
        "content": "Here we are at the crossroads once again",
      },
      {
        "timeMs": 15590,
        "durationMs": 4470,
        "content": "You're telling me you're so confused",
      },
      {
        "timeMs": 20060,
        "durationMs": 3470,
        "content": "You can't make up your mind",
      },
      {"timeMs": 23530, "durationMs": 4240, "content": "Is this meant to be?"},
      {"timeMs": 27770, "durationMs": 3200, "content": "You're asking me"},
      {"timeMs": 30970, "durationMs": 5080, "content": "But only love can say"},
      {
        "timeMs": 36050,
        "durationMs": 4010,
        "content": "Try again or walk away",
      },
      {
        "timeMs": 40060,
        "durationMs": 3810,
        "content": "But I believe for you and me",
      },
      {
        "timeMs": 43870,
        "durationMs": 2890,
        "content": "The sun will shine one day",
      },
      {
        "timeMs": 46760,
        "durationMs": 4810,
        "content": "So I'll just play my part",
      },
      {
        "timeMs": 51570,
        "durationMs": 4050,
        "content": "Pray you'll have a change of heart",
      },
      {
        "timeMs": 55620,
        "durationMs": 4070,
        "content": "But I can't make you see it through",
      },
      {
        "timeMs": 59690,
        "durationMs": 11940,
        "content": "That's something only love can do",
      },
      {
        "timeMs": 71630,
        "durationMs": 8020,
        "content": "In your arms as the dawn is breaking",
      },
      {
        "timeMs": 79650,
        "durationMs": 7190,
        "content": "Face to face and a thousand miles apart",
      },
      {
        "timeMs": 86840,
        "durationMs": 4250,
        "content": "I've tried my best to make you see",
      },
      {
        "timeMs": 91090,
        "durationMs": 3740,
        "content": "There's hope beyond the pain",
      },
      {
        "timeMs": 94830,
        "durationMs": 6890,
        "content": "If we give enough, if we learn to trust",
      },
      {
        "timeMs": 101720,
        "durationMs": 5120,
        "content": "But only love can say",
      },
      {
        "timeMs": 106840,
        "durationMs": 3660,
        "content": "Try again or walk away",
      },
      {
        "timeMs": 110500,
        "durationMs": 4380,
        "content": "But I believe for you and me",
      },
      {
        "timeMs": 114880,
        "durationMs": 2890,
        "content": "The sun will shine one day",
      },
      {
        "timeMs": 117770,
        "durationMs": 4560,
        "content": "So I'll just play my part",
      },
      {
        "timeMs": 122330,
        "durationMs": 4200,
        "content": "Pray you'll have a change of heart",
      },
      {
        "timeMs": 126530,
        "durationMs": 4790,
        "content": "But I can't make you see it through",
      },
      {
        "timeMs": 131320,
        "durationMs": 19300,
        "content": "That's something only love can do",
      },
      {
        "timeMs": 150620,
        "durationMs": 3570,
        "content": "I know if I could find the words",
      },
      {
        "timeMs": 154190,
        "durationMs": 3630,
        "content": "To touch you deep inside",
      },
      {
        "timeMs": 157820,
        "durationMs": 4010,
        "content": "You'd give our dream just one more chance",
      },
      {
        "timeMs": 161830,
        "durationMs": 7040,
        "content": "Don't let this be our last goodbye",
      },
      {
        "timeMs": 168870,
        "durationMs": 4780,
        "content": "But only love can say",
      },
      {
        "timeMs": 173650,
        "durationMs": 3980,
        "content": "Try again or walk away",
      },
      {
        "timeMs": 177630,
        "durationMs": 3990,
        "content": "But I believe for you and me",
      },
      {
        "timeMs": 181620,
        "durationMs": 3260,
        "content": "The sun will shine one day",
      },
      {
        "timeMs": 184880,
        "durationMs": 4610,
        "content": "So I'll just play my part",
      },
      {
        "timeMs": 189490,
        "durationMs": 6310,
        "content": "And pray you'll have a change of heart",
      },
      {
        "timeMs": 195800,
        "durationMs": 4030,
        "content": "But I can't make you see it through",
      },
      {
        "timeMs": 199830,
        "durationMs": 10140,
        "content": "That's something only love can do",
      },
      {
        "timeMs": 209970,
        "durationMs": 6090,
        "content": "That's something only love can do",
      },
      {"timeMs": 216060, "durationMs": 0, "content": "", "segments": []},
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
    final fakeJsonJa = [
      {"timeMs": 1380, "durationMs": 7150, "content": "午前2時、雨がまだ降り続いています"},
      {
        "timeMs": 8530,
        "durationMs": 7060,
        "content": "私たちはまたここに立っています、馴染みのある交差点で",
      },
      {"timeMs": 15590, "durationMs": 4470, "content": "あなたはとても混乱していると言いました"},
      {"timeMs": 20060, "durationMs": 3470, "content": "何も決められないと"},
      {"timeMs": 23530, "durationMs": 4240, "content": "これは運命なのでしょうか？"},
      {"timeMs": 27770, "durationMs": 3200, "content": "あなたは私にそう尋ねました"},
      {"timeMs": 30970, "durationMs": 5080, "content": "しかし、愛だけが答えを出せます"},
      {"timeMs": 36050, "durationMs": 4010, "content": "もう一度試すべきか、それとも諦めるべきか？"},
      {"timeMs": 40060, "durationMs": 3810, "content": "でも私は信じています、あなたと私のために"},
      {"timeMs": 43870, "durationMs": 2890, "content": "いつか太陽が昇るでしょう"},
      {"timeMs": 46760, "durationMs": 4810, "content": "だから私は自分の役割を果たすだけです"},
      {"timeMs": 51570, "durationMs": 4050, "content": "あなたが心を変えることを祈りながら"},
      {
        "timeMs": 55620,
        "durationMs": 4070,
        "content": "でも私はあなたにそれを見せることはできません",
      },
      {"timeMs": 59690, "durationMs": 11940, "content": "それは愛だけができることです"},
      {"timeMs": 71630, "durationMs": 8020, "content": "あなたの腕の中で、夜明けが訪れるとき"},
      {"timeMs": 79650, "durationMs": 7190, "content": "向かい合って、たとえ千マイル離れていても"},
      {
        "timeMs": 86840,
        "durationMs": 4250,
        "content": "私はあなたに理解してもらうために最善を尽くしました",
      },
      {"timeMs": 91090, "durationMs": 3740, "content": "痛みを超えた希望があることを"},
      {"timeMs": 94830, "durationMs": 6890, "content": "もし私たちが十分に与え、信じることを学べば"},
      {"timeMs": 101720, "durationMs": 5120, "content": "しかし、愛だけが答えを出せます"},
      {
        "timeMs": 106840,
        "durationMs": 3660,
        "content": "もう一度試すべきか、それとも諦めるべきか？",
      },
      {"timeMs": 110500, "durationMs": 4380, "content": "でも私は信じています、あなたと私のために"},
      {"timeMs": 114880, "durationMs": 2890, "content": "いつか太陽が昇るでしょう"},
      {"timeMs": 117770, "durationMs": 4560, "content": "だから私は自分の役割を果たすだけです"},
      {"timeMs": 122330, "durationMs": 4200, "content": "あなたが心を変えることを祈りながら"},
      {
        "timeMs": 126530,
        "durationMs": 4790,
        "content": "でも私はあなたにそれを見せることはできません",
      },
      {"timeMs": 131320, "durationMs": 19300, "content": "それは愛だけができることです"},
      {"timeMs": 150620, "durationMs": 3570, "content": "もし私が言葉を見つけることができたなら"},
      {"timeMs": 154190, "durationMs": 3630, "content": "あなたの心の奥深くに触れるための"},
      {
        "timeMs": 157820,
        "durationMs": 4010,
        "content": "あなたは私たちの夢にもう一度チャンスを与えるでしょう",
      },
      {"timeMs": 161830, "durationMs": 7040, "content": "これが私たちの最後の別れにならないように"},
      {"timeMs": 168870, "durationMs": 4780, "content": "しかし、愛だけが答えを出せます"},
      {
        "timeMs": 173650,
        "durationMs": 3980,
        "content": "もう一度試すべきか、それとも諦めるべきか？",
      },
      {"timeMs": 177630, "durationMs": 3990, "content": "でも私は信じています、あなたと私のために"},
      {"timeMs": 181620, "durationMs": 3260, "content": "いつか太陽が昇るでしょう"},
      {"timeMs": 184880, "durationMs": 4610, "content": "だから私は自分の役割を果たすだけです"},
      {"timeMs": 189490, "durationMs": 6310, "content": "そしてあなたが心を変えることを祈りながら"},
      {
        "timeMs": 195800,
        "durationMs": 4030,
        "content": "でも私はあなたにそれを見せることはできません",
      },
      {"timeMs": 199830, "durationMs": 10140, "content": "それは愛だけができることです"},
      {"timeMs": 209970, "durationMs": 6090, "content": "それは愛だけができることです"},
      {"timeMs": 216060, "durationMs": 0, "content": "", "segments": []},
    ];
    final fakeJsonVi = [
      {
        "timeMs": 1380,
        "durationMs": 7150,
        "content": "Hai giờ sáng, mưa vẫn rơi tí tách",
      },
      {
        "timeMs": 8530,
        "durationMs": 7060,
        "content": "Mình lại đứng đây, ngã ba đường quen thuộc",
      },
      {
        "timeMs": 15590,
        "durationMs": 4470,
        "content": "Em nói em bối rối quá nhiều",
      },
      {
        "timeMs": 20060,
        "durationMs": 3470,
        "content": "Không thể quyết định được điều gì",
      },
      {
        "timeMs": 23530,
        "durationMs": 4240,
        "content": "Liệu đây có phải là định mệnh?",
      },
      {"timeMs": 27770, "durationMs": 3200, "content": "Em hỏi anh như vậy"},
      {
        "timeMs": 30970,
        "durationMs": 5080,
        "content": "Nhưng chỉ có tình yêu mới trả lời được",
      },
      {
        "timeMs": 36050,
        "durationMs": 4010,
        "content": "Thử lại lần nữa hay là buông tay?",
      },
      {
        "timeMs": 40060,
        "durationMs": 3810,
        "content": "Nhưng anh tin rằng, cho cả em và anh",
      },
      {
        "timeMs": 43870,
        "durationMs": 2890,
        "content": "Rồi một ngày nắng sẽ lên",
      },
      {
        "timeMs": 46760,
        "durationMs": 4810,
        "content": "Vậy nên anh sẽ chỉ làm phần việc của mình",
      },
      {
        "timeMs": 51570,
        "durationMs": 4050,
        "content": "Mong em sẽ thay đổi ý định",
      },
      {
        "timeMs": 55620,
        "durationMs": 4070,
        "content": "Nhưng anh không thể bắt em thấy được",
      },
      {
        "timeMs": 59690,
        "durationMs": 11940,
        "content": "Chỉ có tình yêu mới làm được điều đó",
      },
      {
        "timeMs": 71630,
        "durationMs": 8020,
        "content": "Trong vòng tay em, khi bình minh hé rạng",
      },
      {
        "timeMs": 79650,
        "durationMs": 7190,
        "content": "Đối diện nhau, dù cách xa ngàn dặm",
      },
      {
        "timeMs": 86840,
        "durationMs": 4250,
        "content": "Anh đã cố hết sức để em hiểu",
      },
      {
        "timeMs": 91090,
        "durationMs": 3740,
        "content": "Vẫn còn hy vọng sau những khổ đau",
      },
      {
        "timeMs": 94830,
        "durationMs": 6890,
        "content": "Nếu ta cho đi đủ nhiều, nếu ta học cách tin tưởng",
      },
      {
        "timeMs": 101720,
        "durationMs": 5120,
        "content": "Nhưng chỉ có tình yêu mới trả lời được",
      },
      {
        "timeMs": 106840,
        "durationMs": 3660,
        "content": "Thử lại lần nữa hay là buông tay?",
      },
      {
        "timeMs": 110500,
        "durationMs": 4380,
        "content": "Nhưng anh tin rằng, cho cả em và anh",
      },
      {
        "timeMs": 114880,
        "durationMs": 2890,
        "content": "Rồi một ngày nắng sẽ lên",
      },
      {
        "timeMs": 117770,
        "durationMs": 4560,
        "content": "Vậy nên anh sẽ chỉ làm phần việc của mình",
      },
      {
        "timeMs": 122330,
        "durationMs": 4200,
        "content": "Mong em sẽ thay đổi ý định",
      },
      {
        "timeMs": 126530,
        "durationMs": 4790,
        "content": "Nhưng anh không thể bắt em thấy được",
      },
      {
        "timeMs": 131320,
        "durationMs": 19300,
        "content": "Chỉ có tình yêu mới làm được điều đó",
      },
      {
        "timeMs": 150620,
        "durationMs": 3570,
        "content": "Anh biết nếu anh tìm được lời",
      },
      {
        "timeMs": 154190,
        "durationMs": 3630,
        "content": "Để chạm đến sâu thẳm trái tim em",
      },
      {
        "timeMs": 157820,
        "durationMs": 4010,
        "content": "Em sẽ cho giấc mơ của mình thêm một cơ hội",
      },
      {
        "timeMs": 161830,
        "durationMs": 7040,
        "content": "Đừng để đây là lời tạm biệt cuối cùng",
      },
      {
        "timeMs": 168870,
        "durationMs": 4780,
        "content": "Nhưng chỉ có tình yêu mới trả lời được",
      },
      {
        "timeMs": 173650,
        "durationMs": 3980,
        "content": "Thử lại lần nữa hay là buông tay?",
      },
      {
        "timeMs": 177630,
        "durationMs": 3990,
        "content": "Nhưng anh tin rằng, cho cả em và anh",
      },
      {
        "timeMs": 181620,
        "durationMs": 3260,
        "content": "Rồi một ngày nắng sẽ lên",
      },
      {
        "timeMs": 184880,
        "durationMs": 4610,
        "content": "Vậy nên anh sẽ chỉ làm phần việc của mình",
      },
      {
        "timeMs": 189490,
        "durationMs": 6310,
        "content": "Và mong em sẽ thay đổi ý định",
      },
      {
        "timeMs": 195800,
        "durationMs": 4030,
        "content": "Nhưng anh không thể bắt em thấy được",
      },
      {
        "timeMs": 199830,
        "durationMs": 10140,
        "content": "Chỉ có tình yêu mới làm được điều đó",
      },
      {
        "timeMs": 209970,
        "durationMs": 6090,
        "content": "Chỉ có tình yêu mới làm được điều đó",
      },
      {"timeMs": 216060, "durationMs": 0, "content": "", "segments": []},
    ];
    final fakeJsonKo = [
      {"timeMs": 1380, "durationMs": 7150, "content": "새벽 두 시, 비가 여전히 내리고 있어요"},
      {
        "timeMs": 8530,
        "durationMs": 7060,
        "content": "우리는 다시 여기, 익숙한 삼거리에서 서 있어요",
      },
      {"timeMs": 15590, "durationMs": 4470, "content": "당신은 너무 혼란스럽다고 말했어요"},
      {"timeMs": 20060, "durationMs": 3470, "content": "결정을 내릴 수 없다고요"},
      {"timeMs": 23530, "durationMs": 4240, "content": "이게 운명일까요?"},
      {"timeMs": 27770, "durationMs": 3200, "content": "당신은 나에게 그렇게 물었어요"},
      {"timeMs": 30970, "durationMs": 5080, "content": "하지만 사랑만이 대답할 수 있어요"},
      {"timeMs": 36050, "durationMs": 4010, "content": "다시 시도할까요 아니면 포기할까요?"},
      {"timeMs": 40060, "durationMs": 3810, "content": "하지만 나는 당신과 나를 위해 믿어요"},
      {"timeMs": 43870, "durationMs": 2890, "content": "언젠가 태양이 떠오를 거예요"},
      {"timeMs": 46760, "durationMs": 4810, "content": "그래서 나는 내 역할만 할 거예요"},
      {"timeMs": 51570, "durationMs": 4050, "content": "당신이 마음을 바꾸기를 기도하며"},
      {
        "timeMs": 55620,
        "durationMs": 4070,
        "content": "하지만 나는 당신이 그것을 보게 할 수 없어요",
      },
      {"timeMs": 59690, "durationMs": 11940, "content": "그건 사랑만이 할 수 있는 일이에요"},
      {"timeMs": 71630, "durationMs": 8020, "content": "당신의 품 안에서, 새벽이 밝아올 때"},
      {
        "timeMs": 79650,
        "durationMs": 7190,
        "content": "서로 마주 보며, 천 마일 떨어져 있어도",
      },
      {"timeMs": 86840, "durationMs": 4250, "content": "나는 당신이 이해하도록 최선을 다했어요"},
      {"timeMs": 91090, "durationMs": 3740, "content": "고통 너머에 희망이 있다는 것을"},
      {
        "timeMs": 94830,
        "durationMs": 6890,
        "content": "우리가 충분히 주고, 신뢰하는 법을 배운다면",
      },
      {"timeMs": 101720, "durationMs": 5120, "content": "하지만 사랑만이 대답할 수 있어요"},
      {"timeMs": 106840, "durationMs": 3660, "content": "다시 시도할까요 아니면 포기할까요?"},
      {"timeMs": 110500, "durationMs": 4380, "content": "하지만 나는 당신과 나를 위해 믿어요"},
      {"timeMs": 114880, "durationMs": 2890, "content": "언젠가 태양이 떠오를 거예요"},
      {"timeMs": 117770, "durationMs": 4560, "content": "그래서 나는 내 역할만 할 거예요"},
      {"timeMs": 122330, "durationMs": 4200, "content": "당신이 마음을 바꾸기를 기도하며"},
      {
        "timeMs": 126530,
        "durationMs": 4790,
        "content": "하지만 나는 당신이 그것을 보게 할 수 없어요",
      },
      {"timeMs": 131320, "durationMs": 19300, "content": "그건 사랑만이 할 수 있는 일이에요"},
      {"timeMs": 150620, "durationMs": 3570, "content": "내가 말을 찾을 수 있다면"},
      {"timeMs": 154190, "durationMs": 3630, "content": "당신의 마음 깊은 곳을 감동시킬"},
      {
        "timeMs": 157820,
        "durationMs": 4010,
        "content": "당신은 우리의 꿈에 한 번 더 기회를 줄 거예요",
      },
      {
        "timeMs": 161830,
        "durationMs": 7040,
        "content": "이것이 우리의 마지막 작별 인사가 되지 않기를",
      },
      {"timeMs": 168870, "durationMs": 4780, "content": "하지만 사랑만이 대답할 수 있어요"},
      {"timeMs": 173650, "durationMs": 3980, "content": "다시 시도할까요 아니면 포기할까요?"},
      {"timeMs": 177630, "durationMs": 3990, "content": "하지만 나는 당신과 나를 위해 믿어요"},
      {"timeMs": 181620, "durationMs": 3260, "content": "언젠가 태양이 떠오를 거예요"},
      {"timeMs": 184880, "durationMs": 4610, "content": "그래서 나는 내 역할만 할 거예요"},
      {
        "timeMs": 189490,
        "durationMs": 6310,
        "content": "그리고 당신이 마음을 바꾸기를 기도하며",
      },
      {
        "timeMs": 195800,
        "durationMs": 4030,
        "content": "하지만 나는 당신이 그것을 보게 할 수 없어요",
      },
      {"timeMs": 199830, "durationMs": 10140, "content": "그건 사랑만이 할 수 있는 일이에요"},
      {"timeMs": 209970, "durationMs": 6090, "content": "그건 사랑만이 할 수 있는 일이에요"},
      {"timeMs": 216060, "durationMs": 0, "content": "", "segments": []},
    ];

    var fakeJson = switch (language) {
      "vi" => fakeJsonVi,
      "ko" => fakeJsonKo,
      "ja" => fakeJsonJa,

      _ => fakeJsonJa,
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
