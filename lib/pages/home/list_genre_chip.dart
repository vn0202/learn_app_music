import 'package:flutter/material.dart';
import 'package:music_app/components/genre/genre_chip.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/services/genre_services.dart';
import 'package:music_app/themes/app_colors.dart';

class ListGenreChip extends StatefulWidget {
  const ListGenreChip({super.key});

  @override
  State<ListGenreChip> createState() => _ListGenreChipState();
}

class _ListGenreChipState extends State<ListGenreChip> {
  late Future<List<Genre>> _futureGenres;
  @override
  void initState() {
    _futureGenres = GenreServices().fetchGenres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 32),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 48,
        child: FutureBuilder(
          future: _futureGenres,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No genres.'));
              }
              final genres = snapshot.data!.sublist(4);
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),

                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return GenreChip(label: genre.name);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 12),
              );
            }
          },
        ),
      ),
    );
  }
}
