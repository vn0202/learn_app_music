import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextTheme {
  static const TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 14),
    titleLarge: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),

    titleMedium: TextStyle(color: AppColors.textPrimary, fontSize: 18),
    titleSmall: TextStyle(color: AppColors.textSecondary, fontSize: 14),
  );
}
