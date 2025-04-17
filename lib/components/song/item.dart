import 'package:flutter/material.dart';
import 'package:music_app/enums/song_item_layout.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/routes/route_names.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class SongItem extends StatelessWidget {
  final Song song;
  final SongItemLayout layout;
  final VoidCallback? onTap;
  final Widget? trailing;
  const SongItem({
    super.key,
    required this.song,
    this.layout = SongItemLayout.vertical,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    switch (layout) {
      case SongItemLayout.vertical:
        return _buildVerticalLayout(context);
      case SongItemLayout.verticalLarger:
        return _buildVerticalLargerLayout(context);
      case SongItemLayout.horizontal:
        return _buildHorizontalLayout(context);
    }
  }

  Widget _buildVerticalLayout(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () => Navigator.pushNamed(
            context,
            RouteNames.songDetail,
            arguments: {'song': song},
          ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(width: 1, color: AppColors.border),
            left: BorderSide(width: 1, color: AppColors.border),
            right: BorderSide(width: 1, color: AppColors.border),
            bottom: BorderSide(width: 2.5, color: AppColors.border),
          ),
          color: AppColors.card,
        ),
        child: SizedBox(
          width: 160,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    song.imagePath,
                    height: 160,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,

                        song.name,
                        style: AppTextTheme.lightTextTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 30,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        song.singer,
                        style: AppTextTheme.lightTextTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalLargerLayout(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () => Navigator.pushNamed(
            context,
            RouteNames.songDetail,
            arguments: {'song': song},
          ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(width: 1, color: AppColors.border),
            left: BorderSide(width: 1, color: AppColors.border),
            right: BorderSide(width: 1, color: AppColors.border),
            bottom: BorderSide(width: 2.5, color: AppColors.border),
          ),
          color: AppColors.card,
        ),
        child: SizedBox(
          width: 284,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: AspectRatio(
                  aspectRatio: 9 / 6,
                  child: Image.network(
                    song.imagePath,
                    height: 160,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      song.name,
                      style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      song.singer,
                      style: AppTextTheme.lightTextTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalLayout(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () => Navigator.pushNamed(
            context,
            RouteNames.songDetail,
            arguments: {"song": song},
          ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(width: 1, color: AppColors.border),
            left: BorderSide(width: 1, color: AppColors.border),
            right: BorderSide(width: 2, color: AppColors.border),
            bottom: BorderSide(width: 2.5, color: AppColors.border),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  song.imagePath,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    song.name,
                    style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    song.singer,
                    style: AppTextTheme.lightTextTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
