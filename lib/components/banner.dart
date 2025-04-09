import 'package:flutter/material.dart';
import 'package:music_app/themes/app_colors.dart';
import 'package:music_app/themes/app_text_themes.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/banner/teenager-learning.png",
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Khám phá bài hát &\nhọc ngôn ngữ dễ dàng',
            textAlign: TextAlign.center,
            style: AppTextTheme.lightTextTheme.titleLarge!.copyWith(
              fontSize: 24,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
