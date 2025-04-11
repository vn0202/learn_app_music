import 'package:flutter/material.dart';
import 'package:music_app/components/genre/genre_card.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/services/genre_services.dart';

class ListGenre extends StatefulWidget {
  const ListGenre({super.key});

  @override
  State<ListGenre> createState() => _ListGenreState();
}

class _ListGenreState extends State<ListGenre> {
  late Future<List<Genre>> _futureGenres;

  @override
  void initState() {
    _futureGenres = GenreServices().fetchGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureGenres,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No genres.'));
          }
          final genres = snapshot.data!.sublist(0, 4);
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
              return GenreCard(action: () {}, genre: genre);
            },
          );
        }
      },
    );
  }
}
