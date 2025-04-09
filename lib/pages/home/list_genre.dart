import 'package:flutter/material.dart';
import 'package:music_app/components/genre/genre_card.dart';

class ListGenre extends StatelessWidget {
  const ListGenre({super.key});

  @override
  Widget build(BuildContext context) {
    final genres = [
      {'title': "POP", 'imagePath': "assets/images/genres/pop-music.jpeg"},
      {'title': "ROCK", 'imagePath': "assets/images/genres/rock-music.jpeg"},
      {'title': "RB", 'imagePath': "assets/images/genres/rb-music.jpeg"},
      {
        'title': "Hip-hop",
        'imagePath': "assets/images/genres/hip-hoprap-music.jpeg",
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      itemCount: genres.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final genre = genres[index];
        return GenreCard(
          title: genre['title']!,
          imagePath: genre['imagePath']!,
          action: () {},
        );
      },
    );
  }
}
