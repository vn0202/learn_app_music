import 'package:flutter/material.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    error: AppColors.error,
    onError: AppColors.onError,
  ),
  scaffoldBackgroundColor: AppColors.background,
  cardColor: AppColors.card,
  dividerColor: AppColors.divider,
  textTheme: AppTextTheme.lightTextTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.card,
    foregroundColor: AppColors.textPrimary,
    elevation: 0,
  ),
  useMaterial3: false,
);
