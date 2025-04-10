import 'package:flutter/material.dart';
import 'package:music_app/enums/song_item_layout.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class SongItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final SongItemLayout layout;
  final VoidCallback? onTap;
  final Widget? trailing;
  const SongItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.layout = SongItemLayout.vertical,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    switch (layout) {
      case SongItemLayout.vertical:
        return _buildVerticalLayout();
      case SongItemLayout.verticalLarger:
        return _buildVerticalLargerLayout();
      case SongItemLayout.horizontal:
        return _buildHorizontalLayout();
    }
  }

  Widget _buildVerticalLayout() {
    return GestureDetector(
      onTap: onTap,
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
                    imagePath,
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
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      title,
                      style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      subtitle,
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

  Widget _buildVerticalLargerLayout() {
    return GestureDetector(
      onTap: onTap,
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
                    imagePath,
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
                      title,
                      style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      subtitle,
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

  Widget _buildHorizontalLayout() {
    return GestureDetector(
      onTap: () => {},
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
                  imagePath,
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
                    title,
                    style: AppTextTheme.lightTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    subtitle,
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
