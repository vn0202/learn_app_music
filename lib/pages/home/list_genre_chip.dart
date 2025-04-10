import 'package:flutter/material.dart';
import 'package:music_app/components/genre/genre_chip.dart';
import 'package:music_app/themes/app_colors.dart';

class ListGenreChip extends StatelessWidget {
  ListGenreChip({super.key});

  final List<Map<String, dynamic>> geners = [
    {"label": "Jazz"},
    {"label": "Country"},
    {"label": "Blue"},
    {"label": "Folk"},
    {"label": "Dance/EDM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 32),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 48,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: geners.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),

          itemBuilder: (context, index) {
            final genre = geners[index];
            return GenreChip(label: genre['label']);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 12),
        ),
      ),
    );
  }
}
