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
}
