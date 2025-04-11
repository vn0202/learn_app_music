import 'package:music_app/models/genre.dart';

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
}
