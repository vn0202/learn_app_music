import 'package:flutter/material.dart';
import 'package:music_app/themes/app_colors.dart';

class GenreChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  const GenreChip({super.key, required this.label, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (icon != null) {
      children.add(Icon(icon, size: 18));
      children.add(SizedBox(width: 12));
    }
    children.add(Text(label, style: TextStyle(color: AppColors.textPrimary)));
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            top: BorderSide(width: 1, color: AppColors.border),
            left: BorderSide(width: 1, color: AppColors.border),
            right: BorderSide(width: 1, color: AppColors.border),
            bottom: BorderSide(width: 2, color: AppColors.border),
          ),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }
}
