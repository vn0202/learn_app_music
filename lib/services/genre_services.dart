import 'package:music_app/models/genre.dart';
import 'package:music_app/models/song.dart';

class GenreServices {
  Future<List<Genre>> fetchGenres() async {
    await Future.delayed(Duration(seconds: 2));
    final fakeJson = [
      {
        "id": 1,
        "name": "Pop",
        "slug": "pop",
        "thumb": "https://picsum.photos/200/300?random=1",
      },
      {
        "id": 2,
        "name": "Rock",
        "slug": "rock",
        "thumb": "https://picsum.photos/200/300?random=2",
      },
      {
        "id": 3,
        "name": "Country",
        "slug": "country",
        "thumb": "https://picsum.photos/200/300?random=3",
      },
      {
        "id": 4,
        "name": "RB",
        "slug": "rb",
        "thumb": "https://picsum.photos/200/300?random=4",
      },
      {
        "id": 5,
        "name": "Dance",
        "slug": "dance",
        "thumb": "https://picsum.photos/200/300?random=3",
      },
      {
        "id": 6,
        "name": "Folk",
        "slug": "folk",
        "thumb": "https://picsum.photos/200/300?random=4",
      },
      {
        "id": 7,
        "name": "Jazz",
        "slug": "jazz",
        "thumb": "https://picsum.photos/200/300?random=5",
      },
      {
        "id": 8,
        "name": "Dance/EDM",
        "slug": "dance-edm",
        "thumb": "https://picsum.photos/200/300?random=6",
      },
    ];
    return fakeJson.map((item) => Genre.fromJson(item)).toList();
  }

  Future<List<Song>> getListSong({
    required int genreId,
    int offset = 0,
    int limit = 10,
  }) async {
    await Future.delayed(Duration(seconds: 3));

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
      {
        "id": 5,
        "videoId": "kPa7bsKwL-c",
        "name": "As long as you love me",
        "singer": "Backstreet Boy",
        "imagePath": "https://picsum.photos/200/300",
      },
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

    try {
      return fakeJson
          .sublist(offset, limit)
          .map((json) => Song.fromJson(json))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
