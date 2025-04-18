import 'package:flutter/material.dart';
import 'package:music_app/models/genre.dart';
import 'package:music_app/routes/route_names.dart';

class GenreCard extends StatefulWidget {
  final Genre genre;
  final VoidCallback? action;
  const GenreCard({super.key, required this.action, required this.genre});

  @override
  State<GenreCard> createState() => _GenreCardState();
}

class _GenreCardState extends State<GenreCard> {
  double _scale = 1.0;
  void _onTapDown(TapDownDetails detail) {
    setState(() {
      _scale = 2;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(
            context,
            RouteNames.genre,
            arguments: {"genre": widget.genre},
          ),
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedScale(
              scale: _scale,
              duration: Duration(microseconds: 1000),
              child: Image.network(
                widget.genre.thumb,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.black45),
            ),
            Text(
              widget.genre.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
