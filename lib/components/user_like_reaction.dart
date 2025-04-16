import 'package:flutter/material.dart';
import 'package:music_app/themes/app_colors.dart';

class UserLikeReaction extends StatefulWidget {
  final bool showText;
  final bool? isLiked;
  final String videoId;
  const UserLikeReaction({
    super.key,
    required this.videoId,
    this.showText = true,
    this.isLiked,
  });

  @override
  _UserLikeReactionState createState() => _UserLikeReactionState();
}

class _UserLikeReactionState extends State<UserLikeReaction> {
  late bool _isLiked;

  @override
  void initState() {
    if (widget.isLiked == null) {
      // handle to get datebase
      _isLiked = true;
    } else {
      _isLiked = widget.isLiked!;
    }
    super.initState();
  }

  void toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.all(0),
          ),

          onPressed: toggleLike,
          child: Row(
            spacing: 8,
            children: [
              Icon(
                Icons.favorite,
                color: _isLiked ? AppColors.primary : Colors.grey,
              ),
              if (widget.showText)
                Text(
                  _isLiked ? 'Liked' : 'Like',
                  style: TextStyle(
                    color: _isLiked ? AppColors.primary : Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
